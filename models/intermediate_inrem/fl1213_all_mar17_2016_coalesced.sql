--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 

{{ config(materialized='table',) }}
SELECT {{dbt_utils.star(from=ref('fl1213_all_mar17_2016'), except=["HabitationName","HabitationName_1"])}}, COALESCE(`HabitationName`, `HabitationName_1`) AS HabitationName FROM {{ref('fl1213_all_mar17_2016')}}
