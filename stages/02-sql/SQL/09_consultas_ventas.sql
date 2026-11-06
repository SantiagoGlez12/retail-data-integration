-- Paso 9. Consultas sobre ventas con INNER JOIN y GROUP BY.
-- Nota: 'TOTAL AUTOS SCANNING MEXICO' es un total nacional.
-- Separamos ese total de las areas para NO contar ventas dos veces.
USE Practica_Ventas;
GO

-- Ejercicio 1. Ventas por categoría en el total nacional.
SELECT
    c.CATEGORY AS Categoria,
    SUM(f.TOTAL_VALUE_SALES) AS TotalVentas
FROM dbo.FACT_SALES f
INNER JOIN dbo.DIM_PRODUCT p
    ON f.ITEM_CODE = p.ITEM
INNER JOIN dbo.DIM_CATEGORY c
    ON p.CATEGORY = c.ID_CATEGORY
WHERE f.REGION = 'TOTAL AUTOS SCANNING MEXICO'
GROUP BY c.CATEGORY
ORDER BY TotalVentas DESC;
GO

-- Ejercicio 2. Ventas por región, sin agregar el total nacional.
SELECT
    f.REGION AS Region,
    SUM(f.TOTAL_VALUE_SALES) AS TotalVentas
FROM dbo.FACT_SALES f
WHERE f.REGION <> 'TOTAL AUTOS SCANNING MEXICO'
GROUP BY f.REGION
ORDER BY TotalVentas DESC;
GO

-- Ejercicio 3. Ventas nacionales por año y mes (JOIN con calendario).
SELECT
    cal.[YEAR] AS Anio,
    cal.[MONTH] AS Mes,
    SUM(f.TOTAL_VALUE_SALES) AS TotalVentas
FROM dbo.FACT_SALES f
INNER JOIN dbo.DIM_CALENDAR cal
    ON f.[WEEK] = cal.[WEEK]
WHERE f.REGION = 'TOTAL AUTOS SCANNING MEXICO'
GROUP BY cal.[YEAR], cal.[MONTH]
ORDER BY Anio, Mes;
GO

-- Ejercicio 4. Los 10 productos con mayores ventas nacionales.
SELECT TOP (10)
    p.BRAND AS Marca,
    p.ITEM_DESCRIPTION AS Producto,
    SUM(f.TOTAL_VALUE_SALES) AS TotalVentas
FROM dbo.FACT_SALES f
INNER JOIN dbo.DIM_PRODUCT p
    ON f.ITEM_CODE = p.ITEM
WHERE f.REGION = 'TOTAL AUTOS SCANNING MEXICO'
GROUP BY p.BRAND, p.ITEM_DESCRIPTION
ORDER BY TotalVentas DESC;
GO

-- Ejercicio 5. Ventas por categoría y región (sin el total nacional).
SELECT
    c.CATEGORY AS Categoria,
    f.REGION AS Region,
    SUM(f.TOTAL_VALUE_SALES) AS TotalVentas
FROM dbo.FACT_SALES f
INNER JOIN dbo.DIM_PRODUCT p
    ON f.ITEM_CODE = p.ITEM
INNER JOIN dbo.DIM_CATEGORY c
    ON p.CATEGORY = c.ID_CATEGORY
WHERE f.REGION <> 'TOTAL AUTOS SCANNING MEXICO'
GROUP BY c.CATEGORY, f.REGION
ORDER BY Categoria, TotalVentas DESC;
GO
