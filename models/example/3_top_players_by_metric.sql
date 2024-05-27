{{ config(materialized='table') }}

WITH

source_data AS (
    SELECT
        CONCAT(player_name, ' (', country_name, ')') AS player
        , SUM(serve_points) as serve_points
        , SUM(attack_points) as attack_points
        , SUM(block_points) as block_points
        , SUM(total_points) as total_points
        , gender
        , year
    FROM
        {{ ref('mens_womens_rosters') }}
    GROUP BY
        player_name, country_name, gender, year
    ORDER BY
        total_points DESC
)

SELECT
    *
FROM
    source_data
ORDER BY
    total_points DESC
