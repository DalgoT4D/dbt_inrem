--DBT AUTOMATION has generated this model, please DO NOT EDIT 

{{ config(materialized='table',) }}
SELECT {{dbt_utils.star(from=ref('fl1213_mar21_2016'), except=["DistrictName","DistrictName_1"])}}, COALESCE(`DistrictName`, `DistrictName_1`) AS DistrictName FROM {{ref('fl1213_mar21_2016')}}
