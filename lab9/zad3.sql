WITH SalesByCategoryCTE AS
(
    SELECT
        pc.Name AS CategoryName,
        p.Name AS ProductName,
        sod.OrderQty * sod.UnitPrice AS SalesAmount
    FROM
        SalesLT.SalesOrderDetail sod
    INNER JOIN
        SalesLT.Product p ON sod.ProductID = p.ProductID
    INNER JOIN
        SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
)

SELECT
    CategoryName,
    SUM(SalesAmount) AS TotalSales
FROM
    SalesByCategoryCTE
GROUP BY
    CategoryName
ORDER BY
    TotalSales DESC;