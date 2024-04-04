{{ config(materialized='table') }}


SELECT company_id, industry
FROM (
    SELECT company_id, industry, ROW_NUMBER() OVER(PARTITION BY company_id ORDER BY industry) seq
    FROM {{ ref('company_industries') }}
) 
WHERE seq = 1