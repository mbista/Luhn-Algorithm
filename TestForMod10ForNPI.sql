DECLARE @NPI VARCHAR (10);
DECLARE @Index  INT = 1;
DECLARE @CurNum INT = 0;
DECLARE @LUHNID INT = 0;
DECLARE @PrintSt VARCHAR(100);

--put in your NPI here.
SET @NPI = '1407854771'


SET @NPI = RTRIM(LTRIM(@NPI))
IF LEN(@NPI)!=10	
	PRINT 'Not a proper modulus 10'
IF ISNUMERIC(@NPI)=0	
	PRINT 'Not a proper modulus 10'

WHILE(@Index!=11)
BEGIN
	SET @CurNum = CAST (SUBSTRING(@NPI, @Index, 1) as INT)
	SET @CurNum = @CurNum *(
		CASE
			WHEN ((@Index-1)%2) = 0 THEN 2
		ELSE 1
		END)
	IF (@CurNum>9)
		 SET @CurNum -= 9;
	SET @LUHNID += @CurNum;
	SET @Index+=1;
END
	SET @LUHNID += 24;
	SET @PrintSt = 
	CASE 
		WHEN (@LUHNID%10= 0) THEN 'It''s a proper Mod 10'
	ELSE
		'Not a proper modulus 10'
	END
PRINT @PrintSt
