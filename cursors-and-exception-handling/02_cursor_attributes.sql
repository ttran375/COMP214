-- FIGURE 4-4 Cursor attributes reflecting the most recent SQL statement
DECLARE
    lv_tot_num bb_basket.total%TYPE;
BEGIN
    SELECT
        total INTO lv_tot_num
    FROM
        bb_basket
    WHERE
        idBasket = 12;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Not Found in bb_basket');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Rows affected in bb_basket: '
                             || TO_CHAR(SQL%ROWCOUNT));
    END IF;
    UPDATE bb_product
    SET
        stock = stock + 25
    WHERE
        idProduct = 15;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Not Found in bb_product');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Rows affected in bb_product: '
                             || TO_CHAR(SQL%ROWCOUNT));
    END IF;
END;
