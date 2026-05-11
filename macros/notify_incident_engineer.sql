{% macro notify_incident_engineer(results) %}
  {# 
    dbt on-run-end hook:
    - scans run results for failures
    - sends one API call per failure
    Env vars expected:
      INCIDENT_ENGINEER_API_URL (example: http://127.0.0.1:8000/api/v1/incidents)
      INCIDENT_ENGINEER_API_KEY
      INCIDENT_ENGINEER_ENVIRONMENT (default: prod)
  #}

  {% set api_url = env_var("INCIDENT_ENGINEER_API_URL", "http://127.0.0.1:8000/api/v1/incidents") %}
  {% set api_key = env_var("INCIDENT_ENGINEER_API_KEY", "") %}
  {% set environment = env_var("INCIDENT_ENGINEER_ENVIRONMENT", "prod") %}
  {% set invocation_id = invocation_id %}

  {% if not execute %}
    {{ return("notify_incident_engineer skipped (compile mode)") }}
  {% endif %}

  {% set requests = modules.import("requests") %}
  {% set failures = [] %}

  {% for result in results %}
    {% if result.status in ["error", "fail"] %}
      {% do failures.append(result) %}
    {% endif %}
  {% endfor %}

  {% if failures | length == 0 %}
    {{ log("notify_incident_engineer: no failures detected", info=True) }}
    {{ return("no failures") }}
  {% endif %}

  {% for failed in failures %}
    {% set failed_job = failed.node.package_name if failed.node and failed.node.package_name else "dbt_run" %}
    {% set failed_model = failed.node.name if failed.node and failed.node.name else "unknown_model" %}
    {% set error_message = failed.message if failed.message else "dbt execution failed" %}
    {% set run_started_at = run_started_at if run_started_at is defined else none %}
    {% set adapter_response = failed.adapter_response if failed.adapter_response is defined else {} %}
    {% set node_resource_type = failed.node.resource_type if failed.node and failed.node.resource_type is defined else "model" %}
    {% set node_path = failed.node.path if failed.node and failed.node.path is defined else none %}
    {% set node_database = failed.node.database if failed.node and failed.node.database is defined else none %}
    {% set node_schema = failed.node.schema if failed.node and failed.node.schema is defined else none %}
    {% set node_alias = failed.node.alias if failed.node and failed.node.alias is defined else none %}
    {% set node_unique_id = failed.node.unique_id if failed.node and failed.node.unique_id is defined else none %}

    {% set payload = {
      "environment": environment,
      "failed_job": failed_job,
      "failed_model": failed_model,
      "error_message": error_message,
      "invocation_id": invocation_id,
      "source_system": "dbt",
      "logs": error_message,
      "artifacts": {
        "run_results": {
          "status": failed.status,
          "execution_time": failed.execution_time,
          "adapter_response": adapter_response
        }
      },
      "lineage": {
        "resource_type": node_resource_type
      },
      "raw_payload": {
        "dbt_status": failed.status,
        "execution_time": failed.execution_time,
        "run_started_at": run_started_at,
        "resource_type": node_resource_type,
        "node_path": node_path,
        "node_database": node_database,
        "node_schema": node_schema,
        "node_alias": node_alias,
        "node_unique_id": node_unique_id
      }
    } %}

    {% set headers = {"Content-Type": "application/json"} %}
    {% if api_key %}
      {% do headers.update({"x-api-key": api_key}) %}
    {% endif %}

    {% set max_retries = 3 %}
    {% set timeout_seconds = 5 %}
    {% set sent = False %}

    {% for _ in range(max_retries) %}
      {% if sent %}
        {% break %}
      {% endif %}
      {% set response = requests.post(api_url, json=payload, headers=headers, timeout=timeout_seconds) %}
      {% if response.status_code < 300 %}
        {% set sent = True %}
        {{ log("notify_incident_engineer: incident sent for " ~ failed_model, info=True) }}
      {% endif %}
    {% endfor %}

    {% if not sent %}
      {{ log("notify_incident_engineer: failed to send incident for " ~ failed_model, info=True) }}
    {% endif %}
  {% endfor %}

  {{ return("incident notifications attempted") }}
{% endmacro %}