--Cursor with Exception Handling
--Count employees:

--residing in ‘sivakasi’
--earning salary greater than department average salary
SET SERVEROUTPUT ON;

DECLARE

    CURSOR emp_cursor IS
        SELECT empid, empname, salary, city, deptno
        FROM Employee e
        WHERE LOWER(city) = 'sivakasi'
        AND salary >
        (
            SELECT AVG(salary)
            FROM Employee
            WHERE deptno = e.deptno
        );

    v_empid Employee.empid%TYPE;
    v_empname Employee.empname%TYPE;
    v_salary Employee.salary%TYPE;
    v_city Employee.city%TYPE;
    v_deptno Employee.deptno%TYPE;

    emp_count NUMBER := 0;

BEGIN

    OPEN emp_cursor;

    LOOP

        FETCH emp_cursor INTO
            v_empid,
            v_empname,
            v_salary,
            v_city,
            v_deptno;

        EXIT WHEN emp_cursor%NOTFOUND;

        emp_count := emp_count + 1;

        DBMS_OUTPUT.PUT_LINE(
            v_empid || ' ' ||
            v_empname || ' ' ||
            v_salary || ' ' ||
            v_city
        );

    END LOOP;

    CLOSE emp_cursor;

    DBMS_OUTPUT.PUT_LINE(
        'Total Employees = ' || emp_count
    );

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No Employee Found');

    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Division by Zero Error');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error Occurred: ' || SQLERRM
        );

END;
/
