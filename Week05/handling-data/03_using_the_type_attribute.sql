-- Using the %TYPE Attribute
DECLARE
    lv_basket_num   bb_basket.idBasket%TYPE;
    lv_created_date bb_basket.dtcreated%TYPE;
    lv_qty_num      bb_basket.quantity%TYPE;
    lv_sub_num      bb_basket.subtotal%TYPE;
    lv_days_num     NUMBER(3);
BEGIN
    SELECT
        idBasket,
        dtcreated,
        quantity,
        subtotal INTO lv_basket_num,
        lv_created_date,
        lv_qty_num,
        lv_sub_num
    FROM
        bb_basket
    WHERE
        idShopper = 25
        AND orderplaced = 0;
    lv_days_num := TO_DATE('02/28/12', 'mm/dd/yy') - lv_created_date;
    DBMS_OUTPUT.PUT_LINE( lv_basket_num
                          || ' * '
                          || TO_CHAR(lv_created_date, 'DD-MON-YYYY')
                             || ' * '
                             || lv_qty_num
                             || ' * '
                             || lv_sub_num
                             || ' * '
                             || lv_days_num );
END;
