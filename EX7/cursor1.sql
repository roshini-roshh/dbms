--Cursor to Retrieve Employee Names Starting With ‘A’
SET SERVEROUTPUT ON;

DECLARE
    CURSOR emp_cursor IS
        SELECT empid, empname, salary
        FROM Employee
        WHERE LOWER(empname) LIKE 'a%';

    v_empid Employee.empid%TYPE;
    v_empname Employee.empname%TYPE;
    v_salary Employee.salary%TYPE;

BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO v_empid, v_empname, v_salary;

        EXIT WHEN emp_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            v_empid || ' ' ||
            v_empname || ' ' ||
            v_salary
        );

        DBMS_OUTPUT.PUT_LINE(
            'ROW COUNT: ' || emp_cursor%ROWCOUNT
        );
    END LOOP;

    IF emp_cursor%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is Open');
    END IF;

    CLOSE emp_cursor;

    IF emp_cursor%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No More Records');
    END IF;

END;
/
