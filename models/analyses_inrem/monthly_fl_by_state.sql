{{ config(materialized='table',) }}

SELECT 
  StateName,
  PARSE_DATE(
    '%Y-%m-%d', 
    CAST(TestingYear AS STRING) || '-' || CAST(TestingMonth AS STRING) || '-01'
  ) AS first_of_month,
  Avg, 
  Max
FROM (
  SELECT 
    StateName,
    EXTRACT(YEAR FROM TestingDate) AS TestingYear,
    EXTRACT(MONTH FROM TestingDate) AS TestingMonth,
    AVG(CAST(Fluoride_in_PPM AS FLOAT64)) AS Avg,
    MAX(CAST(Fluoride_in_PPM AS FLOAT64)) AS Max,
  FROM (
    SELECT
      StateName,
      PARSE_DATE('%d/%m/%Y', LabTestingDate) AS TestingDate,
      Fluoride_in_PPM
    FROM {{ref('fluoride')}}
    WHERE Fluoride_in_PPM IS NOT NULL
  )
  GROUP BY StateName, TestingYear, TestingMonth
  ORDER BY TestingYear, TestingMonth
)