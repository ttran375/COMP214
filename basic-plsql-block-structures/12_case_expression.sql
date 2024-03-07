-- CASE Expression
DECLARE
    lv_state_txt CHAR(2) := 'ME';
    lv_sub_num   NUMBER(5, 2) := 100;
    lv_tax_num   NUMBER(4, 2) := 0;
BEGIN
    lv_tax_num := CASE lv_state_txt 
        WHEN 'VA' THEN lv_sub_num * 0.06 
        WHEN 'ME' THEN lv_sub_num * 0.05 
        WHEN 'NY' THEN lv_sub_num * 0.07 
        ELSE lv_sub_num * 0.04 END;
    DBMS_OUTPUT.PUT_LINE('Tax Number: '
                         || lv_tax_num);
END;
