# British Airways Reviews — Tableau Dashboard

A Tableau Public dashboard analyzing 901 real British Airways customer reviews (Skytrax / airlinequality.com, 2011–2015), covering rating trends, service-dimension performance, cabin-class and traveller-type comparisons, sentiment, and reviewer geography.

This project pairs with a SQL analysis layer and an Excel workbook built on the same cleaned dataset — see [Related work](#related-work) below.

## Live dashboard

Published on Tableau Public: **[add your Tableau Public link here after publishing]**

## Screenshots

**Overview & Trends**
![Overview & Trends dashboard](screenshots/01_overview_trends.png)

**Segments & Geography**
![Segments & Geography dashboard](screenshots/02_segments_geography.png)

## What's in the dashboard

Two dashboards built from 8 worksheets in Tableau Public:

- **Overview & Trends** — headline KPIs (901 total reviews, 5.88 average rating, 56.8% recommended), a month-by-month average rating trend line, a sentiment breakdown donut (Positive/Neutral/Negative/Unknown), and a ratings-breakdown bar chart ranking all 7 service dimensions from strongest (Cabin Staff, 3.53) to weakest (Inflight Entertainment, 2.62).
- **Segments & Geography** — average rating and % recommended by cabin class (First Class highest at 65.1%, Economy lowest at 52.6%) and by traveller type (Solo Leisure highest at 60.6%, Business travellers lowest at 31.3%), a world map sized and colored by review volume and average rating per reviewer country, and a full review-level detail table (901 rows) for drill-down.

## Calculated fields

Three Tableau calculated fields power the dashboard — full formulas in `CALCULATED_FIELDS_library.md`:

- **Recommended Flag** — converts Yes/No into 0/1 so it can be averaged into a "% Recommended" metric.
- **Review Month (Trend)** — a continuous, truncated-to-month date field for the trend line.
- **Has Route Data** — flags whether a review has route information filled in (used to exclude blanks from route-based views).

The ratings-breakdown chart uses Tableau's Measure Names/Measure Values drag technique instead of a calculated field — selecting all 7 service-rating columns and dragging them together onto Rows.

## Tools used

- **Tableau Public** — data connection, calculated fields, worksheets, dashboards
- **SQL** (`ba_reviews_queries.sql`) — the same KPI logic (monthly trend, ratings by service dimension, ratings by cabin class/traveller type, geographic breakdown, sentiment breakdown, data quality checks) expressed as a queryable SQL layer over the cleaned dataset
- **Excel** (`BA_Reviews_Workbook.xlsx`) — a companion workbook with a raw-data sample, the full cleaned dataset, and a formula-driven KPI summary sheet (AVERAGE, COUNTIF, AVERAGEIF) matching the dashboard's headline numbers

## Data notes

- Source: Skytrax (airlinequality.com) reviews, redistributed under a CC0 (public-domain-equivalent) license via an open GitHub dataset.
- `AuthorCountry` is used as the geographic dimension (99.8% filled) rather than `Route`, which is free text and only filled on ~12% of reviews.
- `SentimentCategory` (Positive/Neutral/Negative/Unknown) is derived from `OverallRating` during cleaning (≥7 / 4–6 / ≤3 / no rating) rather than from NLP on the review text.
- `TravellerType` is sparse (~12% filled) and treated as a secondary comparison rather than a primary finding — the "Unknown" bucket dominates that field by design.
- Review titles are largely generic boilerplate text ("British Airways customer review") rather than user-written headlines, so title text wasn't usable as an analysis dimension.

## Data note (licensing)

All review data in this project (`data/ba_reviews_clean.csv`) is real, publicly available customer review data released under a CC0 license. No personally identifying information is included beyond the reviewer's self-reported country.
