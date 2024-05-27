{{ config(materialized='view') }}

WITH

source_data AS (
    SELECT
        CONCAT(player_id, '_', year) AS unique_id
        , CAST(Player_ID AS INT64) AS player_id
        , player_name
        , year
        , position
        , country_name
        , nationality
        , age
        , CAST((IF(Height IN ('-'), NULL, Height)) AS INT64) AS height
        , CAST((IF(Total_Points IN ('-'), NULL, Total_Points)) AS INT64) AS total_points
        , CAST((REPLACE((IF(Efficiency IN ('-'), NULL, Efficiency)),"%","")) AS FLOAT64) AS efficiency
        , CAST((IF(Average_by_Match IN ('-'), NULL, Average_by_Match)) AS FLOAT64) AS average_by_match
        , CAST((IF(Attack_Points IN ('-'), NULL, Attack_Points)) AS INT64) AS attack_points
        , CAST((IF(Attack_Avg_Points IN ('-'), NULL, Attack_Avg_Points)) AS FLOAT64) AS attack_avg_points
        , CAST((IF(Block_Points IN ('-'), NULL, Block_Points)) AS INT64) AS block_points
        , CAST((REPLACE((IF(Block_Success IN ('-'), NULL, Block_Success)),"%","")) AS FLOAT64) AS block_auccess
        , CAST((IF(Block_Avg_Points IN ('-'), NULL, Block_Avg_Points)) AS FLOAT64) AS block_avg_points
        , CAST((IF(Serve_Points IN ('-'), NULL, Serve_Points)) AS INT64) AS serve_points
        , CAST((REPLACE((IF(Serve_Success IN ('-'), NULL, Serve_Success)),"%",""))AS FLOAT64) AS serve_success
        , CAST((IF(Serve_Avg_Points IN ('-'), NULL, Serve_Avg_Points)) AS FLOAT64) AS serve_avg_points
    FROM
        {{ ref('df_womens_rosters_21_23') }}
    WHERE
        Player_ID != 'N/A' --removes coaches
)

SELECT
    *
FROM
    source_data
