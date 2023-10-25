
{{ 
  config(
    materialized='table',
    indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ]
  ) 
}}
    SELECT _airbyte_ab_id 
, json_value(_airbyte_data, '$."7676"') as `c7676`
, json_value(_airbyte_data, '$."A"') as `A`
, json_value(_airbyte_data, '$."B"') as `B`
, json_value(_airbyte_data, '$."Fluoride habitations"') as `Fluoride_habitations`
, json_value(_airbyte_data, '$."C"') as `C`
, json_value(_airbyte_data, '$."affected_flouride"') as `affected_flouride`
, json_value(_airbyte_data, '$."Block_Name.1"') as `Block_Name_1`
, json_value(_airbyte_data, '$."Block_Name.2"') as `Block_Name_2`
, json_value(_airbyte_data, '$."Block_Name.3"') as `Block_Name_3`
, json_value(_airbyte_data, '$."F habitation class"') as `F_habitation_class`
, json_value(_airbyte_data, '$."State.1"') as `State_1`
, json_value(_airbyte_data, '$."State.2"') as `State_2`
, json_value(_airbyte_data, '$."Block_Name"') as `Block_Name`
, json_value(_airbyte_data, '$."Unnamed: 12"') as `Unnamed__12`
, json_value(_airbyte_data, '$."!A2:A"') as `_A2_A`
, json_value(_airbyte_data, '$."Sheet1"') as `Sheet1`
, json_value(_airbyte_data, '$."Unnamed: 18"') as `Unnamed__18`
, json_value(_airbyte_data, '$."Unnamed: 19"') as `Unnamed__19`
, json_value(_airbyte_data, '$."Unnamed: 16"') as `Unnamed__16`
, json_value(_airbyte_data, '$."_"') as `_`
, json_value(_airbyte_data, '$."_.1"') as `__1`
, json_value(_airbyte_data, '$."affected_flouride.1"') as `affected_flouride_1`
, json_value(_airbyte_data, '$."\'"') as `__b`
, json_value(_airbyte_data, '$."\'.1"') as `__1_b`
, json_value(_airbyte_data, '$."Unnamed: 5"') as `Unnamed__5`
, json_value(_airbyte_data, '$."Unnamed: 6"') as `Unnamed__6`
, json_value(_airbyte_data, '$."State"') as `State`
FROM {{source('inrem','guj_wq')}}