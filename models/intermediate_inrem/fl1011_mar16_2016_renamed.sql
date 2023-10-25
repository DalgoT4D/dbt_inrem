--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 

{{ config(materialized="table") }}

SELECT {{ dbt_utils.star(from=ref("fl1011_mar16_2016_concat"), except=["BlockName","StateName"]) }}, `BlockName`
                    AS `Block`, `StateName`
                    AS `State`
FROM 
  {{ ref("fl1011_mar16_2016_concat") }}