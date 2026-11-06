# Stage 02 — SQL Integration

Nine original scripts are kept in `SQL/`. Run them in numerical order in a prepared SQL Server practice instance; `01` creates Practica_Ventas, `02–05` prepare/import/query dimensions, and `06–09` add/query FACT_SALES.

Inputs are in `../../data/sql/` and include a compressed fact CSV. Decompress it before importing. The BULK INSERT commands expect `/var/opt/mssql/data/PracticaVentasCSV/` inside the SQL Server container; review/copy inputs to that location first. SQL scripts are preserved unchanged and are not rerunnable wholesale without duplicate-object/data handling. National totals are deliberately separated from regional totals in sales queries.

SQL execution has not been revalidated during migration. Original course PDF instructions remain in Drive; the code and data snapshot are the versioned artifacts here.
