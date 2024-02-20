-- IF Statement Example
DECLARE
    lv_state_txt bb_basket.shipstate%TYPE;
    lv_sub_num   bb_basket.subtotal%TYPE;
    lv_tax_num   NUMBER(4, 2) := 0;
BEGIN
    SELECT
        subtotal,
        shipstate INTO lv_sub_num,
        lv_state_txt
    FROM
        bb_basket
    WHERE
        idbasket = 4;
    IF lv_state_txt = 'VA' THEN
        lv_tax_num := lv_sub_num * .06;
    ELSIF lv_state_txt = 'ME' THEN
        lv_tax_num := lv_sub_num * .05;
    ELSIF lv_state_txt = 'NY' THEN
        lv_tax_num := lv_sub_num * .07;
    ELSE
        lv_tax_num := lv_sub_num * .04;
    END IF;

    DBMS_OUTPUT.PUT_LINE( 'ST: '
                          || lv_state_txt
                          || ' Sub: '
                          || lv_sub_num
                          || ' Tax: '
                          || lv_tax_num );
END;
