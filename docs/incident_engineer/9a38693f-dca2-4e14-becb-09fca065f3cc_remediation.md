# Incident remediation: `9a38693f-dca2-4e14-becb-09fca065f3cc`

## RCA summary
Database 'RAW_DB' does not exist or not authorized.

## Confidence score
1.0

## Validation
- Patch scope validated: **False**

### Recommended steps
- Review the suggested dbt/Jinja correction in remediation.md
- Confirm the variable/default value with the project owner
- Apply the SQL change manually after review
- Run dbt build --select affected_model

## Suggested correction for review

### Manual dbt/SQL remediation required
Target file: `models/staging/stg_customers.sql`

No SQL file was patched because Snowflake database 'RAW_DB' does not exist or is not authorized, and no close verified database match was found in the Snowflake catalog. Review the dbt error and model SQL together, then apply only a correction that is confirmed by the project context. Primary dbt error: Database Error in model stg_customers (models/staging/stg_customers.sql) | 002003 (02000): SQL compilation error: | Database 'RAW_DB' does not exist or not authorized. | compiled code at target/run/real_time_project/models/staging/stg_customers.sql.

```sql
-- dbt / Snowflake null in non-nullable column

WITH source_data AS (
    SELECT
        NULL AS product_id,
        product_name
    FROM ECOMMERCE_DB.RAW.PRODUCTS
)

SELECT *
FROM source_data
```

### Possible reviewed patches

#### Review the current model SQL
Use this as the starting point for a human-reviewed fix; no automatic SQL edit was considered safe.
```sql
-- dbt / Snowflake null in non-nullable column

WITH source_data AS (
    SELECT
        NULL AS product_id,
        product_name
    FROM RAW_DB.RAW_SCHEMA.PRODUCTS
)

SELECT *
FROM source_data
```

#### LLM suggested sql patch for review
Updated database reference from RAW_DB to ECOMMERCE_DB.RAW.
```sql
-- dbt / Snowflake null in non-nullable column

WITH source_data AS (
    SELECT
        NULL AS product_id,
        product_name
    FROM ECOMMERCE_DB.RAW.PRODUCTS
)

SELECT *
FROM source_data
```

#### Review valid Snowflake databases
Use these catalog database names to choose a manually verified SQL change.
```sql
ECOMMERCE_DB
SNOWFLAKE
SNOWFLAKE_LEARNING_DB
SNOWFLAKE_SAMPLE_DATA
USER$MAYUR44
```

## Proposed patches
