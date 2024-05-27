{{ config(materialized='view') }}

WITH

source_data AS (
    SELECT
        *
        , 'Male' as gender
    FROM
        {{ ref('staging_mens_rosters') }}
    UNION ALL
    SELECT
        *
        ,'Female' as gender
    FROM
        {{ ref('staging_womens_rosters') }}
)

SELECT
    *
FROM
    source_data
