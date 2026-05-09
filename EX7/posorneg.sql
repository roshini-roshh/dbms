SET SERVEROUTPUT ON;

DECLARE
    num NUMBER := -25;
BEGIN
    IF num > 0 THEN
        DBMS_OUTPUT.PUT_LINE(num || ' is Positive');
    ELSIF num < 0 THEN
        DBMS_OUTPUT.PUT_LINE(num || ' is Negative');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Number is Zero');
    END IF;
END;
/
