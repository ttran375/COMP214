-- Searched CASE
DECLARE
    lv_state_txt CHAR(2) := 'VA';
    lv_zip_txt   CHAR(5) := '23321';
    lv_sub_num   NUMBER(5, 2) := 100;
    lv_tax_num   NUMBER(4, 2) := 0;
BEGIN
    CASE
        WHEN lv_zip_txt = '23321' THEN
            lv_tax_num := lv_sub_num * 0.02;
        WHEN lv_state_txt = 'VA' THEN
            lv_tax_num := lv_sub_num * 0.06;
        ELSE
            lv_tax_num := lv_sub_num * 0.04;
    END CASE;

    DBMS_OUTPUT.PUT_LINE('Tax Number: '
                         || lv_tax_num);
END;
