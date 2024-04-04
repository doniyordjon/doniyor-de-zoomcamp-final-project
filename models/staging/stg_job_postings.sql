{{ config(materialized='view') }}

SELECT p.*
FROM (
    SELECT cast(company_id as int) as company_id, 
    title,
    med_salary,
    formatted_work_type,
    location,
    sponsored,
    ROW_NUMBER() OVER(PARTITION BY cast(company_id as int) ORDER BY title) seq
    FROM {{ source('staging', 'job_postings') }}
) p
WHERE seq = 1