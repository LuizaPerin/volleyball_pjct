{{ config(materialized='table') }}

WITH

source_data AS (
    SELECT
        position
        , gender
        , year
        , AVG(serve_points) as serve_points
        , AVG(attack_points) as attack_points
        , AVG(block_points) as block_points
        , AVG(total_points) as total_points
    FROM
        {{ ref('mens_womens_rosters') }}
    WHERE
        position != "U"
    GROUP BY
        position, gender, year
    ORDER BY
        year, position
)

SELECT
    *
FROM
    source_data
ORDER BY
    year, position
