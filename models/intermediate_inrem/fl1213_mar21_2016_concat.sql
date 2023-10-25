--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 

{{ config(materialized='table', schema='intermediate_inrem') }}
SELECT *, CONCAT(`DistrictName`,',',`StateName`) AS DistrictNameStateName FROM {{ref('fl1213_mar21_2016')}}
