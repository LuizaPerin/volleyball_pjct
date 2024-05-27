{{ config(materialized='view') }}

WITH

source_data AS (
    SELECT
        CONCAT(player_id, '_', match_date) AS unique_id
        , player_id
        , year
        , PARSE_DATE('%d/%m/%Y', (NULLIF(Match_Date,"-"))) AS match_date
        , TeamA as team_a
        , TeamB as team_b
        , CAST((NULLIF(Serve_Points,"-")) AS INT64) AS serve_points
        , CAST((NULLIF(Serve_Errors,"-")) AS INT64) AS serve_errors
        , CAST((NULLIF(Serve_Attempts,"-")) AS INT64) AS serve_attempts
        , CAST((NULLIF(Total_Serves,"-")) AS INT64) AS total_serves
        , CAST((NULLIF(Set_Successes,"-")) AS INT64) AS set_successes
        , CAST((NULLIF(Set_Errors,"-")) AS INT64) AS set_errors
        , CAST((NULLIF(Set_Attempts,"-")) AS INT64) AS set_attempts
        , CAST((NULLIF(Total_Sets,"-")) AS INT64) AS total_sets
        , CAST((NULLIF(Attack_Success,"-")) AS INT64) AS attack_success
        , CAST((NULLIF(Attack_Errors,"-")) AS INT64) AS attack_errors
        , CAST((NULLIF(Attack_Attempts,"-")) AS INT64) AS attack_attempts
        , CAST((NULLIF(Total_Attacks,"-")) AS INT64) AS total_attacks
        , CAST((NULLIF(Block_Successful,"-")) AS INT64) AS block_successful
        , CAST((NULLIF(Block_Errors,"-")) AS INT64) AS block_errors
        , CAST((NULLIF(Block_Rebounds,"-")) AS INT64) AS block_rebounds
        , CAST((NULLIF(Total_Blocks,"-")) AS INT64) AS total_blocks
        , CAST((NULLIF(Reception_Successful,"-")) AS INT64) AS reception_successful
        , CAST((NULLIF(Reception_Errors,"-")) AS INT64) AS reception_errors
        , CAST((NULLIF(Reception_Attemps,"-")) AS INT64) AS reception_attempts
        , CAST((NULLIF(Total_Receptions,"-")) AS INT64) AS total_receptions
        , CAST((NULLIF(Dig_Success,"-")) AS INT64) AS dig_success
        , CAST((NULLIF(Dig_Errors,"-")) AS INT64) AS dig_errors
        , CAST((NULLIF(Dig_Attempts,"-")) AS INT64) AS dig_attempts
        , CAST((NULLIF(Total_Digs,"-")) AS INT64) AS total_digs
    FROM
        {{ ref('df_womens_indv_21_23') }}
)

SELECT
    *
FROM
    source_data
