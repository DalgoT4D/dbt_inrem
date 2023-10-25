
{{ 
  config(
    materialized='table',
    indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ]
  ) 
}}
    SELECT _airbyte_ab_id 
, json_value(_airbyte_data, '$."file"') as `file`
, json_value(_airbyte_data, '$."num"') as `num`
, json_value(_airbyte_data, '$."pageo"') as `pageo`
, json_value(_airbyte_data, '$."sheet"') as `sheet`
, json_value(_airbyte_data, '$."row"') as `row`
FROM {{source('inrem','num_pageo')}}