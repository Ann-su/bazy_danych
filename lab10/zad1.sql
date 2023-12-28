USE AdventureWorks2022;
BEGIN TRANSACTION;

UPDATE Production.Product
SET ListPrice = ListPrice * 1.1
WHERE ProductID = 680;
COMMIT TRANSACTION;
SELECT *
FROM Production.Product
WHERE ProductID = 680;