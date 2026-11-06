-- Paso 6. Crear la tabla FACT_SALES con las columnas del archivo recibido.
-- ITEM_CODE es texto porque algunos códigos tienen letras (por ejemplo, BP1).
-- Si ya hiciste los pasos anteriores, empieza desde este paso.
USE Practica_Ventas;
GO

CREATE TABLE dbo.FACT_SALES (
    [WEEK] VARCHAR(5) NOT NULL,
    ITEM_CODE VARCHAR(30) NOT NULL,
    TOTAL_UNIT_SALES DECIMAL(18,4) NOT NULL,
    TOTAL_VALUE_SALES DECIMAL(18,4) NOT NULL,
    TOTAL_UNIT_AVG_WEEKLY_SALES DECIMAL(18,4) NOT NULL,
    REGION NVARCHAR(80) NOT NULL
);
GO

-- Verificar que se creó la quinta tabla.
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'FACT_SALES';
GO
