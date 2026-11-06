-- Paso 5. Consultas sencillas y JOIN con las tablas de dimensiones.
USE Practica_Ventas;
GO

-- Consulta 1. Productos junto con el nombre de su categoría.
SELECT TOP (20)
    p.BRAND AS Marca,
    p.ITEM_DESCRIPTION AS Producto,
    c.CATEGORY AS Categoria
FROM dbo.DIM_PRODUCT p
INNER JOIN dbo.DIM_CATEGORY c
    ON p.CATEGORY = c.ID_CATEGORY;
GO

-- Consulta 2. Cantidad de productos por categoría.
SELECT
    c.CATEGORY AS Categoria,
    COUNT(*) AS CantidadProductos
FROM dbo.DIM_PRODUCT p
INNER JOIN dbo.DIM_CATEGORY c
    ON p.CATEGORY = c.ID_CATEGORY
GROUP BY c.CATEGORY
ORDER BY CantidadProductos DESC;
GO

-- Consulta 3. Productos y el segmento al que pertenecen.
-- Se comparan la categoría, los tres atributos y el formato.
-- LEFT JOIN permite ver también productos que no encontraron segmento.
SELECT TOP (30)
    p.BRAND AS Marca,
    p.ITEM_DESCRIPTION AS Producto,
    s.SEGMENT AS Segmento
FROM dbo.DIM_PRODUCT p
LEFT JOIN dbo.DIM_SEGMENT s
    ON p.CATEGORY = s.CATEGORY
    AND p.ATTR1 = s.ATTR1
    AND p.ATTR2 = s.ATTR2
    AND p.ATTR3 = s.ATTR3
    AND p.[FORMAT] = s.[FORMAT];
GO

-- Consulta 4. Número de semanas registradas por año y mes.
SELECT
    [YEAR] AS Anio,
    [MONTH] AS Mes,
    COUNT(*) AS SemanasRegistradas
FROM dbo.DIM_CALENDAR
GROUP BY [YEAR], [MONTH]
ORDER BY Anio, Mes;
GO

-- Las consultas reales de ventas están en el paso 9, después de importar FACT_SALES.
