USE AdventureWorks2022;
BEGIN TRANSACTION;

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
    'New Product',
    'ABC123',
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
