-- Basic LOOP
DECLARE
    lv_cnt_num NUMBER(2) := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(lv_cnt_num);
        EXIT WHEN lv_cnt_num >= 5;
        lv_cnt_num := lv_cnt_num + 1;
    END LOOP;
END;
