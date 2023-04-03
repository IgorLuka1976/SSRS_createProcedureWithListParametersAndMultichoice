-----Important
USE [AdventureWorks2019]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[testForSSRS] @param1 NVARCHAR(MAX)
AS

SELECT *
FROM HumanResources.Employee
WHERE BusinessEntityID IN (@param1)
