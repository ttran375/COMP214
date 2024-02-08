DECLARE
    lv_created_date DATE;
    lv_basket_num   NUMBER(3);
    lv_qty_num      NUMBER(3);
    lv_sub_num      NUMBER(5, 2);
    lv_days_num     NUMBER(3);
    lv_shopper_num  NUMBER(3) := 25;
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
        idShopper = lv_shopper_num
        AND orderplaced = 0;
    lv_days_num := TO_DATE('02/28/12', 'mm/dd/yy') - lv_created_date;
    DBMS_OUTPUT.PUT_LINE(lv_basket_num
                         || ' * '
                         || lv_created_date
                         || ' * '
                         || lv_qty_num
                         || ' * '
                         || lv_sub_num
                         || ' * '
                         || lv_days_num);
END;

DECLARE
    lv_qty_num NUMBER (3);
BEGIN
    SELECT
        SUM(quantity) INTO lv_qty_num
    FROM
        bb_basketitem
    WHERE
        idBasket = 9;
    DBMS_OUTPUT.PUT_LINE(lv_qty_num);
END;

-- FIGURE 3-5 A block checking for an uncompleted basket
DECLARE
    lv_created_date DATE; lv_basket_num NUMBER (3);
    lv_qty_num NUMBER (3);
    lv_sub_num NUMBER (5,2);
    lv_days_num NUMBER (3);
    lv_shopper_num NUMBER (3) := 25;
BEGIN
SELECT idBasket, dtcreated, quantity, subtotal
    INTO lv_basket_num, lv_created_date, lv_qty_num, lv_sub_num
    FROM bb_basket
    WHERE idShopper = lv_shopper_num
        AND orderplaced = 0;
    lv_days_num := TO_DATE('02/28/12', 'mm/dd/yy') - lv_created_date;

    DBMS_OUTPUT.PUT_LINE (lv_basket_num || ' * ' ||
    TO_CHAR(lv_created_date, 'DD-MON-YYYY') || ' * ' ||
    lv_qty_num || ' * ' || lv_sub_num || ' * ' || lv_days_num);
END;

-- Using the %TYPE Attribute
DECLARE
    lv_basket_num bb_basket.idBasket%TYPE;
    lv_created_date bb_basket.dtcreated%TYPE;
    lv_qty_num bb_basket.quantity%TYPE;
    lv_sub_num bb_basket.subtotal%TYPE;
    lv_days_num NUMBER(3);
BEGIN
    SELECT 
        idBasket, 
        dtcreated, 
        quantity, 
        subtotal
    INTO 
        lv_basket_num, 
        lv_created_date, 
        lv_qty_num, 
        lv_sub_num
    FROM 
        bb_basket
    WHERE 
        idShopper = 25
        AND orderplaced = 0;

    lv_days_num := TO_DATE('02/28/12','mm/dd/yy') - lv_created_date;

    DBMS_OUTPUT.PUT_LINE(
        lv_basket_num || ' * ' ||
        TO_CHAR(lv_created_date, 'DD-MON-YYYY') || ' * ' || 
        lv_qty_num || ' * ' ||
        lv_sub_num || ' * ' || 
        lv_days_num
    );
END;

-- FIGURE 3-11 Retrieving state data to determine the tax amount
DECLARE
    lv_state_txt bb_basket.shipstate%TYPE;
    lv_sub_num bb_basket.subtotal%TYPE;
    lv_tax_num NUMBER(4,2) := 0;
BEGIN
    SELECT 
        subtotal, 
        shipstate
    INTO 
        lv_sub_num, 
        lv_state_txt
    FROM 
        bb_basket
    WHERE 
        idbasket = 6;

    IF lv_state_txt = 'VA' THEN
        lv_tax_num := lv_sub_num * .06;
    END IF;

    DBMS_OUTPUT.PUT_LINE(
        'ST: ' || lv_state_txt || 
        ' Sub: ' || lv_sub_num || 
        ' Tax: ' || lv_tax_num
    );
END;

-- FIGURE 3-12 Including data retrieval and conditional IF processing in a block
DECLARE
    lv_state_txt bb_basket.shipstate%TYPE;
    lv_sub_num bb_basket.subtotal%TYPE;
    lv_tax_num NUMBER(4,2) := 0;
BEGIN
    SELECT 
        subtotal, 
        shipstate
    INTO 
        lv_sub_num, 
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

    DBMS_OUTPUT.PUT_LINE(
        'ST: ' || lv_state_txt || 
        ' Sub: ' || lv_sub_num || 
        ' Tax: ' || lv_tax_num
    );
END;
/
