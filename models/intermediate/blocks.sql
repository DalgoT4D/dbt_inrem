
{{ 
  config(
    materialized='table',
  ) 
}}
    SELECT 
      name AS block_id, 
      Block.block AS name, 
      state AS state,
      district AS district_id
FROM {{source('inrem','Block')}}