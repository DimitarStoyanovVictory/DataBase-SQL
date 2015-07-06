CREATE FUNCTION ufn_CalcIR(@CurrentSum money, @YearInterestRate money, @NumberOfMonths int)
RETURNS money
AS
BEGIN
DECLARE @MonthlyInterestRate money
SET @MonthlyInterestRate = @YearInterestRate / 12
  RETURN @CurrentSum  * (1 + (@NumberOfMonths * @MonthlyInterestRate / 100))
END
GO

