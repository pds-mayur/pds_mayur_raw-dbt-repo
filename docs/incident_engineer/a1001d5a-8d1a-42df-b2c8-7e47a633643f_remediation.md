# Incident remediation: `a1001d5a-8d1a-42df-b2c8-7e47a633643f`

## RCA summary
The SQL query references an invalid column name 'CUSTOMERID' instead of the correct 'CUSTOMER_ID'.

## Confidence score
0.9

## Validation
- Patch scope validated: **True**

### Recommended steps
- Navigate to the fct_orders.sql file located at models/marts/orders/fct_orders.sql.
- Replace 'customerid' with 'CUSTOMER_ID' in the SQL query.
- Commit the changes and create a pull request for review.

## Proposed patches

### Patch 1: `models/marts/orders/fct_orders.sql`
_Fix invalid identifier by updating 'customerid' to 'CUSTOMER_ID'._

```
with source_data as (
    select *
    from ECOMMERCE_DB.RAW.ORDERS
)

select
    order_id,
    CUSTOMER_ID,
    order_date,
    status
from source_data
```
