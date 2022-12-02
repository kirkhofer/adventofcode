DROP TABLE IF EXISTS dbo.Day202101
GO
CREATE TABLE dbo.Day202101(Depth INT)
GO
BULK INSERT dbo.Day202101
FROM '/home/kirk/code/adventofcode/2021/day01/input.txt'
WITH 
(
    FORMAT='CSV'
    ,ROWTERMINATOR='\n'
    ,BATCHSIZE=10000
    ,TABLOCK
    ,KEEPIDENTITY
)
GO
ALTER TABLE dbo.Day202101 ADD ID INT IDENTITY(1,1)
GO
SELECT
    COUNT(*) AS Answer1
    ,1387 AS RightAnswer1
    -- d.Depth-d_prev.Depth
    -- ,d.Depth
    -- ,d_prev.Depth AS PrevDepth
    -- ,d.ID
    -- ,d_prev.ID
FROM        
    Day202101 d
    JOIN Day202101 d_prev ON d.ID-1 = d_prev.ID
WHERE
    d.Depth > d_prev.Depth

;WITH Agg_CTE AS
(
    SELECT 
        d.ID
        ,d.Depth
        ,SUM(d.Depth) OVER(ORDER BY d.ID ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING)  AS Agg
    FROM    
        Day202101 d
)
SELECT
    COUNT(*) AS Answer2
    ,1362 AS RightAnswer2
FROM        
    Agg_CTE d
    JOIN Agg_CTE d_prev ON d.ID-1 = d_prev.ID
WHERE
    d.Agg > d_prev.Agg