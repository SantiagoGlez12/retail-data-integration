-- Paso 3. Importar los cuatro CSV de dimensiones que se incluyen en la carpeta CSV.
-- Antes de ejecutar, COPIAR la carpeta CSV al contenedor Docker siguiendo el Word.
-- Importación para SQL Server en Linux: NO usar CODEPAGE.
-- Los CSV ya están guardados con salto de línea LF y fechas AAAA-MM-DD.
USE Practica_Ventas;
GO

-- Cargar DIM_CATEGORY
BULK INSERT dbo.DIM_CATEGORY
FROM '/var/opt/mssql/data/PracticaVentasCSV/DIM_CATEGORY.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    FIELDQUOTE = '"'
);
GO

-- Cargar DIM_PRODUCT
BULK INSERT dbo.DIM_PRODUCT
FROM '/var/opt/mssql/data/PracticaVentasCSV/DIM_PRODUCT.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    FIELDQUOTE = '"'
);
GO

-- Cargar DIM_SEGMENT
BULK INSERT dbo.DIM_SEGMENT
FROM '/var/opt/mssql/data/PracticaVentasCSV/DIM_SEGMENT.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    FIELDQUOTE = '"'
);
GO

-- Cargar DIM_CALENDAR
BULK INSERT dbo.DIM_CALENDAR
FROM '/var/opt/mssql/data/PracticaVentasCSV/DIM_CALENDAR.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    FIELDQUOTE = '"'
);
GO

-- Revisar cuántos registros tiene cada tabla después de importar.
SELECT 'DIM_CATEGORY' AS Tabla, COUNT(*) AS Registros FROM dbo.DIM_CATEGORY
UNION ALL SELECT 'DIM_PRODUCT', COUNT(*) FROM dbo.DIM_PRODUCT
UNION ALL SELECT 'DIM_SEGMENT', COUNT(*) FROM dbo.DIM_SEGMENT
UNION ALL SELECT 'DIM_CALENDAR', COUNT(*) FROM dbo.DIM_CALENDAR;
GO
