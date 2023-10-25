--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 

{{ config(materialized="table") }}

SELECT REGEXP_EXTRACT(`AboveP`, r'\[(\d+\.\d+)')
                            AS `AboveP`, {{ dbt_utils.star(from=ref("xmldata_1"), except=["AboveP"]) }}
FROM 
  {{ ref("xmldata_1") }}