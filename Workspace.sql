CREATE OR REPLACE TRIGGER bb_sales_trg FOR
    UPDATE OF salestart ON bb_product
COMPOUND TRIGGER
 -- Define a cursor to fetch existing sale dates
    CURSOR adates_cur IS
    SELECT
        idproduct,
        salestart,
        saleend
    FROM
        bb_product;
 -- Define a collection to store fetched sale dates
    TYPE slist_typ IS
        TABLE OF adates_cur%ROWTYPE INDEX BY BINARY_INTEGER;
    sdates_tbl slist_typ;
 -- Counter for the number of fetched records
    int        NUMBER := 0;
 -- Before statement execution
    BEFORE STATEMENT IS
    BEGIN
 -- Initialize the counter
        int := 0;
 -- Fetch existing sale dates and store them in the collection
        FOR rec IN adates_cur LOOP
            int := int + 1;
            sdates_tbl(int).idproduct := rec.idproduct;
            sdates_tbl(int).salestart := rec.salestart;
            sdates_tbl(int).saleend := rec.saleend;
        END LOOP;
    END BEFORE STATEMENT;
 -- Before each row update
    BEFORE EACH ROW IS
        lv_start_dt DATE;
        lv_end_dt   DATE;
    BEGIN
 -- Loop through fetched sale dates for the product being updated
        FOR i IN 1..sdates_tbl.COUNT LOOP
            IF sdates_tbl(i).idproduct = :NEW.idproduct THEN
                lv_start_dt := sdates_tbl(i).salestart;
                lv_end_dt := sdates_tbl(i).saleend;
                EXIT; -- Exit the loop once matching product is found
            END IF;
        END LOOP;
 -- Check if the new sale start date falls within an existing sale period
        IF :NEW.salestart BETWEEN lv_start_dt AND lv_end_dt THEN
            RAISE_APPLICATION_ERROR(-20101, 'Product Already on Sale!');
        END IF;
    END BEFORE EACH ROW;
END bb_sales_trg;
/
