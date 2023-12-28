USE AdventureWorks2022;


BEGIN TRANSACTION;

UPDATE Sales.SalesOrderDetail
SET OrderQty = OrderQty + 1;

IF EXISTS (SELECT 1 FROM Sales.SalesOrderDetail WHERE OrderQty = 0)
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Transaction rolled back. OrderQty cannot be 0.';
END
ELSE
BEGIN
    COMMIT TRANSACTION;
    PRINT 'Transaction committed.';
END