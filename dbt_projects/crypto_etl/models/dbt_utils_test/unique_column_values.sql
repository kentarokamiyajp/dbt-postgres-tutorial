select
  dt,
  {{ dbt_utils.pivot(
      'id',
      dbt_utils.get_column_values(source('crypto_db','crypto_candles'), 'id')
  ) }}
from 
  {{ source('crypto_db','crypto_candles') }}
group by dt