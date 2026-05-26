WITH mart_fullmoon_reviews AS (
    SELECT * FROM {{ ref('mart_fullmoon_reviews') }}
)
SELECT
is_full_moon,
review_sentiment,
count(*) as reviews 
FROM
mart_fullmoon_reviews
group by
is_full_moon,
review_sentiment
order by 
is_full_moon,
review_sentiment