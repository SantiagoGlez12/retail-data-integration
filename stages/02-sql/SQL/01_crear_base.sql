-- Paso 1. Crear una base de datos nueva para la actividad.
-- Ejecutar este archivo primero. No borra bases de datos existentes.
IF DB_ID('Practica_Ventas') IS NULL
    CREATE DATABASE Practica_Ventas;
GO

USE Practica_Ventas;
GO

-- Comprobar que se creó correctamente.
SELECT name AS NombreBaseDatos
FROM sys.databases
WHERE name = 'Practica_Ventas';
GO
