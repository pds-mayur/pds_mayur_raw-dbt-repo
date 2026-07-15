SELECT
    $1,
    $2,
    $3
FROM @~/missing/customers_2025_01_01.csv
(FILE_FORMAT = (TYPE = CSV, SKIP_HEADER = 1));