SET SERVEROUTPUT ON;

DECLARE
    num NUMBER := 153;
    temp NUMBER;
    rem NUMBER;
    sum_num NUMBER := 0;
BEGIN
    temp := num;

    WHILE temp > 0 LOOP
        rem := MOD(temp,10);
        sum_num := sum_num + (rem*rem*rem);
        temp := TRUNC(temp/10);
    END LOOP;

    IF sum_num = num THEN
        DBMS_OUTPUT.PUT_LINE(num || ' is Armstrong');
    ELSE
        DBMS_OUTPUT.PUT_LINE(num || ' is Not Armstrong');
    END IF;
END;
/
