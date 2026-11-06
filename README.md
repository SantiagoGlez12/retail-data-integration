# Retail Data Integration & Analysis

**Work in progress — Empresa Aliada coursework project.** This repository tracks the evolution of a retail sales analysis across SQL, Pandas, and exploratory visualization. It will grow as later course modules are completed.

**SQL Server · Python · Pandas · NumPy · Matplotlib · Seaborn · Jupyter**

## Start here

The [portable EDA notebook](notebooks/retail_sales_eda.ipynb) loads the five source tables, cleans and joins the records, and produces nine visualizations. Original submissions are preserved under `stages/`.

| Stage | Content | Current status |
| --- | --- | --- |
| [02 — SQL](stages/02-sql) | Nine scripts: database creation, dimension/fact loading, verification, joins and sales summaries | Source reviewed; SQL execution not retested here |
| [03 — Pandas](stages/03-pandas) | Original EA3 notebook | Incomplete snapshot: ends before numeric conversion and joins |
| [04 — Visualization](stages/04-visualization) | Original EA4 notebook and portable notebook | Python analysis reproduced: 122,002 consolidated rows and nine charts |
| Future coursework | Further analysis, reporting and course deliverables | Not implemented; scope depends on future assignments |

## Reproduced findings

The supplied EA4 insight file was reproduced exactly during validation:

- Data spans **9 January 2022 to 17 July 2023**.
- BLEACH has the largest national sales value; CLORALEX represents **48.8%** of national sales value in the analyzed period.
- Units and sales value have a correlation of **0.914** in the national subset.
- Comparing **28 equivalent weeks**, PRETREAT increases **23.6%** and SANITIZER decreases **30.0%** between 2022 and 2023.

These are descriptive findings from the supplied training data, not forecasts or causal claims. The national total and six regional areas are analyzed separately to avoid double counting. 2023 is partial, and the dataset does not specify a currency for `TOTAL_VALUE_SALES`.

![Equivalent-period comparison](reports/reference/09_comparacion_periodos.png)

![Sales value by brand](reports/reference/08_participacion_marcas.png)

## Run the Python analysis

From the repository root:

```bash
python -m pip install -r requirements.txt
jupyter lab notebooks/retail_sales_eda.ipynb
```

Run the notebook cells in order. Inputs are in `data/python/`; the large fact table is losslessly gzip-compressed and read directly by Pandas. New figures, insight text, a segment comparison, and the consolidated CSV are written to `reports/generated/` (ignored by Git).

The portable notebook only changes the original setup cell's input/output paths and clears saved outputs. All subsequent analytical cells are unchanged. It does not use the original user-specific Downloads folder.

## Data and source snapshots

Five tables are involved: `FACT_SALES`, `DIM_PRODUCT`, `DIM_CATEGORY`, `DIM_SEGMENT`, and `DIM_CALENDAR`. [Data notes](data/README.md) explain the SQL/Python snapshots and compression. The Python input copies from EA3 and EA4 were checked and are identical, so only one set is stored. The SQL CSV inputs are a separate prepared snapshot and are retained separately.

The original Drive files remain unchanged. Duplicate EA3 copies, notebook checkpoints, large generated consolidated CSVs, and redundant PDF reports are excluded. The consolidated output can be regenerated from the notebook.

## Validation and next steps

See [validation notes](docs/validation.md), the [source manifest](docs/source-manifest.json), and the [roadmap](docs/roadmap.md). Python execution was validated in an isolated scratch environment. SQL Server execution remains pending. This repository is an evolving academic project, not a finished production pipeline.
