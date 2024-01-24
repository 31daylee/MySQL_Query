#문제 1) 1960년 이후 태어난 employees의 이름(성_first name) 목록을 출력하시오
SELECT first_name FROM employees.employees WHERE date_format(birth_date, '%YY-%mm-%dd') >'19600101';

#문제 2) dept_manager에서 부서 번호의 끝자리가 9에 해당하는 emp_no를 출력하시오
SELECT emp_no FROM employees.dept_manager WHERE dept_no LIKE '%9';

#문제 3) 1980년도 이후 입사한 emp중 Engineer가 아닌 emp_no을 출력하시오
SELECT emp_no FROM employees.titles WHERE from_date > '19800101' AND title <> 'Engineer';