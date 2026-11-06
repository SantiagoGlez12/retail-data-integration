# Data Snapshots

| Folder | Contents | Intended use |
| --- | --- | --- |
| `sql/` | Four dimension CSVs and FACT_SALES.csv.gz | Original EA2 SQL load scripts |
| `python/` | Category CSV, three dimension workbooks, FACT_SALES.csv.gz | EA3/EA4 Python analysis |

The fact tables are losslessly gzip-compressed. The source manifest records both original and published hashes. To prepare a SQL import folder, decompress with Python's standard library or a gzip utility, keeping the filename `FACT_SALES.csv`:

```bash
python -c "import gzip,pathlib; p=pathlib.Path('data/sql/FACT_SALES.csv.gz'); p.with_suffix('').write_bytes(gzip.decompress(p.read_bytes()))"
```

Copy the SQL CSVs into the container-visible path expected by the scripts before running BULK INSERT. Do not mix SQL and Python snapshots merely because their filenames match. The Python notebook reads its gzip input directly.

The author identified the coursework records as fictitious or public example data. No business ownership or independent data license is asserted by this migration.
