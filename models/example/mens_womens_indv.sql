{{ config(materialized='view') }}

WITH

source_data AS (
    SELECT
        *
        , 'Male' as gender
    FROM
        {{ ref('staging_mens_indv') }}
    UNION ALL
    SELECT
        *
        ,'Female' as gender
    FROM
        {{ ref('staging_womens_indv') }}
)

SELECT
    *
FROM
    source_data
