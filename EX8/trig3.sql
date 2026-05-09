CREATE OR REPLACE TRIGGER trg_prevent_update
BEFORE UPDATE OF salary
ON Employee
FOR EACH ROW

DECLARE
    current_hour NUMBER;

BEGIN

    current_hour :=
        TO_NUMBER(TO_CHAR(SYSDATE,'HH24'));

    IF current_hour >= 18
       OR current_hour < 9 THEN

        RAISE_APPLICATION_ERROR(
            -20001,
            'Salary updates are not allowed during restricted hours'
        );

    END IF;

END;
/
