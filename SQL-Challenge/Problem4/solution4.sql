-- write your solution here
WITH cte AS (
    SELECT product_id, day_indicator, dates, 
        CASE
            WHEN DAYOFWEEK(dates) = 2 THEN 1
            WHEN DAYOFWEEK(dates) = 3 THEN 2
            WHEN DAYOFWEEK(dates) = 4 THEN 3
            WHEN DAYOFWEEK(dates) = 5 THEN 4
            WHEN DAYOFWEEK(dates) = 6 THEN 5
            WHEN DAYOFWEEK(dates) = 7 THEN 6
            WHEN DAYOFWEEK(dates) = 1 THEN 7
        END AS day_c
    FROM day_indicator
)
SELECT product_id, day_indicator, dates
FROM cte WHERE SUBSTR(day_indicator, day_c, 1) = 1;
