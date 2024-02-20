-- RAISE_APPLICATION_ERROR
CREATE OR REPLACE PROCEDURE stock_ck_sp (
    p_qty IN NUMBER,
    p_prod IN NUMBER
) IS
    lv_stock_num bb_product.stock%TYPE;
BEGIN
    SELECT
        stock INTO lv_stock_num
    FROM
        bb_product
    WHERE
        idProduct = p_prod;
    IF p_qty > lv_stock_num THEN
        RAISE_APPLICATION_ERROR(-20000, 'Not enough in stock. Requested: '
                                        || p_qty
                                        || ' / Stock level: '
                                        || lv_stock_num);
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No Stock found.');
END stock_ck_sp;
