--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 

{{ config(materialized="table", schema="intermediate_inrem") }}
SELECT {{ dbt_utils.star(from=ref("fl1011_mar16_2016_concat"), except=["_airbyte_ab_id","BlockName"]) }} FROM {{ref("fl1011_mar16_2016_concat")}}
