
{{ 
  config(
    materialized='table',
    indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ]
  ) 
}}
    SELECT _airbyte_ab_id 
, json_value(_airbyte_data, '$."Unnamed: 3"') as `Unnamed__3`
, json_value(_airbyte_data, '$."District Name"') as `District_Name`
, json_value(_airbyte_data, '$."SNo."') as `SNo_`
, json_value(_airbyte_data, '$."Unnamed: 1"') as `Unnamed__1`
FROM {{source('inrem','fl_allstates_2015')}}