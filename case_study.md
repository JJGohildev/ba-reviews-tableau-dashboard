# British Airways Reviews: Case Study

I used this project to explore what an airline review dataset can tell us about customer experience, and where its limitations matter. I built the analysis in Tableau, with SQL queries and an Excel workbook supporting the same set of review records.

**Tools:** Tableau, SQL, and Excel  
**Project type:** Personal analytics project  
**Dataset:** 901 reviews, with dated records from October 2011 to August 2015

## Questions behind the analysis

I focused on overall ratings, recommendation rate, and the individual service scores. I also wanted to compare cabin classes and traveller types without overlooking how many reviews each group contained.

The questions were straightforward: which service areas received stronger ratings, how did ratings change over time, and which comparisons had enough information to be useful?

## Working with the data

The cleaned dataset contains review dates, ratings, recommendation responses, cabin classes, traveller types, countries, and review text. Some fields are much more complete than others.

Route information is present for only 104 of the 901 reviews. Traveller type is marked Unknown for 795 records. I therefore treated route and traveller comparisons as supplementary views rather than using them to describe the full sample.

The geography view uses reviewer country. This is useful for understanding where reviewers say they are from, but it does not describe the routes they flew.

## Building the Tableau views

The workbook contains two dashboards. Overview & Trends brings together the headline KPIs, a rating trend, sentiment categories, and service-rating comparisons. Segments & Geography contains cabin-class and traveller-type comparisons, a reviewer map, and a detail table.

![Tableau Overview and Trends dashboard](screenshots/01_overview_trends.png)

I used a recommendation flag to turn Yes responses into 1 and other responses into 0. Averaging that field gives the proportion of reviews that recommend the airline. The current CSV contains Yes and No responses only; missing responses in a future dataset would need separate handling.

The review-month calculation groups dated reviews by month. The chart still needs to be read alongside the number of observations in each period. Connecting points across a gap does not show what happened during the missing months.

![Tableau Rating Trend worksheet](screenshots/02_rating_trend.png)

The SQL file contains related queries for KPIs, service dimensions, segments, geography, and data quality. The Excel workbook provides a companion summary. Those files make the analytical logic easier to inspect beyond the dashboard image.

## What I found

Across the supplied CSV, the average overall rating is 5.88 out of 10, excluding missing ratings. Of 901 reviews, 512 recommend the airline, giving a recommendation rate of 56.8%.

The service averages shown in Tableau range from approximately 3.53 out of 5 for cabin staff to 2.62 for inflight entertainment. This suggests a useful comparison within the sample, but each service may have a different number of submitted ratings. I would include those counts before treating the ranking as a firm conclusion.

The workbook's sentiment categories are based on overall ratings: Positive for ratings of 7 or above, Neutral for 4 to 6, Negative for 3 or below, and Unknown for missing ratings. They summarize score bands rather than extracting sentiment from review text.

## What the results can and cannot support

These are historical, self-selected reviews. They do not represent every passenger, and they should not be used to describe the airline's current service quality.

Sparse route and traveller information limits the strength of segment comparisons. One record has no review date, which is why the trend view displays a missing-value indicator. That record can contribute to overall KPIs while being unavailable for a dated trend.

The analysis identifies patterns worth investigating. It does not establish why a rating changed or prove that one service issue caused a recommendation decision.

## What I would improve next

I would add review counts to the trend and segment views, make missing-date handling explicit, and show gaps in time rather than allowing long connecting lines to suggest continuous coverage. I would also change the service comparison to clearly visible horizontal bars and shorten its labels.

These are improvements to the presentation of the existing Tableau work. The screenshots in this repository preserve the supplied workbook rather than replacing its visuals with a web mockup.

[Back to the project overview](README.md)
