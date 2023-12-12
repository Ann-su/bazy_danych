USE AdventureWorks2022;
GO

CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(TaxRate)
    BEGIN
        DECLARE @OldTaxRate DECIMAL(8, 4);
        DECLARE @NewTaxRate DECIMAL(8, 4);

        SELECT @OldTaxRate = TaxRate FROM deleted;
        SELECT @NewTaxRate = TaxRate FROM inserted;

        IF ABS(@NewTaxRate - @OldTaxRate) > 0.30
        BEGIN
        RAISERROR ('Not allowed to change TaxRate more than 30%.',16,1)
        ROLLBACK
        END
    END
END;
