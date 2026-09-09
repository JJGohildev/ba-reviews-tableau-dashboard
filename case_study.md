# British Airways Reviews: Case Study

I wanted to understand what sat behind the headline rating in an airline review dataset. A single average can hide differences between service areas, passenger groups, and the amount of evidence available for each comparison.

I used Tableau for the dashboard, with SQL queries and an Excel summary supporting the same 901 review records. This is a personal analytics project using historical data.

## Starting with the data

The dataset contains overall ratings, service scores, recommendation responses, review dates, passenger details, and review text. I checked completeness before deciding how prominently to display each field.

There are 896 overall ratings and 900 dated records. Traveller type is Unknown for 795 reviews, and only 104 records contain a route. Those gaps matter: the available traveller groups cannot reliably describe the entire sample.

## Designing the analysis

The overview begins with review count, average rating, and recommendation rate. Service scores appear as horizontal bars on a common 0–5 scale, with concise labels and two-decimal values. The rating distribution groups scores into high, mid, low, and unrated bands. These are numerical categories, not an analysis of the language in the reviews.

![Tableau overview](screenshots/01_overview_trends.png)

For the time view, I used monthly points and a separate volume chart. The data contains long gaps, so a continuous line would imply observations that are not there. Review counts help distinguish a well-populated month from a month with only a few records. The undated record stays in the overview but is excluded from time-based charts.

![Monthly ratings and review counts](screenshots/02_rating_trend.png)

The segment charts use the same 0–10 rating scale and show review counts beside the averages. Recommendation rate stays in the tooltip as a separate measure. This keeps the label consistent with the length of each bar. The geography view describes reviewer origins, while a scrollable table lets readers inspect individual records and review text.

## What stood out

The average overall rating is 5.88 out of 10. Of 901 recommendation responses, 512 are Yes, giving a recommendation rate of 56.8%. High scores of 7–10 account for 452 reviews, or 50.2% of the dataset.

Cabin staff has the highest service average at 3.53 out of 5, based on 899 ratings. Inflight entertainment averages 2.62 from 865 ratings. That makes entertainment a reasonable area to investigate further within this sample, although the averages alone do not explain the cause.

Wi-Fi averages 2.64, but only 14 reviews contain a Wi-Fi score. Ground service has 93 ratings. I made those counts visible because their averages should not carry the same weight as categories with hundreds of responses.

The monthly coverage is uneven. August 2015 contains only three reviews, and the latest date is 1 August. I would not interpret that month as evidence of a sustained change in service quality.

## What I would investigate next

I would read the lower-rated entertainment reviews to identify recurring issues, then compare them with cabin class and the review date where those details are available. I would also want a more complete and recent dataset before drawing conclusions about changes over time.

The main lesson from this project was to show the strength of the evidence alongside the result. Clear scales, correct labels, sample sizes, and visible gaps make the dashboard more useful than a polished average on its own.

These are self-selected historical reviews. The analysis describes patterns in this dataset; it does not establish causes or represent every British Airways passenger.

[Back to the project overview](README.md)
