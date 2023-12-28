USE AdventureWorks2022;
BEGIN TRANSACTION;

UPDATE Production.Product
SET StandardCost = StandardCost * 1.1;

IF (SELECT SUM(StandardCost) FROM Production.Product) <= 50000
BEGIN
    COMMIT TRANSACTION;
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
END