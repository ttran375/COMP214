-- Nested IF
DECLARE
    lv_type_txt  VARCHAR2(1) := 'E';
    lv_price_num NUMBER := 50;
    lv_disc_num  NUMBER;
BEGIN
    IF lv_type_txt = 'E' THEN

        IF lv_price_num > 85 THEN

            lv_disc_num := 0.20;
        ELSIF lv_price_num > 45 THEN
            lv_disc_num := 0.15;
        ELSE
            lv_disc_num := 0.10;
        END IF;
    ELSIF lv_type_txt = 'C' THEN

        lv_disc_num := 0.05;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Discount Number: '
                         || lv_disc_num);
END;
