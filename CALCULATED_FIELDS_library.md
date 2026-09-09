# Tableau calculations and definitions

## Headline measures

| Metric | Calculation | Display |
| --- | --- | --- |
| Total reviews | `COUNT([ReviewID])` | Whole number |
| Average rating | `AVG([OverallRating])` | Two decimals, out of 10 |
| Recommendation rate | `AVG([Recommended Flag])` | Percentage, one decimal |

Tableau excludes null ratings from the average. In the current dataset, 896 of 901 reviews have an overall rating.

## Recommended Flag

```tableau
IF [Recommended] = "Yes" THEN 1
ELSEIF [Recommended] = "No" THEN 0
END
```

Missing or unexpected responses remain null rather than being treated as No. All 901 responses in the current dataset are Yes or No.

## Review Month (Trend)

```tableau
DATETRUNC('month', [ReviewDate])
```

## Has review date

```tableau
NOT ISNULL([ReviewDate])
```

Both monthly charts filter this field to True. This removes one undated record from the time view without removing it from overview totals.

## Share of all reviews

```tableau
COUNT([ReviewID]) / MIN({ FIXED : COUNT([ReviewID]) })
```

This is used for the rating-band bars. The denominator is the full dataset, including unrated records. Ordinary dimension filters do not change the FIXED denominator; review this definition before adding interactive filters intended to show a filtered share.

## Rating bands

The source field `SentimentCategory` is displayed as Rating band:

| Source value | Dashboard label | Definition |
| --- | --- | --- |
| Positive | High (7–10) | Overall rating at least 7 |
| Neutral | Mid (4–6) | Overall rating 4 to 6 |
| Negative | Low (1–3) | Overall rating at most 3 |
| Unknown | Not rated | Missing overall rating |

These bands are based on scores, not text sentiment.

## Service and segment comparisons

Service bars use averages on a fixed 0–5 axis. Available rating counts are 899 for cabin staff, 900 for value for money, 899 for seat comfort, 93 for ground service, 896 for food and beverage, 14 for Wi-Fi, and 865 for entertainment.

Segment bars use `AVG([OverallRating])` on a fixed 0–10 axis. The `n` label is `COUNT([ReviewID])`, including any review without an overall rating. Recommendation rate is a separate tooltip value.

## Existing route field

```tableau
[Route] <> ""
```

This original field remains in the workbook. It is not used to restrict the three dashboards.

## Refresh note

Chart values are calculated from the extract. Descriptive titles and coverage notes refer to the current 901-row snapshot and should be reviewed when the dataset changes.
