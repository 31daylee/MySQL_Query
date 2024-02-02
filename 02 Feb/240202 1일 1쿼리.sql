#문제1) 각 부서별 engineer 직원수를 모두 구하라(engineer 들어가는 모든 직급 포함)
select de.dept_no, count(t.emp_no) as 'Engineer Employees'
from titles as t
join dept_emp as de on t.emp_no = de.emp_no
where title like '%engineer%'
group by de.dept_no
order by de.dept_no;

-- 위와 성능 동일 
select de.dept_no, count(t.emp_no) as 'Engineer Employees'
from dept_emp as de
join titles as t on t.emp_no = de.emp_no
where title like '%engineer%'
group by de.dept_no
order by de.dept_no;