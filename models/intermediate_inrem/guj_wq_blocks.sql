
{{ 
  config(
    materialized='table',
    indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ]
  ) 
}}
    SELECT _airbyte_ab_id 
, json_value(_airbyte_data, '$."Block_Name"') as `Block_Name`
, json_value(_airbyte_data, '$."Fluoride habitations"') as `Fluoride_habitations`
, json_value(_airbyte_data, '$."State"') as `State`
FROM {{source('inrem','guj_wq_blocks')}}