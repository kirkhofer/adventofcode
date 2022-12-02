DROP TABLE IF EXISTS dbo.Day04
GO
CREATE TABLE dbo.Day04(Score1 VARCHAR(10),Score2 VARCHAR(10))
GO
BULK INSERT dbo.Day04
FROM '/home/kirk/code/adventofcode/2022/Day04/input.txt'
WITH 
(
    FORMAT='CSV'
    ,FIELDTERMINATOR=','
    ,ROWTERMINATOR='\n'
    ,BATCHSIZE=10000
    ,TABLOCK
)
GO
ALTER TABLE dbo.Day04 ADD ID INT IDENTITY(1,1)
ALTER TABLE dbo.Day04 ADD Section1 INT, Section2 INT, Section3 INT, Section4 INT
GO
DROP TABLE IF EXISTS #score
GO
SELECT ID, ROW_NUMBER() OVER(PARTITION BY ID ORDER BY ID) AS ScoreID,value INTO #score FROM dbo.Day04 d CROSS APPLY string_split(d.Score1,'-')
UNION
SELECT ID, ROW_NUMBER() OVER(PARTITION BY ID ORDER BY ID)+2 AS ScoreID,value  FROM dbo.Day04 d CROSS APPLY string_split(d.Score2,'-')

UPDATE Day04
SET
    Section1=x.Section1
    ,Section2=x.Section2
    ,Section3=x.Section3
    ,Section4=x.Section4
FROM    
    Day04 d
    JOIN 
    (
        SELECT ID
            ,MAX(IIF(ScoreID=1,value,NULL)) AS Section1
            ,MAX(IIF(ScoreID=2,value,NULL)) AS Section2
            ,MAX(IIF(ScoreID=3,value,NULL)) AS Section3
            ,MAX(IIF(ScoreID=4,value,NULL)) AS Section4
        FROM    
            #score
        GROUP BY    
            ID
    ) x ON d.ID = x.ID

GO
SELECT TOP 10 * FROM Day04
GO
SELECT 
    COUNT(DISTINCT ID) AS Answer1
    ,526 AS Total
FROM Day04 
WHERE
    (
    Section1 BETWEEN Section3 AND Section4
    AND Section2 BETWEEN Section3 AND Section4
    )
    OR
    (
    Section3 BETWEEN Section1 AND Section2
    AND Section4 BETWEEN Section1 AND Section2
    )
GO
SELECT 
    COUNT(DISTINCT ID) AS Answer1
    ,526 AS Total
FROM Day04 
WHERE
    (
        Section1 BETWEEN Section3 AND Section4
        OR Section2 BETWEEN Section3 AND Section4
        OR Section3 BETWEEN Section1 AND Section2
        OR Section4 BETWEEN Section1 AND Section2
    )