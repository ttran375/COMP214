-- Bulk-processing (Query)
DECLARE
    CURSOR cur_item IS
    SELECT
        *
    FROM
        bb_basketitem;
    TYPE type_item IS
        TABLE OF cur_item%ROWTYPE INDEX BY PLS_INTEGER;
    tbl_item type_item;
BEGIN
    OPEN cur_item;
    FETCH cur_item BULK COLLECT INTO tbl_item;
    FOR i IN 1..tbl_item.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(tbl_item(i).idBasketitem
                                       || ' '
                                       || tbl_item(i).idProduct);
    END LOOP;

    CLOSE cur_item;
END;
