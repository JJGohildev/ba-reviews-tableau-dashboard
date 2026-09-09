# British Airways Reviews in Tableau

I built this project to explore how reviewers rated their British Airways experience, which service areas scored highest, and how ratings varied across passenger groups and time.

The project combines a Tableau workbook with SQL analysis and an Excel summary using the same cleaned review dataset.

**[Download the Tableau workbook](tableau/British_Airways_Reviews.twbx)** · **[Read the case study](case_study.md)** · **[View the SQL](ba_reviews_queries.sql)**

## At a glance

- 901 review records in the supplied dataset.
- Average overall rating of 5.88 out of 10, excluding missing ratings.
- 56.8% of reviews marked Recommended as Yes.
- Dated records range from October 2011 to August 2015; one review has no date.

These figures describe this historical review sample, not all British Airways passengers or current airline performance.

## Tableau screenshots

### Overview & Trends

The workbook combines the overview and trend chart in one dashboard. It includes headline KPIs, the rating trend, rating-based sentiment categories, and service-rating comparisons.

![Actual Tableau Overview and Trends dashboard](screenshots/01_overview_trends.png)

### Rating Trend

A closer view of the workbook's Rating Trend worksheet. The missing-date indicator is retained from the original view. A line joining distant observations should not be interpreted as continuous monthly evidence.

![Actual Tableau Rating Trend worksheet](screenshots/02_rating_trend.png)

Both images are captures of the native Tableau workbook, with surrounding application controls removed. No charts have been recreated in HTML.

## What I worked on

- Connected the cleaned review data to Tableau and defined calculated fields for recommendation rate and review month.
- Built Overview & Trends and Segments & Geography dashboards.
- Compared service ratings, cabin classes, traveller types, and reviewer countries.
- Included SQL queries and an Excel workbook for related analysis and KPI checks.

## Project files

| Resource | Contents |
| --- | --- |
| [Packaged Tableau workbook](tableau/British_Airways_Reviews.twbx) | Workbook with its data extract included |
| [Case study](case_study.md) | Questions, approach, findings, and limitations |
| [Calculated fields](CALCULATED_FIELDS_library.md) | The formulas found in the supplied workbook |
| [SQL analysis](ba_reviews_queries.sql) | Schema, analysis queries, and data-quality checks |
| [Excel workbook](BA_Reviews_Workbook.xlsx) | Companion data and KPI summary |
| [Cleaned data](data/ba_reviews_clean.csv) | Review records used in the repository |
| [Data notes](DATA_NOTES.md) | Coverage, missing values, and source information |

## Open the workbook

Download the TWBX file and open it in a compatible version of Tableau Public or Tableau Desktop. It was exported from Tableau Public 2026.2 and includes its extract, so it does not depend on the original local CSV path.

Use the dashboard tabs to explore Overview & Trends and Segments & Geography. The workbook also includes individual worksheets for a closer look at the charts.

## Interpretation notes

SentimentCategory is derived from the overall rating; it is not text-based sentiment analysis. Reviewer country describes the author's location, not a flight destination. Route and traveller-type fields are sparse, so segment comparisons need their review counts alongside them.

The supplied project documentation attributes the reviews to Skytrax / airlinequality.com. The exact redistributed dataset URL and its license have not been verified; see the data notes. This is an independent personal project and is not affiliated with British Airways.
