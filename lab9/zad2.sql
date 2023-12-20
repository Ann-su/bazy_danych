USE AdventureWorksLT2022;
WITH SalesInfoCTE AS
(
    SELECT
        c.CustomerID,
        CONCAT(c.CompanyName, '( ', c.FirstName, ' ', c.LastName, ')') AS CompanyContact,
        soh.TotalDue
    FROM
        SalesLT.Customer c
    INNER JOIN
        SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
)

SELECT
    CompanyContact,
    SUM(TotalDue) AS Revenue
FROM
    SalesInfoCTE
GROUP BY
    CompanyContact
ORDER BY CompanyContact ASC;