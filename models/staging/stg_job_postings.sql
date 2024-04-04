{{ config(materialized='view') }}

select
title,
med_salary,
formatted_work_type,
location,
sponsored,
formatted_experience_level
from {{ source('staging', 'job_postings') }}