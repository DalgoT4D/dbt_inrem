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
    villagetracker_prod.villageentity_id,
    grouped_by_report.reporting_date AS reporting_date,
    EXTRACT(YEAR FROM DATE(grouped_by_report.reporting_date)) as reporting_year,
    EXTRACT(MONTH FROM DATE(grouped_by_report.reporting_date)) as reporting_month,
    FORMAT_DATE('%Y-%m', DATE(grouped_by_report.reporting_date)) as reporting_year_month,
    grouped_by_report.overall_environmental_safety,
    villagetracker_prod.villagename,
    villagetracker_prod.statename,
    villagetracker_prod.districtname,
    villagetracker_prod.blockname,
    villagetracker_prod.grampanchname
  FROM 
    grouped_by_report
  JOIN
    {{ref('villagetracker_prod')}} as villagetracker_prod
ON grouped_by_report.villagetracker_id = villagetracker_prod.villagetracker_id
    
WHERE reporting_date IS NOT NULL
