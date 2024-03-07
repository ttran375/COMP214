-- FIGURE 4-20 An UPDATE returning no rows doesn’t raise an Oracle error
DECLARE
    ex_prod_update EXCEPTION;
BEGIN
    UPDATE bb_product
    SET
        description= 'Mill grinder with 5 grind settings!'
    WHERE
        idProduct = 30;
    IF SQL%NOTFOUND THEN
        RAISE ex_prod_update;
    END IF;
EXCEPTION
    WHEN ex_prod_update THEN
        DBMS_OUTPUT.PUT_LINE('Invalid product ID entered');
END;
