--1. Create a Simple Index
CREATE INDEX idx_student_name
ON Student(name);
--2. View Records Using Indexed Column
SELECT *
FROM Student
WHERE name = 'Ravi';
--3. Create Unique Index
CREATE UNIQUE INDEX idx_email
ON Student(email);
--4. Drop an Index
DROP INDEX idx_student_name;
--5. Show Table Structure
DESC Student;
--Medium (M) – Indexes 2,3,4 Queries
--1. Composite Index
CREATE INDEX idx_name_dept
ON Employee(name, department);
--2. Query Using Composite Index
SELECT *
FROM Employee
WHERE name = 'Arun'
AND department = 'CSE';
--3. Clustered Index (SQL Server Syntax)
CREATE CLUSTERED INDEX idx_empid
ON Employee(emp_id);
--4. Non-Clustered Index
CREATE NONCLUSTERED INDEX idx_salary
ON Employee(salary);
--5. Check Execution Plan
EXPLAIN
SELECT *
FROM Employee
WHERE salary > 50000;
