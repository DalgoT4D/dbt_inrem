--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 

{{ config(materialized='table',) }}
SELECT {{dbt_utils.star(from=ref('fl1011_mar21_2016'), except=["row","Fluoride__mg_l_"])}}, CAST(`row` AS int) AS `row`, CAST(`Fluoride__mg_l_` AS float64) AS `Fluoride__mg_l_` FROM {{ref('fl1011_mar21_2016')}}
