USE AdventureWorks2022;

BEGIN TRANSACTION;

IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'AK_Product_ProductNumber')
    DROP INDEX AK_Product_ProductNumber ON Production.Product;

IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'AK_Product_Name')
    DROP INDEX AK_Product_Name ON Production.Product;

DECLARE @ProductNumberToAdd NVARCHAR(25);
SET @ProductNumberToAdd = 'ABS2137';

IF NOT EXISTS (SELECT 1 FROM Production.Product WHERE ProductNumber = @ProductNumberToAdd)
BEGIN
    INSERT INTO Production.Product 
    (
        Name,
        ProductNumber,
        MakeFlag,
        FinishedGoodsFlag,
        Color,
        SafetyStockLevel,
        ReorderPoint,
        StandardCost,
        ListPrice,
        Size,
        SizeUnitMeasureCode,
        WeightUnitMeasureCode,
        Weight,
        DaysToManufacture,
        ProductLine,
        Class,
        Style,
        ProductSubcategoryID,
        ProductModelID,
        SellStartDate,
        SellEndDate,
        DiscontinuedDate,
        rowguid,
        ModifiedDate
    )
    VALUES 
    (
        'New Product2',
        @ProductNumberToAdd,
        1,
        0,
        'Red',
        50,
        25,
        30.00,
        60.00,
        'L',
        'CM',
        'KG',
        10.5,
        7,
        'R',
        'H',
        'U',
        1,
        1,
        GETDATE(),
        NULL,
        NULL,
        NEWID(),
        GETDATE()
    );

    COMMIT TRANSACTION;
    PRINT 'Transaction committed.';
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
    PRINT 'Transaction rolled back. ProductNumber already exists.';
END