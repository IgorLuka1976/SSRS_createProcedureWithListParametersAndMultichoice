# SSRS_createProcedureWithListParametersAndMultichoice

How to create Procedure, which will be use in SSRS, appling List Parametr

For design example report, need to create simple procedure with INT parametr:
Step1:
"
USE AdventureWorks2019
GO

CREATE PROCEDURE testForSSRS @param1 INT
AS

SELECT *
FROM HumanResources.Employee
WHERE BusinessEntityID=@param1
"

Now will try to design simple report with Multichoice Parametr
and have a error. Description by target
https://docs.google.com/document/d/1-zoETjH9a2diyPg9tFjFG7_StRrwV8pHQFDPSFM_weI/edit?usp=sharing

The first solution to this problem is to replace the data type of the parameter from INT to NVARCHAR(MAX).
and now the question arises how to create a filter correctly in the procedure.

If simple change from 'WHERE BusinessEntityID=@param1' To 'WHERE BusinessEntityID IN (@param1)' and change type of parametr from INT to NVARCHAR(MAX) (In Step2)
, then procedure will saved without any error, but it also won't work in SSRS Report.

Step2:
https://docs.google.com/document/d/1_LfclIXal3VW9NzgXJUkdqby6GfyGM8tRUHTfcWBHKM/edit?usp=sharing

Solution-Step3:
Change type of filter From WHERE To JOIN. In this example:
change row in Procedure 'WHERE BusinessEntityID IN (@param1)' To 'INNER JOIN STRING_SPLIT(@param1, ',') t ON t.value=BusinessEntityID'

Refresh Report or Best ReCreate Report, if won't to refresh.
https://docs.google.com/document/d/11W2K5v0JxIv-pEAYkxtwpNb_cEjgGr4a3y8BvjYXC6I/edit?usp=sharing
And It's work!
