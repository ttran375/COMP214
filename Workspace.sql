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
