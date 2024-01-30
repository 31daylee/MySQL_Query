use employees;
#문제 1) 80년~90년 사이에 입사한 여성 중 95년 이전에 부서장으로 진급한 사람의 이름과 부서, 업무를 구하시오
select b.first_name, c.dept_name, d.title
from dept_manager as a
join employees as b on a.emp_no = b.emp_no 
join departments as c on a.dept_no = c.dept_no
join titles as d on b.emp_no = d.emp_no
where b.hire_date between '19800101' and '19901231' and b.gender = 'F' and a.to_date <='19950101';
