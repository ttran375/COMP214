-- Example Trigger
CREATE OR REPLACE TRIGGER product_inventory_trg AFTER
    UPDATE OF orderplaced ON bb_basket FOR EACH ROW WHEN (OLD.orderplaced <> 1
    AND NEW.orderplaced = 1)
DECLARE
    CURSOR basketitem_cur IS
    SELECT
        idproduct,
        quantity,
        option1
    FROM
        bb_basketitem
    WHERE
        idbasket = :NEW.idbasket;
    lv_chg_num NUMBER(3, 1);
BEGIN
    FOR basketitem_rec IN basketitem_cur LOOP
        IF basketitem_rec.option1 = 1 THEN
            lv_chg_num := (.5 * basketitem_rec.quantity);
        ELSE
            lv_chg_num := basketitem_rec.quantity;
        END IF;
        UPDATE bb_product
        SET
            stock = stock - lv_chg_num
        WHERE
            idproduct = basketitem_rec.idproduct;
    END LOOP;
END;
/

-- Create Trigger
CREATE OR REPLACE TRIGGER product_inventory_trg AFTER
    UPDATE OF orderplaced ON bb_basket FOR EACH ROW WHEN (OLD.orderplaced <> 1
    AND NEW.orderplaced = 1)
DECLARE
    CURSOR basketitem_cur IS
    SELECT
        idproduct,
        quantity,
        option1
    FROM
        bb_basketitem
    WHERE
        idbasket = :NEW.idbasket; -- Added missing "=" sign and ":NEW" prefix
    lv_chg_num NUMBER(3, 1);
BEGIN
    FOR basketitem_rec IN basketitem_cur LOOP
        IF basketitem_rec.option1 = 1 THEN
            lv_chg_num := 0.5 * basketitem_rec.quantity; -- Corrected assignment operator and formula
        ELSE
            lv_chg_num := basketitem_rec.quantity;
        END IF;
        UPDATE bb_product
        SET
            stock = stock - lv_chg_num -- Updated stock based on lv_chg_num
        WHERE
            idproduct = basketitem_rec.idproduct; -- Added missing WHERE condition
    END LOOP;
END product_inventory_trg; -- Added trigger name
/

-- Compound Triggers
CREATE OR REPLACE TRIGGER bb_sales_trg FOR
    UPDATE OF salestart ON bb_product
COMPOUND TRIGGER
    CURSOR adates_cur IS
    SELECT
        idproduct,
        salestart,
        saleend
    FROM
        bb_product;
    TYPE slist_typ IS
        TABLE OF adates_cur%ROWTYPE INDEX BY BINARY_INTEGER;
    sdates_tbl slist_typ;
    int        NUMBER := 0;

    BEFORE STATEMENT IS
    BEGIN
        int := 0;
        FOR rec IN adates_cur LOOP
            int := int + 1;
            sdates_tbl(int).idproduct := rec.idproduct;
            sdates_tbl(int).salestart := rec.salestart;
            sdates_tbl(int).saleend := rec.saleend;
        END LOOP;
    END BEFORE STATEMENT;

    BEFORE EACH ROW IS
        lv_start_dt DATE;
        lv_end_dt   DATE;
    BEGIN
        FOR i IN 1..sdates_tbl.COUNT LOOP
            IF sdates_tbl(i).idproduct = :NEW.idproduct THEN
                lv_start_dt := sdates_tbl(i).salestart;
                lv_end_dt := sdates_tbl(i).saleend;
                EXIT;
            END IF;
        END LOOP;

        IF :NEW.salestart BETWEEN lv_start_dt AND lv_end_dt THEN
            RAISE_APPLICATION_ERROR(-20101, 'Product Already on Sale!');
        END IF;
    END BEFORE EACH ROW;
END bb_sales_trg;
/
