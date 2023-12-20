USE AdventureWorks2022;
CREATE TABLE TempEmployeeInfo
(
    EmployeeID INT,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    JobTitle NVARCHAR(100),
    Rate MONEY,
    RateChangeDate DATE
);

WITH EmployeeRatesCTE AS
(
    SELECT
        e.BusinessEntityID AS EmployeeID,
        pp.FirstName,
        pp.LastName,
        e.JobTitle,
        p.Rate,
        p.RateChangeDate
    FROM
    HumanResources.Employee e
    INNER JOIN
        HumanResources.EmployeePayHistory p ON e.BusinessEntityID = p.BusinessEntityID
    INNER JOIN
        Person.Person pp ON e.BusinessEntityID = pp.BusinessEntityID
)

INSERT INTO TempEmployeeInfo (EmployeeID, FirstName, LastName, JobTitle, Rate, RateChangeDate)
SELECT
    EmployeeID,
    FirstName,
    LastName,
    JobTitle,
    Rate,
    RateChangeDate
FROM
    EmployeeRatesCTE;
SELECT *
FROM TempEmployeeInfo;