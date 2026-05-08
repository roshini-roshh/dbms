ALTER TABLE Employee
ADD phone VARCHAR2(15);

ALTER TABLE Employee
MODIFY emp_name VARCHAR2(100);

ALTER TABLE Employee
RENAME COLUMN emp_name TO employee_name;

ALTER TABLE Employee
ADD CONSTRAINT chk_salary
CHECK (salary > 1000);
