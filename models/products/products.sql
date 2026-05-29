-- dbt / Snowflake variant cast failure

WITH json_data AS (

    SELECT PARSE_JSON('{"price":"abc"}') AS raw_json
)

SELECT
    raw_json:price::NUMBER AS price
FROM json_data
