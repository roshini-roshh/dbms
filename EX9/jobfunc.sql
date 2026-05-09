SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION fn_job_titles
RETURN VARCHAR2
IS

BEGIN

    DBMS_OUTPUT.PUT_LINE('JOB TITLES');

    FOR rec IN (
        SELECT DISTINCT job_title
        FROM Employee
    )
    LOOP

        DBMS_OUTPUT.PUT_LINE(rec.job_title);

    END LOOP;

    RETURN 'Job Titles Displayed Successfully';

END;
/
--Execute Function
DECLARE
    result VARCHAR2(100);
BEGIN

    result := fn_job_titles;

    DBMS_OUTPUT.PUT_LINE(result);

END;
/
