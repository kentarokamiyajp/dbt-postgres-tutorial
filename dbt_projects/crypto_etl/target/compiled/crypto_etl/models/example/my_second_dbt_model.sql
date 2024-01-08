-- Use the `ref` function to select from other models

select *
from "crypto_db"."crypto_candles"."my_first_dbt_model"
where id = 1