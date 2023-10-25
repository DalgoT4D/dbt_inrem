--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 

{{ config(materialized="table") }}

SELECT {{ dbt_utils.star(from=ref("fl1112_mar21_2016_dropped"),except=["VillageName","StateName"]) }}, `VillageName` AS `Village`, `StateName` AS `State`
FROM 
  {{ ref("fl1112_mar21_2016_dropped") }}