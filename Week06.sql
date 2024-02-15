BEGIN
    UPDATE bb_product
    SET
        stock = stock + 25
    WHERE
        idProduct = 15;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Not Found');
    ELSE
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(SQL%ROWCOUNT));
    END IF;
END;

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

DECLARE
    CURSOR cur_basket IS
    SELECT
        b.idBasket,
        p.type,
        bi.price,
        bi.quantity
    FROM
        bb_basketitem bi
        INNER JOIN bb_product p
        USING (idProduct)
    WHERE
        bi.idBasket = :g_basket;
    TYPE type_basket IS RECORD (
        basket bb_basketitem.idBasket%TYPE,
        type bb_product.type%TYPE,
        price bb_basketitem.price%TYPE,
        qty bb_basketitem.quantity%TYPE
    );
    rec_basket  type_basket;
    lv_rate_num NUMBER(2, 2);
    lv_tax_num  NUMBER(4, 2) := 0;
BEGIN
    OPEN cur_basket;
    LOOP
        FETCH cur_basket INTO rec_basket;
        EXIT WHEN cur_basket%NOTFOUND;
        IF rec_basket.type = 'E' THEN
            lv_rate_num := .05;
        ELSIF rec_basket.type = 'C' THEN
            lv_rate_num := .03;
        END IF;

        lv_tax_num := lv_tax_num + ((rec_basket.price * rec_basket.qty) * lv_rate_num);
    END LOOP;

    CLOSE cur_basket;
    DBMS_OUTPUT.PUT_LINE('Tax Amount: '
                         || TO_CHAR(lv_tax_num));
END;

DECLARE
    CURSOR cur_prod IS
    SELECT
        type,
        price
    FROM
        bb_product
    WHERE
        active = 1 FOR UPDATE NOWAIT;
    lv_sale bb_product.saleprice%TYPE;
BEGIN
    FOR rec_prod IN cur_prod LOOP
        IF rec_prod.type = 'C' THEN
            lv_sale := rec_prod.price * .9;
        ELSIF rec_prod.type = 'E' THEN
            lv_sale := rec_prod.price * .95;
        END IF;
        UPDATE bb_product
        SET
            saleprice = lv_sale
        WHERE
            CURRENT OF cur_prod;
    END LOOP;

    COMMIT;
END;

DECLARE
    CURSOR cur_prod IS
    SELECT
        type,
        price
    FROM
        bb_product
    WHERE
        active = 1 FOR UPDATE NOWAIT;
    lv_sale bb_product.saleprice%TYPE;
BEGIN
    OPEN cur_prod;
    LOOP
        FETCH cur_prod INTO rec_prod;
        EXIT WHEN cur_prod%NOTFOUND;
        IF rec_prod.type = 'C' THEN
            lv_sale := rec_prod.price * .9;
        ELSIF rec_prod.type = 'E' THEN
            lv_sale := rec_prod.price * .95;
        END IF;
        UPDATE bb_product
        SET
            saleprice = lv_sale
        WHERE
            CURRENT OF cur_prod;
    END LOOP;

    CLOSE cur_prod;
    COMMIT;
END;

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
