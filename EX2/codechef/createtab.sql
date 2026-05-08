CREATE TABLE Employee (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE,
    salary NUMBER CHECK (salary > 0),
    department VARCHAR2(30) DEFAULT 'HR'
);
