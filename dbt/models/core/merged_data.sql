{{
    config(
        materialized='table'
    )
}}

with job_postings_data as (
    select *
    from {{ ref("stg_job_postings") }}
),
companies_data as (
    select *
    from {{ ref('stg_companies') }}
), 
industries as (
    select * from {{ ref('comp_industries') }}
)

select job_postings_data.company_id,
job_postings_data.title,
job_postings_data.med_salary,
job_postings_data.formatted_work_type,
job_postings_data.location,
job_postings_data.sponsored,
companies_data.name,
companies_data.state,
companies_data.country,
companies_data.city,
industries.industry
from job_postings_data
join companies_data
on job_postings_data.company_id = companies_data.company_id
join industries
on job_postings_data.company_id = industries.company_id