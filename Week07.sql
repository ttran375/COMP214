-- Oracle built-in ROUND function
SELECT
    idProduct,
    price,
    ROUND(price, 0)
FROM
    bb_product
WHERE
    idProduct < 4;

-- Oracle built-in functions can also be used in a PL/SQL statement
DECLARE
    v_amt1 NUMBER(5, 2);
    v_amt2 NUMBER(3, 0);
BEGIN
    v_amt1 := 32.50;
    v_amt2 := ROUND(v_amt1, 0);
    DBMS_OUTPUT.PUT_LINE(v_amt2);
END;
