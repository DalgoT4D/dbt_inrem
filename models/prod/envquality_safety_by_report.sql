{{ 
  config(
    materialized='table',
  ) 
}}

WITH grouped_by_report AS (
  SELECT 
      villagetracker_id, 
      reporting_date, 
      CASE 
          WHEN COUNTIF(`environmental_safety` = 'Unsafe') > 0 THEN 'Unsafe'
          ELSE 'Safe'
      END AS overall_environmental_safety
  FROM {{ref('envquality_by_villageentity')}} AS envquality_by_villageentity
  GROUP BY 
      villagetracker_id, 
      reporting_date
)
SELECT DISTINCT
    vttve.villageentity_id,
    grouped_by_report.reporting_date AS reporting_date,
    EXTRACT(YEAR FROM DATE(grouped_by_report.reporting_date)) as reporting_year,
    EXTRACT(MONTH FROM DATE(grouped_by_report.reporting_date)) as reporting_month,
    FORMAT_DATE('%Y-%m', DATE(grouped_by_report.reporting_date)) as reporting_year_month,
    grouped_by_report.overall_environmental_safety,
    villagehierarchy.villagename,
    villagehierarchy.statename,
    villagehierarchy.districtname,
    villagehierarchy.blockname,
    villagehierarchy.grampanchname
  FROM 
    grouped_by_report
  JOIN
    {{ref('village_tracker_to_village_entity')}} as vttve
ON grouped_by_report.villagetracker_id = vttve.villagetracker_id
    
JOIN
    {{ref('village_to_village_entity')}} AS v2ve
ON vttve.villageentity_id = v2ve.villageentity_id

JOIN
    {{ref('villagehierarchy')}} AS villagehierarchy
ON v2ve.village_id = villagehierarchy.village_id

WHERE reporting_date IS NOT NULL
