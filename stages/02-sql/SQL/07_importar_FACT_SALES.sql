-- Paso 7. Cargar los datos de FACT_SALES.
-- Antes, copia FACT_SALES.csv al contenedor con los comandos del Word.
-- No ejecutar dos veces: volvería a insertar las mismas filas.
USE Practica_Ventas;
GO

BULK INSERT dbo.FACT_SALES
FROM '/var/opt/mssql/data/PracticaVentasCSV/FACT_SALES.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    FIELDQUOTE = '"'
);
GO

-- Comprobar que entraron todos los registros de ventas.
SELECT COUNT(*) AS RegistrosFACT_SALES
FROM dbo.FACT_SALES;
GO
