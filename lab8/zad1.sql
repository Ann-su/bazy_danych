IF OBJECT_ID('dbo.PrintFibonacciSequence', 'P') IS NOT NULL
    DROP PROCEDURE dbo.PrintFibonacciSequence;
GO
IF OBJECT_ID('dbo.Fibonacci', 'FN') IS NOT NULL
    DROP FUNCTION dbo.Fibonacci;
GO

CREATE FUNCTION dbo.Fibonacci(@n INT) RETURNS INT
AS
BEGIN
    DECLARE @result INT;

    IF @n = 0
        SET @result = 0;
    ELSE IF @n = 1
        SET @result = 1;
    ELSE
        SET @result = dbo.Fibonacci(@n - 1) + dbo.Fibonacci(@n - 2);

    RETURN @result;
END;
GO

CREATE PROCEDURE dbo.PrintFibonacciSequence @n INT
AS
BEGIN
    DECLARE @FibonacciSequence TABLE (FibValue INT);

    INSERT INTO @FibonacciSequence
    SELECT dbo.Fibonacci(n)
    FROM (SELECT TOP (@n) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS n FROM sys.objects) AS Numbers;

    SELECT FibValue
    FROM @FibonacciSequence;
END;
GO

EXEC dbo.PrintFibonacciSequence @n = 10;