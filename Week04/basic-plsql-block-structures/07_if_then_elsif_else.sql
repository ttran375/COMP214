-- IF/THEN/ELSIF/ELSE
DECLARE
    lv_state_txt CHAR(2) := 'ME';
    lv_sub_num   NUMBER(5, 2) := 100;
    lv_tax_num   NUMBER(4, 2) := 0;
BEGIN
    IF lv_state_txt = 'VA' THEN
        lv_tax_num := lv_sub_num * 0.06;
    ELSIF lv_state_txt = 'ME' THEN
        lv_tax_num := lv_sub_num * 0.05;
    ELSIF lv_state_txt = 'NY' THEN
        lv_tax_num := lv_sub_num * 0.07;
    ELSE
        lv_tax_num := lv_sub_num * 0.04;
    END IF;

    DBMS_OUTPUT.PUT_LINE(lv_tax_num);
END;
