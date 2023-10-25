
{{ 
  config(
    materialized='table',
    indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ]
  ) 
}}
    SELECT _airbyte_ab_id 
, json_value(_airbyte_data, '$."DistrictName"') as `DistrictName`
, json_value(_airbyte_data, '$."Avg Fluoride Value (mg/l)"') as `Avg_Fluoride_Value__mg_l_`
, json_value(_airbyte_data, '$."State"') as `State`
, json_value(_airbyte_data, '$."Unnamed: 2"') as `Unnamed__2`
, json_value(_airbyte_data, '$."No of reported high values"') as `No_of_reported_high_values`
FROM {{source('inrem','summary_201314')}}