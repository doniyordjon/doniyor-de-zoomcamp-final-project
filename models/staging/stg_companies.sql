{{ config(materialized='view') }}

select
name,
state,
country,
city
from {{ source('staging', 'companies') }}