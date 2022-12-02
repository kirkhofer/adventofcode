DROP TABLE IF EXISTS dbo.Day02
GO
CREATE TABLE dbo.Day02(Player2 CHAR(1),Player1 CHAR(1))
GO
BULK INSERT dbo.Day02
FROM '/home/kirk/code/adventofcode/2022/day02/input.txt'
WITH 
(
    FORMAT='CSV'
    ,FIELDTERMINATOR=' '
    ,ROWTERMINATOR='\n'
    ,BATCHSIZE=10000
    ,TABLOCK
)
GO

DECLARE @Config TABLE(Type VARCHAR(10),p2Src CHAR(1),p1Src CHAR(1),Winner VARCHAR(10),Loser VARCHAR(10),Points INT)

INSERT INTO @Config
VALUES
    ('Rock','A','X','Paper','Scissors',1)
    ,('Paper','B','Y','Scissors','Rock',2)
    ,('Scissors','C','Z','Rock','Paper',3)


SELECT SUM(x.WinLoseDrawPoints+x.Points), 12276 AS Winner
FROM
(
    SELECT
        p1.Type AS Elf
        ,p2.Type AS Other
        ,CASE
            WHEN p1.Type=p2.Loser THEN 0
            WHEN p1.Type=p2.Winner THEN 6
            ELSE 3
            END AS WinLoseDrawPoints
        ,p1.Points
    FROM
        dbo.Day02 d
        JOIN @Config p1 ON d.Player1 = p1.p1Src
        JOIN @Config p2 ON d.Player2 = p2.p2Src
) x

SELECT  
    -- TOP 5
    -- d.*
    -- ,calc.*
    -- ,p2.Type
    -- ,p1.Type
    -- ,p1.Points
    -- ,calc.WinLoseVal+p1.Points AS TotalPoints
    SUM(calc.WinLoseVal+p1.Points)
    ,9975 AS Winner
FROM
    dbo.Day02 d
    CROSS APPLY 
    (
        SELECT CASE d.Player1 WHEN 'X' THEN 'Loser' WHEN 'Y' THEN 'Draw' WHEN 'Z' THEN 'Winner' END AS WinLoseType
        ,CASE d.Player1 WHEN 'X' THEN 0 WHEN 'Y' THEN 3 WHEN 'Z' THEN 6 END AS WinLoseVal
    ) calc
    JOIN @Config p2 ON d.Player2 = p2.p2Src
    JOIN @Config p1 ON p1.Type = (CASE calc.WinLoseType WHEN 'Winner' THEN p2.Winner WHEN 'Loser' THEN p2.Loser ELSE p2.Type END)