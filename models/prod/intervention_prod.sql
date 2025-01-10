-- these interventions all have parent_type = 'Village Tracker'
{{ 
  config(
    materialized='table',
  ) 
}}

SELECT 
    intervention_id,
    intervention_type,
    villageentity_id,
    date_begin as date_begin,
    reporting_date AS reporting_date,
    EXTRACT(YEAR FROM DATE(reporting_date)) as reporting_year,
    EXTRACT(MONTH FROM DATE(reporting_date)) as reporting_month,
    FORMAT_DATE('%Y-%m', DATE(reporting_date)) as reporting_year_month,
    status,
    implementor,
    num_households,
    freq,
    idx,
    villagehierarchy.villagename,
    villagehierarchy.statename,
    villagehierarchy.districtname,
    villagehierarchy.blockname,
    villagehierarchy.grampanchname
FROM {{ref('interventions')}} AS interventions
    
JOIN
    {{ref('village_to_village_tracker')}} as V2VT
ON interventions.villagetracker_id = V2VT.villagetracker_id
    
JOIN
    {{ref('villagehierarchy')}} AS villagehierarchy
ON V2VT.village_id = villagehierarchy.village_id

WHERE reporting_date IS NOT NULL