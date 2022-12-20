SELECT COUNT(employee.id) as NUMBER, department.name FROM employee 
RIGHT JOIN department ON department.id = employee.dept_id
GROUP BY dept_id, department.name
ORDER BY number DESC, department.name ASC
