--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 

{{ config(materialized='table', schema='intermediate_inrem') }}
SELECT *, CONCAT(`DistrictName`,',',`StateName`) AS DistrictState FROM {{ref('fl1011_mar16_2016')}}
