{{ 
    config(
        materialized = 'incremental',
        incremental_strategy='microbatch',
        event_time='review_date',
        begin='2009-06-20',
        batch_size='year',
        tags = ['fact'],
        schema='mart'
    )
}}

WITH fct_reviews AS (
    SELECT * FROM {{ ref('fct_reviews') }}
),
full_moon_dates AS (
    SELECT * FROM {{ ref('seed_full_moon_dates') }}
)
SELECT R.*,
CASE 
    WHEN FM.full_moon_date IS NULL THEN 'not full moon'
    ELSE 'full moon'
END AS is_full_moon
FROM FCT_REVIEWS R
LEFT JOIN full_moon_dates FM
ON (TO_DATE(R.REVIEW_DATE) = DATEADD(DAY,1,FM.full_moon_date))