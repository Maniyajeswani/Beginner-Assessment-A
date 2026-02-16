-- write your solution here
WITH cte AS (
    SELECT * FROM salary
    CROSS JOIN (
        SELECT *, 'income' as type FROM income
        UNION ALL
        SELECT *, 'deduction' as type FROM deduction
    ) t
)

SELECT 
    emp_id,
    emp_name,
    base_salary,

    MAX(CASE WHEN income = 'Basic' 
             THEN ROUND((percentage * base_salary)/100,0) END) AS Basic,

    MAX(CASE WHEN income = 'Allowance' 
             THEN ROUND((percentage * base_salary)/100,0) END) AS Allowance,

    MAX(CASE WHEN income = 'Others' 
             THEN ROUND((percentage * base_salary)/100,0) END) AS Others,

    MAX(CASE WHEN income = 'Insurance' 
             THEN ROUND((percentage * base_salary)/100,0) END) AS Insurance,

    MAX(CASE WHEN income = 'Health' 
             THEN ROUND((percentage * base_salary)/100,0) END) AS Health,

    MAX(CASE WHEN income = 'House' 
             THEN ROUND((percentage * base_salary)/100,0) END) AS House,

        SUM(CASE 
            WHEN type = 'income'
            THEN ROUND((percentage * base_salary)/100,0)
            ELSE 0
        END) AS GROSS,
    SUM(CASE 
            WHEN type = 'deduction'
            THEN ROUND((percentage * base_salary)/100,0)
            ELSE 0
        END) AS TOTAL_DEDUCTIONS,
        
        SUM(CASE 
        WHEN type = 'income'
        THEN ROUND((percentage * base_salary)/100,0)
        ELSE 0
    END)
-
SUM(CASE 
        WHEN type = 'deduction'
        THEN ROUND((percentage * base_salary)/100,0)
        ELSE 0
    END) AS net_pay
FROM cte
GROUP BY emp_id, emp_name, base_salary
ORDER BY emp_id;
