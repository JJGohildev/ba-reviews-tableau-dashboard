# Tableau Calculated Fields

These formulas were read from the supplied Tableau workbook. They document its current behavior.

## Recommended Flag

```tableau
IF [Recommended] = "Yes" THEN 1 ELSE 0 END
```

Average this field and format the result as a percentage. In the supplied CSV, all recommendation responses are Yes or No. The formula would treat other or missing values as zero, so review the denominator if the source changes.

## Review Month (Trend)

```tableau
DATETRUNC('month', [ReviewDate])
```

This groups dates at month level. It does not fill months with no observations or correct missing dates. Check the date level used on the worksheet and include review counts when interpreting the trend.

## Has Route Data

```tableau
[Route] <> ""
```

This checks for an empty string. Null values require explicit handling if the field is used as a filter. Route data is present in only 104 of the supplied 901 records.

## Other metrics

- Total reviews: count the review records, checking ReviewID uniqueness.
- Average overall rating: average non-missing OverallRating values.
- SentimentCategory: a pre-existing rating-band field in the CSV, not a Tableau NLP calculation.
- Service comparison: use the seven service-rating measures, each with its own non-missing response count.

These notes describe the workbook formulas. They are not a claim that every SQL query or Excel formula has been independently executed and reconciled.
