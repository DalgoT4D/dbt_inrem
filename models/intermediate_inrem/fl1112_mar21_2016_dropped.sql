--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 

{{ config(materialized="table", schema="intermediate_inrem") }}
SELECT {{ dbt_utils.star(from=ref("fl1112_mar21_2016"), except=["DistrictName","BlockName"]) }} FROM {{ref("fl1112_mar21_2016")}}
