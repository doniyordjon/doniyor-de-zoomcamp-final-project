{{ config(materialized='view') }}

SELECT p.*
FROM (
    SELECT company_id, 
    name,
    state,
    country,
    city,
    ROW_NUMBER() OVER(PARTITION BY company_id ORDER BY name) seq
    FROM {{ source('staging', 'companies') }}
) p
WHERE seq = 1