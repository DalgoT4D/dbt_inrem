-- these interventions all have parent_type = 'Village Tracker'
{{ 
  config(
    materialized='table',
  ) 
}}

SELECT 
    intervention_id,
    intervention_type,
    DATE(intervention_date) as intervention_date,
    EXTRACT(YEAR FROM DATE(intervention_date)) as intervention_year,
    EXTRACT(MONTH FROM DATE(intervention_date)) as intervention_month,
    FORMAT_DATE('%Y-%m', DATE(intervention_date)) as intervention_year_month,
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

WHERE intervention_date IS NOT NULL