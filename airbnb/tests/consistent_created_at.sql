WITH R AS(
    SELECT * FROM {{ ref('fct_reviews') }}
),
L AS (
    SELECT * FROM {{ ref('dim_listings_cleansed') }}
)
SELECT R.* FROM R LEFT JOIN L ON R.LISTING_ID = L.LISTING_ID
where r.review_date < l.created_at
