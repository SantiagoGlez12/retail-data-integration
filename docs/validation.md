# Validation Record

- Source downloads were checked against expected file sizes. One incomplete transfer was retried before comparison.
- EA3 and EA4 copies of the five Python inputs were checked for identical bytes and deduplicated.
- Original SQL scripts, notebooks, reference charts, and summaries are preserved; gzip inputs decompress to their source bytes.
- The original EA4 code cells were executed with the home path redirected to an isolated scratch directory, avoiding writes to a user's Downloads folder. It produced **122,002 consolidated rows**, **nine PNG figures**, and an insight file matching the supplied summary exactly.
- The portable notebook changes only the first setup cell and clears outputs. Its analysis is separately executed against the repository data to verify the path adaptation.
- The original EA3 snapshot is incomplete; no joins or completed consolidation are claimed for that notebook.
- No SQL Server instance was configured here; SQL statements were reviewed but not executed.
- Outputs are descriptive. National/area aggregation, partial-year comparability, and unspecified currency remain material analytical limitations.
