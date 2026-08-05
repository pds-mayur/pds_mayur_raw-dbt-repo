{{
    config(
        materialized='view',

        pre_hook=[
            "
            COPY INTO ECOMMERCE_DB.RAW.ERP_ORDERS
            FROM @ECOMMERCE_DB.RAW.ERP_STAGE/orders/
            FILES = ('orders_2026_07_25_040000.csv')
            FILE_FORMAT = (
                FORMAT_NAME = 'ECOMMERCE_DB.RAW.CSV_STANDARD'
            )
            ON_ERROR = 'ABORT_STATEMENT'
            FORCE = TRUE
            "
        ]
    )
}}

select
    current_timestamp() as load_attempted_at
