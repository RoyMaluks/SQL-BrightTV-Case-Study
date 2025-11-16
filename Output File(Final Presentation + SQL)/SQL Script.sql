--check all column names and to check data types on both tables---------------------------------------------------------------------------------------------------

select * from viewer_ship;
select *  from user_profile;

--Total user on Sun------------------------------------------------------------------------------------------------------------
SELECT 
    COUNT(DISTINCT UserID) AS Users_On_Sunday
FROM viewer_ship
WHERE DATE_PART(-
          'DOW', 
          TO_TIMESTAMP(RecordDate2, 'YYYY/MM/DD HH24:MI') + INTERVAL '2 HOUR'
      ) = 0; 
      
------------------------------------------------------------------------------------------------------------------------------
--Total Users after join the tables---------------------------------------------------------------------------------------------------
SELECT 
    COUNT(DISTINCT a.UserID) AS Total_Users
FROM viewer_ship a
JOIN user_profile b
    ON a.UserID = b.UserID;

------------------------------------------------------------------------------------------------------------------------------
--AVG Duration min------------------------------------------------------------------------------------------------------------

SELECT 
    AVG(DATE_PART('HOUR', duration2) * 60 
        + DATE_PART('MINUTE', duration2)) AS avg_time_minutes
FROM viewer_ship;

------------------------------------------------------------------------------------------------------------------------------
--Total channels-------------------------------------------------------------------------------------------------------------

 select  distinct(channel2) as total_channels
 from viewer_ship;

------------------------------------------------------------------------------------------------------------------------------
--Conveting UTC to SA Time(UTC+2)

SELECT 
    UserID,
    Channel2,
    TO_DATE(TO_TIMESTAMP(RecordDate2, 'YYYY/MM/DD HH24:MI') + INTERVAL '2 HOUR') AS SA_Date,
    TO_VARCHAR(TO_TIMESTAMP(RecordDate2, 'YYYY/MM/DD HH24:MI') + INTERVAL '2 HOUR', 'HH24:MI') AS SA_Time,
    Duration2
FROM viewer_ship;

------------------------------------------------------------------------------------------------------------------------------
--Gender Distribution---------------------------------------------------------------------------------------------------------

SELECT 
    COALESCE(NULLIF(LOWER(Gender), 'none'), 'Unknown') AS Gender,
    COUNT(*) AS User_Count
FROM user_profile
GROUP BY COALESCE(NULLIF(LOWER(Gender), 'none'), 'Unknown');

------------------------------------------------------------------------------------------------------------------------------
--Age Group Distribution/Age_Bucket-------------------------------------------------------------------------------------------

SELECT
    UserID,
    Age,
    CASE
        WHEN Age BETWEEN 0 AND 17 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 24 THEN '18-24 (Young Adult)'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34 (Adult)'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44 (Mid-Age Adult)'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54 (Mature Adult)'
        WHEN Age >= 55 THEN '55+ (Senior)'
        ELSE 'Unknown Age'
    END AS Age_Bucket
FROM user_profile;

------------------------------------------------------------------------------------------------------------------------------
--users by province-----------------------------------------------------------------------------------------------------------
SELECT 
    COALESCE(NULLIF(LOWER(Province), 'none'), 'Unknown Province') AS Province,
    COUNT(*) AS Total_Users
FROM user_profile
GROUP BY COALESCE(NULLIF(LOWER(Province), 'none'), 'Unknown Province')
ORDER BY Total_Users DESC;

------------------------------------------------------------------------------------------------------------------------------
--Most Watched Channels-------------------------------------------------------------------------------------------------------
SELECT 
    Channel2 AS Channel,
    COUNT(*) AS Total_Sessions
FROM viewer_ship
GROUP BY Channel2
ORDER BY Total_Sessions DESC;


------------------------------------------------------------------------------------------------------------------------------
--Peak Viewing Hours----------------------------------------------------------------------------------------------------------

