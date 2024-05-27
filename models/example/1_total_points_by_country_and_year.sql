{{ config(materialized='table') }}

WITH

source_data AS (
    SELECT
        country_name
        , year
        , SUM(total_points) as total_points
        , gender
    FROM
        {{ ref('mens_womens_rosters') }}
    GROUP BY
        country_name, year, gender
    ORDER BY
        country_name, year
)

SELECT
    *
FROM
    source_data
ORDER BY
    country_name, year
