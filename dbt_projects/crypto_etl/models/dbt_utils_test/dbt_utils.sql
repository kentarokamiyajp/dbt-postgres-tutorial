{{ dbt_utils.log_info('Starting transformation') }}

WITH star_output AS (
  SELECT 
    {{ dbt_utils.star(from=ref('weekly_avg_price'),
                      except=['open', 'low', 'high']) }},
    '{{ dbt_utils.pretty_time(format='%Y-%m-%d %H:%M:%S') }}' AS ts_check
  FROM {{ ref('weekly_avg_price') }}
)
SELECT * FROM star_output

{{ dbt_utils.log_info('Finished transformation') }}