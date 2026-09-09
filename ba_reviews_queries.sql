/* =====================================================================
   British Airways Customer Reviews — Sentiment & Ratings Dashboard
   SQL layer: schema + analysis queries feeding the Tableau dashboard
   Dialect: ANSI SQL / SQL Server flavored (works on Snowflake/Postgres
   with minor tweaks, noted inline)
   Source attribution: Skytrax (airlinequality.com), per supplied project notes.
   Exact redistributed dataset URL and license reference remain unverified.
   ===================================================================== */

-- ---------------------------------------------------------------------
-- 1. SCHEMA (mirrors the cleaned BA_Reviews_Clean table)
-- ---------------------------------------------------------------------
CREATE TABLE ba_reviews (
    ReviewID                     VARCHAR(10)   PRIMARY KEY,
    ReviewDate                   DATE          NULL,
    AuthorCountry                VARCHAR(60),
    Route                        VARCHAR(200),
    RouteOrigin                  VARCHAR(80),
    RouteDestination             VARCHAR(80),
    CabinClass                   VARCHAR(30),
    TravellerType                VARCHAR(30),
    OverallRating                DECIMAL(3,1)  NULL,
    SeatComfortRating            DECIMAL(3,1)  NULL,
    CabinStaffRating             DECIMAL(3,1)  NULL,
    FoodBeverageRating           DECIMAL(3,1)  NULL,
    InflightEntertainmentRating  DECIMAL(3,1)  NULL,
    GroundServiceRating          DECIMAL(3,1)  NULL,
    WifiConnectivityRating       DECIMAL(3,1)  NULL,
    ValueForMoneyRating          DECIMAL(3,1)  NULL,
    Recommended                  VARCHAR(3),     -- 'Yes' / 'No'
    SentimentCategory            VARCHAR(10),    -- Positive/Neutral/Negative/Unknown
    ReviewTitle                  VARCHAR(200),
    ReviewText                   TEXT
);


-- ---------------------------------------------------------------------
-- 2. MONTHLY REVIEW VOLUME & AVERAGE RATING TREND
--    -> feeds the "Rating Trend Over Time" line chart
-- ---------------------------------------------------------------------
SELECT
    DATEFROMPARTS(YEAR(ReviewDate), MONTH(ReviewDate), 1) AS MonthKey,
    COUNT(*)                                              AS ReviewCount,
    ROUND(AVG(OverallRating), 2)                          AS AvgOverallRating,
    ROUND(100.0 * SUM(CASE WHEN Recommended = 'Yes' THEN 1 ELSE 0 END)
          / COUNT(*), 1)                                  AS PctRecommended
FROM ba_reviews
WHERE ReviewDate IS NOT NULL
GROUP BY DATEFROMPARTS(YEAR(ReviewDate), MONTH(ReviewDate), 1)
ORDER BY MonthKey;


-- ---------------------------------------------------------------------
-- 3. AVERAGE RATING BY SERVICE DIMENSION
--    -> identifies the weakest service area (lowest avg = biggest
--       improvement opportunity); feeds the "Ratings Breakdown" bar chart
-- ---------------------------------------------------------------------
SELECT 'Seat Comfort' AS Dimension, ROUND(AVG(SeatComfortRating), 2) AS AvgRating FROM ba_reviews
UNION ALL
SELECT 'Cabin Staff', ROUND(AVG(CabinStaffRating), 2) FROM ba_reviews
UNION ALL
SELECT 'Food & Beverage', ROUND(AVG(FoodBeverageRating), 2) FROM ba_reviews
UNION ALL
SELECT 'Inflight Entertainment', ROUND(AVG(InflightEntertainmentRating), 2) FROM ba_reviews
UNION ALL
SELECT 'Ground Service', ROUND(AVG(GroundServiceRating), 2) FROM ba_reviews
UNION ALL
SELECT 'Wifi Connectivity', ROUND(AVG(WifiConnectivityRating), 2) FROM ba_reviews
UNION ALL
SELECT 'Value for Money', ROUND(AVG(ValueForMoneyRating), 2) FROM ba_reviews
ORDER BY AvgRating ASC;


-- ---------------------------------------------------------------------
-- 4. RATINGS & RECOMMENDATION RATE BY CABIN CLASS
--    -> supports "compare ratings across ... classes"
-- ---------------------------------------------------------------------
SELECT
    CabinClass,
    COUNT(*)                                              AS ReviewCount,
    ROUND(AVG(OverallRating), 2)                          AS AvgOverallRating,
    ROUND(100.0 * SUM(CASE WHEN Recommended = 'Yes' THEN 1 ELSE 0 END)
          / COUNT(*), 1)                                  AS PctRecommended
FROM ba_reviews
GROUP BY CabinClass
ORDER BY AvgOverallRating DESC;


-- ---------------------------------------------------------------------
-- 5. RATINGS BY TRAVELLER TYPE
--    -> supports segment comparison (note: sparse field, ~12% filled)
-- ---------------------------------------------------------------------
SELECT
    TravellerType,
    COUNT(*)                     AS ReviewCount,
    ROUND(AVG(OverallRating), 2) AS AvgOverallRating
FROM ba_reviews
WHERE TravellerType <> 'Unknown'
GROUP BY TravellerType
ORDER BY AvgOverallRating DESC;


-- ---------------------------------------------------------------------
-- 6. GEOGRAPHIC BREAKDOWN — AVG RATING & VOLUME BY REVIEWER COUNTRY
--    -> feeds the map visual (country field is ~99.8% filled, unlike Route)
-- ---------------------------------------------------------------------
SELECT
    AuthorCountry,
    COUNT(*)                     AS ReviewCount,
    ROUND(AVG(OverallRating), 2) AS AvgOverallRating,
    ROUND(100.0 * SUM(CASE WHEN Recommended = 'Yes' THEN 1 ELSE 0 END)
          / COUNT(*), 1)         AS PctRecommended
FROM ba_reviews
WHERE AuthorCountry <> 'Unknown'
GROUP BY AuthorCountry
HAVING COUNT(*) >= 5              -- drop countries with too few reviews to be meaningful
ORDER BY ReviewCount DESC;


-- ---------------------------------------------------------------------
-- 7. SENTIMENT BREAKDOWN (overall + by cabin class)
--    -> feeds the sentiment donut and the sentiment-by-class stacked bar
-- ---------------------------------------------------------------------
SELECT
    SentimentCategory,
    COUNT(*)                                       AS ReviewCount,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS PctOfTotal
FROM ba_reviews
GROUP BY SentimentCategory
ORDER BY ReviewCount DESC;

SELECT
    CabinClass,
    SentimentCategory,
    COUNT(*) AS ReviewCount
FROM ba_reviews
GROUP BY CabinClass, SentimentCategory
ORDER BY CabinClass, SentimentCategory;


-- ---------------------------------------------------------------------
-- 8. DATA QUALITY CHECK (used while validating the cleaning pass)
-- ---------------------------------------------------------------------
SELECT 'Rows with no OverallRating' AS Check_Name, COUNT(*) AS Issue_Count
FROM ba_reviews WHERE OverallRating IS NULL

UNION ALL

SELECT 'Duplicate ReviewID', COUNT(*) - COUNT(DISTINCT ReviewID)
FROM ba_reviews

UNION ALL

SELECT 'Rows with unparsed Route (blank origin/destination)', COUNT(*)
FROM ba_reviews
WHERE Route <> '' AND (RouteOrigin = '' OR RouteDestination = '');
