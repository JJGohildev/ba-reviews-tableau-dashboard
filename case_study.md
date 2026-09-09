# British Airways Reviews: Case Study

I wanted to understand what sat behind the headline rating in an airline review dataset. A single average can hide differences between service areas, passenger groups, and the amount of evidence available for each comparison.

I used Tableau for the dashboard, with SQL queries and an Excel summary supporting the same 901 review records. This is a personal analytics project using historical data.

## Starting with the data

The dataset contains overall ratings, service scores, recommendation responses, review dates, passenger details, and review text. I checked completeness before deciding how prominently to display each field.

There are 896 overall ratings and 900 dated records. Traveller type is Unknown for 795 reviews, and only 104 records contain a route. Those gaps matter: the available traveller groups cannot reliably describe the entire sample.

## Designing the analysis

I used common scales to compare service ratings and displayed review counts alongside segment averages. For the monthly view, I paired average ratings with review volume and left missing periods unconnected. This makes sparse months easier to recognise. The map shows reviewer countries, and the detail table provides access to individual reviews.

![Tableau overview](screenshots/01_overview_trends.png)

![Monthly ratings and review counts](screenshots/02_rating_trend.png)

## What stood out

The average overall rating is 5.88 out of 10. Of 901 recommendation responses, 512 are Yes, giving a recommendation rate of 56.8%. High scores of 7–10 account for 452 reviews, or 50.2% of the dataset.

Cabin staff has the highest service average at 3.53 out of 5, based on 899 ratings. Inflight entertainment averages 2.62 from 865 ratings. That makes entertainment a reasonable area to investigate further within this sample, although the averages alone do not explain the cause.

Wi-Fi averages 2.64, but only 14 reviews contain a Wi-Fi score. Ground service has 93 ratings. I made those counts visible because their averages should not carry the same weight as categories with hundreds of responses.

The monthly coverage is uneven. August 2015 contains only three reviews, and the latest date is 1 August. I would not interpret that month as evidence of a sustained change in service quality.

## What I would investigate next

I would read the lower-rated entertainment reviews to identify recurring issues, then compare them with cabin class and the review date where those details are available. I would also want a more complete and recent dataset before drawing conclusions about changes over time.

These are self-selected historical reviews. The analysis describes patterns in this dataset; it does not establish causes or represent every British Airways passenger.

[Back to the project overview](README.md)
