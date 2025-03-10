-- these interventions all have parent_type = 'Village Tracker'
{{ 
  config(
    materialized='table',
  ) 
}}

SELECT 
    interventions.intervention_id,
    interventions.intervention_type,
    villagetracker_prod.villageentity_id,
    interventions.date_begin as date_begin,
    interventions.reporting_date AS reporting_date,
    EXTRACT(YEAR FROM DATE(interventions.reporting_date)) as reporting_year,
    EXTRACT(MONTH FROM DATE(interventions.reporting_date)) as reporting_month,
    FORMAT_DATE('%Y-%m', DATE(interventions.reporting_date)) as reporting_year_month,
    interventions.status,
    interventions.implementor,
    interventions.num_households,
    interventions.freq,
    interventions.idx,
    villagetracker_prod.villagename,
    villagetracker_prod.statename,
    villagetracker_prod.districtname,
    villagetracker_prod.blockname,
    villagetracker_prod.grampanchname
FROM {{ref('interventions')}} AS interventions
    
JOIN
    {{ref('villagetracker_prod')}} as villagetracker_prod
ON interventions.villagetracker_id = villagetracker_prod.villagetracker_id

WHERE reporting_date IS NOT NULL