SELECT 
    DATE_PART('HOUR', TO_TIMESTAMP(RecordDate2, 'YYYY/MM/DD HH24:MI') + INTERVAL '2 HOUR') AS SA_Hour,
    COUNT(*) AS Total_Sessions
FROM viewer_ship
GROUP BY DATE_PART('HOUR', TO_TIMESTAMP(RecordDate2, 'YYYY/MM/DD HH24:MI') + INTERVAL '2 HOUR')
ORDER BY SA_Hour;


------------------------------------------------------------------------------------------------------------------------------
--Factors Influencing Consumption
--Age vs Average Watch Duration


SELECT 
    CASE 
        WHEN Age BETWEEN 0 AND 17 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 24 THEN '18-24 (Young Adult)'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34 (Adult)'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44 (Mid-Age Adult)'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54 (Mature Adult)'
        WHEN Age >= 55 THEN '55+ (Senior)'
        ELSE 'Unknown Age'
    END AS Age_Group,
    AVG(DATE_PART('HOUR', b.Duration2) * 60 + DATE_PART('MINUTE', b.Duration2)) AS Avg_Duration_Minutes
FROM user_profile AS a
JOIN viewer_ship AS b 
    ON a.UserID = b.UserID
GROUP BY 
    CASE 
        WHEN Age BETWEEN 0 AND 17 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 24 THEN '18-24 (Young Adult)'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34 (Adult)'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44 (Mid-Age Adult)'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54 (Mature Adult)'
        WHEN Age >= 55 THEN '55+ (Senior)'
        ELSE 'Unknown Age'
    END
ORDER BY Age_Group;

------------------------------------------------------------------------------------------------------------------------------

--Province vs Average Watch Duration
SELECT 
    COALESCE(NULLIF(LOWER(a.Province), 'none'), 'Unknown Province') AS Province,
    AVG(DATE_PART('HOUR', b.Duration2) * 60 + DATE_PART('MINUTE', b.Duration2)) AS Avg_Duration_Minutes
FROM user_profile a
JOIN viewer_ship b
    ON a.UserID = b.UserID
GROUP BY COALESCE(NULLIF(LOWER(a.Province), 'none'), 'Unknown Province')
ORDER BY Avg_Duration_Minutes DESC;

------------------------------------------------------------------------------------------------------------------------------




------------------------------------------------------------------------------------------------------------------------------

----single SELECT query for BrightTV analytics

------------------------------------------------------------------------------------------------------------------------------

