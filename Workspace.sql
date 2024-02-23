DECLARE
    v_amt1 NUMBER(5, 2);
    v_amt2 NUMBER(3, 0);
BEGIN
    v_amt1 := 32.50;
    v_amt2 := ROUND(v_amt1, 0);
    DBMS_OUTPUT.PUT_LINE(v_amt2);
