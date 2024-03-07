-- CONTINUE Statement
DECLARE
    lv_cnt_num NUMBER(3) := 0;
BEGIN
    FOR i IN 1..25 LOOP
        EXIT WHEN MOD(i, 5) = 0;
        DBMS_OUTPUT.PUT_LINE('Loop 1 value: '
                             || i);
        lv_cnt_num := lv_cnt_num + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Final execution count: '
                         || lv_cnt_num);
END;
