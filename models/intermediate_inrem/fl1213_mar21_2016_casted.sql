--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 

{{ config(materialized='table',) }}
SELECT {{dbt_utils.star(from=ref('fl1213_mar21_2016'), except=["row"])}}, CAST(`row` AS int) AS `row` FROM {{ref('fl1213_mar21_2016')}}
