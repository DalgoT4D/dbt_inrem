--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 

{{ config(materialized='table',schema='intermediate_inrem') }}
SELECT *,{{dbt_utils.safe_divide('row','2',)}} AS row_plus_sampleno  FROM {{ref('fl1213_mar21_2016_casted')}}
