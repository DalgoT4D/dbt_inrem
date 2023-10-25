--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 

{{ config(materialized='table',schema='intermediate_inrem') }}
SELECT *,Fluoride__mg_l_ * 1000  AS product  FROM {{ref('fl1011_mar16_2016_cast')}}
