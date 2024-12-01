
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      name AS village_id, 
      village AS name, 
      state AS state,
      block AS block_id,
      district AS district_id,
      grampanch AS grampanch_id
FROM {{source('inrem','Village')}}