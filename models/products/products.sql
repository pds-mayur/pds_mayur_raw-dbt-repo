-- dbt compilation error: Source not found
-- Common when referencing a source in dbt model using the source() function, but the source or table has not been defined in schema.yml.
WITH source_data AS (
    -- ERROR: Referencing 'non_existent_source' and 'invalid_table' which are not defined in any schema.yml file!
    SELECT *
    FROM {{ source('non_existent_source', 'invalid_table') }}
),

cleaned_products AS (
    SELECT
        product_id,
        TRIM(product_name) AS product_name,
        CURRENT_TIMESTAMP() AS loaded_at
    FROM source_data
)

SELECT *
FROM cleaned_products
