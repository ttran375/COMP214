-- WHILE Loop
DECLARE
    lv_cnt_num NUMBER(2) := 1;
BEGIN
    WHILE lv_cnt_num <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE(lv_cnt_num);
        lv_cnt_num := lv_cnt_num + 1;
    END LOOP;
END;
