SET SERVEROUTPUT ON;

DECLARE
    num NUMBER := 17;
    i NUMBER;
    flag NUMBER := 0;
BEGIN
    FOR i IN 2..num-1 LOOP
        IF MOD(num,i)=0 THEN
            flag := 1;
            EXIT;
        END IF;
    END LOOP;

    IF flag = 0 THEN
        DBMS_OUTPUT.PUT_LINE(num || ' is Prime');
    ELSE
        DBMS_OUTPUT.PUT_LINE(num || ' is Not Prime');
    END IF;
END;
/
