SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE proc_employee_details
IS

    CURSOR emp_cursor IS
        SELECT emp_id,
               emp_name,
               job_title,
               hire_date,
               salary
        FROM Employee;

BEGIN

    DBMS_OUTPUT.PUT_LINE(
        'EMP_ID  EMP_NAME  JOB_TITLE  HIRE_DATE  SALARY'
    );

    FOR emp_rec IN emp_cursor LOOP

        DBMS_OUTPUT.PUT_LINE(
            emp_rec.emp_id || '   ' ||
            emp_rec.emp_name || '   ' ||
            emp_rec.job_title || '   ' ||
            emp_rec.hire_date || '   ' ||
            emp_rec.salary
        );

    END LOOP;

END;
/
--Execute Procedure
EXEC proc_employee_details;
