#문제 1) 성별이 여자인 직원의 이름을 출력하시오
use employees;
select first_name, last_name from employees where gender = 'F';
