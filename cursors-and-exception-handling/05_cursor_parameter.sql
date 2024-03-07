-- FIGURE 4-12 Using a cursor parameter
DECLARE
    CURSOR cur_order (
        p_basket NUMBER
    ) IS
    SELECT
        idBasket,
        idProduct,
        price,
        quantity
    FROM
        bb_basketitem
    WHERE
        idBasket = p_basket;
    lv_bask1_num bb_basket.idbasket%TYPE := 6;
    lv_bask2_num bb_basket.idbasket%TYPE := 10;
BEGIN
    FOR rec_order IN cur_order(lv_bask1_num) LOOP
        DBMS_OUTPUT.PUT_LINE(rec_order.idBasket
                             || ' - '
                             || rec_order.idProduct
                             || ' - '
                             || rec_order.price);
    END LOOP;

    FOR rec_order IN cur_order(lv_bask2_num) LOOP
        DBMS_OUTPUT.PUT_LINE(rec_order.idBasket
                             || ' - '
                             || rec_order.idProduct
                             || ' - '
                             || rec_order.price);
    END LOOP;
END;
