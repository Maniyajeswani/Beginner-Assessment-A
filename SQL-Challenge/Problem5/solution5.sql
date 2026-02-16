-- write your solution here
with cte as(
    SELECT *,
           COUNT(job_role) OVER (ORDER BY row_id) AS grp
    FROM job_skills
    )
    select row_id, max(job_role) over(partition by grp) as job_role, skills from cte;
