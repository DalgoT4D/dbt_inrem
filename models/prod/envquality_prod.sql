-- these behaviours all have parent_type = 'Village Tracker'
{{ 
  config(
    materialized='table',
  ) 
}}

SELECT 
    villagetracker_prod.villageentity_id,
    villagetracker_prod.latitude,
    villagetracker_prod.longitude,
    envquality_by_villageentity.reporting_date AS reporting_date,
    EXTRACT(YEAR FROM DATE(envquality_by_villageentity.reporting_date)) as reporting_year,
    EXTRACT(MONTH FROM DATE(envquality_by_villageentity.reporting_date)) as reporting_month,
    FORMAT_DATE('%Y-%m', DATE(envquality_by_villageentity.reporting_date)) as reporting_year_month,
    envquality_by_villageentity.purpose_of_test AS purpose_of_test,
    envquality_by_villageentity.description_of_environmental_source AS description_of_environmental_source,
    envquality_by_villageentity.sample_ref AS sample_ref,
    envquality_by_villageentity.test_narrative AS test_narrative,
    envquality_by_villageentity.test_method AS test_method,
    envquality_by_villageentity.test_vendor AS test_vendor,
    envquality_by_villageentity.test_options AS test_options,
    envquality_by_villageentity.environmental_parameter AS environmental_parameter,
    envquality_by_villageentity.environmental_concentration AS environmental_concentration,
    envquality_by_villageentity.environmental_unit AS environmental_unit,
    envquality_by_villageentity.environmental_safety AS environmental_safety,
    envquality_by_villageentity.is_tested AS is_tested,
    envquality_by_villageentity.approval_status AS approval_status,
    villagetracker_prod.villagename,
    villagetracker_prod.statename,
    villagetracker_prod.districtname,
    villagetracker_prod.blockname,
    villagetracker_prod.grampanchname
FROM {{ref('envquality_by_villageentity')}} AS envquality_by_villageentity
    
JOIN
    {{ref('villagetracker_prod')}} as villagetracker_prod
ON envquality_by_villageentity.villagetracker_id = villagetracker_prod.villagetracker_id

WHERE reporting_date IS NOT NULL
