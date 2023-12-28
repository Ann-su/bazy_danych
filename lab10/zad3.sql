USE AdventureWorks2022;

DECLARE @ProductIDToDelete INT;
SET @ProductIDToDelete = 1002; 

BEGIN TRANSACTION;

DELETE FROM Production.Product
WHERE ProductID = @ProductIDToDelete;

ROLLBACK TRANSACTION;