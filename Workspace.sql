CREATE OR REPLACE PROCEDURE prodname_chg2_sp (
    p_id IN bb_product.idproduct%TYPE,
    p_name IN bb_product.productname%TYPE,
    P_flag CHAR DEFAULT 'N'
)
IS
BEGIN
    UPDATE bb_product
    SET productname = p_name
    WHERE idproduct = p_id;

    IF SQL%ROWCOUNT = 0 THEN
        RETURN;
    END IF;

    COMMIT;

    P_flag := 'Y'; -- Corrected syntax for assigning value to P_flag
END;
