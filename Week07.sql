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

-- Creating a function
CREATE OR REPLACE FUNCTION SHIP_CALC_ST (
    P_QTY IN NUMBER
) RETURN NUMBER IS
    lv_ship_num NUMBER := 0;
BEGIN
    IF P_QTY > 10 THEN
        lv_ship_num := 11.00;
    ELSIF P_QTY > 5 THEN
        lv_ship_num := 8.00;
    ELSE
        lv_ship_num := 5.00;
    END IF;

    RETURN lv_ship_num;
END SHIP_CALC_ST;

-- Invoking a function from a PL/SQL block
DECLARE
    lv_cost_num NUMBER(5, 2);
BEGIN
    lv_cost_num := SHIP_CALC_ST(12); -- Corrected function name to match the defined function
    DBMS_OUTPUT.PUT_LINE(lv_cost_num); -- Added semicolon at the end of the line
END;

-- Invoking a function by name
