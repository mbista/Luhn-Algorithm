DECLARE @NumCheck VARCHAR (100);
DECLARE @Index  INT = 1;
DECLARE @CurNum INT = 0;
DECLARE @LUHNID INT = 0;
DECLARE @PrintSt VARCHAR(100);
DECLARE @NumLength INT;
--put in your NPI here.
SET @NumCheck = '3589296655688971855'


SET @NumCheck = RTRIM(LTRIM(@NumCheck))
SET @NumLength = LEN(@NumCheck)


WHILE(@Index!=@NumLength+1)
BEGIN
	IF ISNUMERIC(@NumCheck)=0	
	BEGIN
		PRINT 'Not a proper modulus 10'
		BREAK;
	END

	SET @CurNum = CAST (SUBSTRING(@NumCheck, @Index, 1) as INT)
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

		


