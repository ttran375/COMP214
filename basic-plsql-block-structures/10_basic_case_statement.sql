-- Basic CASE Statement
DECLARE
    lv_state_txt CHAR(2) := 'ME';
    lv_sub_num   NUMBER(5, 2) := 100;
    lv_tax_num   NUMBER(4, 2) := 0;
BEGIN
    CASE lv_state_txt
        WHEN 'VA' THEN
            lv_tax_num := lv_sub_num * 0.06;
        WHEN 'ME' THEN
            lv_tax_num := lv_sub_num * 0.05;
        WHEN 'NY' THEN
            lv_tax_num := lv_sub_num * 0.07;
        ELSE
            lv_tax_num := lv_sub_num * 0.04;
    END CASE;

    DBMS_OUTPUT.PUT_LINE('Tax Number: '
                         || lv_tax_num);
END;
