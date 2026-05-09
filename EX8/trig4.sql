CREATE OR REPLACE TRIGGER trg_prevent_parent_delete
BEFORE DELETE
ON Department
FOR EACH ROW

DECLARE
    child_count NUMBER;

BEGIN

    SELECT COUNT(*)
    INTO child_count
    FROM Employee
    WHERE dept_id = :OLD.dept_id;

    IF child_count > 0 THEN

        RAISE_APPLICATION_ERROR(
            -20002,
            'Cannot delete department. Child records exist.'
        );

    END IF;

END;
/
