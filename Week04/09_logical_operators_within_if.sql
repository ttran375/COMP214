-- Logical Operators within IF
DECLARE
    lv_state_txt VARCHAR2(2) := 'VA';
    lv_sub_num   NUMBER(5, 2) := 100;
    lv_tax_num   NUMBER(4, 2);
BEGIN
    IF lv_state_txt = 'VA' OR lv_state_txt = 'PA' THEN
        lv_tax_num := lv_sub_num * 0.06;
    ELSE
        lv_tax_num := lv_sub_num * 0.04;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Tax Number: '
                         || lv_tax_num);
END;
