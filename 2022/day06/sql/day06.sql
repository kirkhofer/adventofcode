DROP TABLE IF EXISTS dbo.Day06
GO
CREATE TABLE dbo.Day06(line VARCHAR(MAX))
GO
BULK INSERT dbo.Day06
FROM '/home/kirk/code/adventofcode/2022/Day06/input.txt'
WITH 
(
    FORMAT='CSV'
    ,FIELDTERMINATOR=''
    ,ROWTERMINATOR='\n'
    ,BATCHSIZE=10000
    ,TABLOCK
)
GO
SET NOCOUNT ON
GO
DECLARE @line VARCHAR(MAX)
SELECT TOP 1 @line=line FROM Day06

DECLARE @runs VARCHAR(10)='4,14'

DECLARE @len INT=0

DECLARE @i INT
    ,@x INT
    ,@cnt INT


DECLARE @tmp TABLE (chr CHAR(1) NOT NULL)

WHILE(1=1)
BEGIN
    SELECT TOP 1 @len=CAST(value AS INT) FROM string_split(@runs,',') WHERE CAST(value AS INT)> @len
    IF @@ROWCOUNT <> 0
    BEGIN
        SET @i = @len

        WHILE(1=1)
        BEGIN
            SET @x=0
            WHILE(@x < @len)
            BEGIN
                INSERT INTO @tmp (chr) VALUES(SUBSTRING(@line,@i-@x,1))
                SET @x = @x + 1
            END
            SELECT @cnt = COUNT(DISTINCT chr) FROM @tmp
            IF @cnt = @len
            BEGIN
                SELECT * FROM @tmp
                BREAK
            END
            DELETE FROM @tmp
            SET @i = @i + 1
        END
        PRINT('Answer is '+CAST(@i AS VARCHAR))
    END
    ELSE
    BEGIN
        BREAK
    END
END
GO
SET NOCOUNT OFF

-- DECLARE @str VARCHAR(10)='1234567890'
-- SELECT SUBSTRING(@str,1,1)