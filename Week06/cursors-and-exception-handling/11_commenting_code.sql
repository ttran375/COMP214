-- COMMENTING CODE
DECLARE
    ex_prod_update EXCEPTION; --For UPDATE of no rows exception
BEGIN
 /* This block is used to update product descriptions
Constructed to support the Prod_desc.frm app page
Exception raised if no rows are updated */
    UPDATE bb_product
    SET
        description = 'Mill grinder with 5 grind settings!'
    WHERE
        idProduct = 30;
 --Check whether any rows were updated
    IF SQL%NOTFOUND THEN
        RAISE ex_prod_update;
    END IF;
EXCEPTION
    WHEN ex_prod_update THEN
        DBMS_OUTPUT.PUT_LINE('Invalid product ID entered');
END;
