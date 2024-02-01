use employees;
# 문제1) 각 부서별 1990년대에 부서장을 한 여성 직원의 수와 해당 부서를 나타내시오
select count(dm.emp_no)as '부서장 수' , d.dept_name
from dept_manager as dm
join employees as e on dm.emp_no = e.emp_no
join departments as d on dm.dept_no = d.dept_no
where e.gender = 'F' 
and dm.from_date >= '19900101' 
and dm.to_date between '19900101' and '99990101'
group by dm.dept_no, d.dept_name;
