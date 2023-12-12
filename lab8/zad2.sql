BEGIN TRANSACTION;
USE AdventureWorks2022;

IF OBJECT_ID('UpdateLastNameToUpperV3', 'TR') IS NOT NULL
    DROP TRIGGER UpdateLastNameToUpperV3;
GO

CREATE TRIGGER UpdateLastNameToUpperV3
ON Person.Person
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE P
    SET P.LastName = UPPER(I.LastName)
    FROM Person.Person P
    INNER JOIN inserted I ON P.BusinessEntityID = I.BusinessEntityID;
END;
COMMIT;