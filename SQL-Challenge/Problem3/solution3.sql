-- write your solution here
--excluding 1 row
with cte as(
select test_id, marks, lag(marks) over(order by test_id) as prev_marks from student_marks
)
select test_id, marks from cte where prev_marks < marks;

--including 1 row
with cte as(
select test_id, marks, COALESCE(LAG(marks) OVER(ORDER BY test_id), 0) AS prev_marks from student_marks
)
select test_id, marks from cte where prev_marks < marks;