SELECT 
    -- Date & Day
    TO_DATE(TO_TIMESTAMP(a.RecordDate2, 'YYYY/MM/DD HH24:MI') + INTERVAL '2 HOUR') AS SA_Date,
    INITCAP(TO_CHAR(TO_TIMESTAMP(a.RecordDate2, 'YYYY/MM/DD HH24:MI') + INTERVAL '2 HOUR', 'DY')) AS Day_Name,
    CASE 
        WHEN DATE_PART('DOW', TO_TIMESTAMP(a.RecordDate2, 'YYYY/MM/DD HH24:MI') + INTERVAL '2 HOUR') IN (0, 6) THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_Classification,
    
    -- Time
    TO_VARCHAR(TO_TIMESTAMP(a.RecordDate2, 'YYYY/MM/DD HH24:MI') + INTERVAL '2 HOUR', 'HH24:MI') AS SA_Time,
    CASE 
        WHEN DATE_PART('HOUR', TO_TIMESTAMP(a.RecordDate2, 'YYYY/MM/DD HH24:MI') + INTERVAL '2 HOUR') BETWEEN 6 AND 11 THEN 'Morning'
        WHEN DATE_PART('HOUR', TO_TIMESTAMP(a.RecordDate2, 'YYYY/MM/DD HH24:MI') + INTERVAL '2 HOUR') BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN DATE_PART('HOUR', TO_TIMESTAMP(a.RecordDate2, 'YYYY/MM/DD HH24:MI') + INTERVAL '2 HOUR') BETWEEN 17 AND 20 THEN 'Evening'
        ELSE 'Night'
    END AS Time_Classification,
    DATE_PART('HOUR', TO_TIMESTAMP(a.RecordDate2, 'YYYY/MM/DD HH24:MI') + INTERVAL '2 HOUR') AS SA_Hour,

    -- User & Demographics
    b.UserID,
    COALESCE(NULLIF(LOWER(b.Gender), 'none'), 'Unknown') AS Gender,
    CASE
        WHEN b.Age BETWEEN 0 AND 17 THEN 'Under 18'
        WHEN b.Age BETWEEN 18 AND 24 THEN '18-24 (Young Adult)'
        WHEN b.Age BETWEEN 25 AND 34 THEN '25-34 (Adult)'
        WHEN b.Age BETWEEN 35 AND 44 THEN '35-44 (Mid-Age Adult)'
        WHEN b.Age BETWEEN 45 AND 54 THEN '45-54 (Mature Adult)'
        WHEN b.Age >= 55 THEN '55+ (Senior)'
        ELSE 'Unknown Age'
    END AS Age_Bucket,
    COALESCE(NULLIF(LOWER(b.Province), 'none'), 'Unknown Province') AS Province,

    -- Channel & Duration
    a.Channel2 AS Channel,
    SUM(DATE_PART('HOUR', a.Duration2) * 60 + DATE_PART('MINUTE', a.Duration2)) AS Total_Duration_Minutes,
    round(AVG(DATE_PART('HOUR', a.Duration2) * 60 + DATE_PART('MINUTE', a.Duration2)),2) AS Avg_Duration_Minutes,

    -- Total Sessions
    COUNT(*) AS Total_Sessions,

    -- Watch Duration Bucket
    CASE
        WHEN AVG(DATE_PART('HOUR', a.Duration2) * 60 + DATE_PART('MINUTE', a.Duration2)) = 0 THEN 'No Watch'
        WHEN AVG(DATE_PART('HOUR', a.Duration2) * 60 + DATE_PART('MINUTE', a.Duration2)) BETWEEN 1 AND 30 THEN 'Low Watch'
        WHEN AVG(DATE_PART('HOUR', a.Duration2) * 60 + DATE_PART('MINUTE', a.Duration2)) BETWEEN 31 AND 90 THEN 'Medium Watch'
        ELSE 'High Watch'
    END AS Watch_Bucket,

    -- Consumption Category
CASE
    WHEN COUNT(*) < (SELECT AVG(cnt) 
                     FROM (SELECT COUNT(*) AS cnt 
                           FROM viewer_ship 
                           GROUP BY TO_DATE(TO_TIMESTAMP(RecordDate2, 'YYYY/MM/DD HH24:MI') + INTERVAL '2 HOUR'))) 
        THEN 'Low Consumption'
        
    WHEN COUNT(*) BETWEEN (SELECT AVG(cnt) 
                           FROM (SELECT COUNT(*) AS cnt 
                                 FROM viewer_ship 
                                 GROUP BY TO_DATE(TO_TIMESTAMP(RecordDate2, 'YYYY/MM/DD HH24:MI') + INTERVAL '2 HOUR'))) 
                     AND (SELECT 1.5 * AVG(cnt) 
                          FROM (SELECT COUNT(*) AS cnt 
                                FROM viewer_ship 
                                GROUP BY TO_DATE(TO_TIMESTAMP(RecordDate2, 'YYYY/MM/DD HH24:MI') + INTERVAL '2 HOUR')))
        THEN 'Medium Consumption'
        
    ELSE 'High Consumption'
END AS Consumption_Category

FROM viewer_ship a
JOIN user_profile b
    ON a.UserID = b.UserID

GROUP BY 
    SA_Date,
    Day_Name,
    Day_Classification,
    SA_Time,
    Time_Classification,
    SA_Hour,
    b.UserID,
    Gender,
    Age_Bucket,
    Province,
    a.Channel2

ORDER BY SA_Date, SA_Hour;
