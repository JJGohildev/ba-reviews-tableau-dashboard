# Data Notes

The existing project documentation attributes the reviews to Skytrax / airlinequality.com through a redistributed dataset. It did not provide the original dataset URL, version, or a verifiable license reference. The earlier CC0 claim has therefore not been repeated as an established fact. Add the exact source and license reference when available.

## Checks on the supplied cleaned CSV

- 901 rows.
- 512 Yes and 389 No recommendation responses.
- Mean overall rating approximately 5.8817, excluding blank ratings.
- One blank review date.
- Dated records from 11 October 2011 to 1 August 2015.
- Route is filled for 104 records.
- TravellerType is Unknown for 795 records.

SentimentCategory describes rating bands rather than analysis of the review text. Overall ratings use a ten-point scale and service ratings use a five-point scale. Missing values should not be converted to zeros when averaging ratings.

This is a historical, self-selected review sample. Segment results should include counts, and reviewer geography should not be interpreted as route geography.
