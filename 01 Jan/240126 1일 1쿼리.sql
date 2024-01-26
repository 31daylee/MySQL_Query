#문제 1) Department가 Marketing에 해당하는 employee 수를 카운트 하시오.
USE employees;
SELECT COUNT(*) 
FROM departments a 
JOIN dept_emp b 
ON a.dept_no = b.dept_no
WHERE a.dept_name = 'Marketing';