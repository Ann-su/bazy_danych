USE AdventureWorks2022;

BEGIN TRANSACTION;

DECLARE @AverageCost DECIMAL(18, 2);

SELECT @AverageCost = AVG(StandardCost)
FROM Production.Product;

UPDATE Production.Product
SET StandardCost = @AverageCost
WHERE StandardCost > @AverageCost;

DECLARE @ModifiedProductCount INT;

SELECT @ModifiedProductCount = @@ROWCOUNT;

IF @ModifiedProductCount > 200
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Transaction rolled back. Number of modified products exceeds 200.';
END
ELSE
BEGIN
    COMMIT TRANSACTION;
    PRINT 'Transaction committed. Number of modified products: ' + CAST(@ModifiedProductCount AS NVARCHAR(10));
END