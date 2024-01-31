use employees;
#문제 1) Human Resources 부서의 Manager 업무를 하는 사람의 1990년대 평균 연봉을 구하라
# 조인 테이블 ) departments, dept_emp(직원넘버, 부서넘버), titles(업무명),salaries(salary,from_date) avg()
select round(avg(salary)) as '평균연봉'
from dept_emp as a 
join departments as b on a.dept_no = b.dept_no
join titles as c on a.emp_no = c.emp_no
join salaries as d on a.emp_no = c.emp_no
where b.dept_name = 'Human Resources' and c.title = 'Manager' and d.from_date between '19900101' and '19991231';


