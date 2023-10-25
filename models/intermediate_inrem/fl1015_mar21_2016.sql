
{{ 
  config(
    materialized='table',
    indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ]
  ) 
}}
    SELECT _airbyte_ab_id 
, json_value(_airbyte_data, '$."Sampleno"') as `Sampleno`
, json_value(_airbyte_data, '$."HabitationName"') as `HabitationName`
, json_value(_airbyte_data, '$."DistrictName"') as `DistrictName`
, json_value(_airbyte_data, '$."VillageName"') as `VillageName`
, json_value(_airbyte_data, '$."PanchayatName"') as `PanchayatName`
, json_value(_airbyte_data, '$."StateName"') as `StateName`
, json_value(_airbyte_data, '$."BlockName"') as `BlockName`
, json_value(_airbyte_data, '$."Fluoride (mg/l)"') as `Fluoride__mg_l_`
, json_value(_airbyte_data, '$."LabTestingDate"') as `LabTestingDate`
, json_value(_airbyte_data, '$."Lab"') as `Lab`
, json_value(_airbyte_data, '$."TypeOfSource"') as `TypeOfSource`
, json_value(_airbyte_data, '$."Location"') as `Location`
FROM {{source('inrem','fl1015_mar21_2016')}}