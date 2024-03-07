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
-- Creating a function
CREATE OR REPLACE FUNCTION ship_calc_sf (
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
END ship_calc_sf;
/

DECLARE
    lv_result NUMBER(5, 2);
BEGIN
    lv_result := ship_calc_sf(12);
 -- Now you can use lv_result as needed, for example, print it:
    DBMS_OUTPUT.PUT_LINE('Result: '
                         || lv_result);
END;
/

-- Using a function in an SQL statement
SELECT
    idBasket,
    shipping               AS actual,
    ship_calc_sf(quantity) AS calc
FROM
    bb_basket
WHERE
    orderplaced = 1;

-- Using a function in an aggregate query
SELECT
    SUM(shipping)                               AS actual,
    SUM(ship_calc_sf(quantity))                 AS calc,
    SUM(shipping) - SUM(ship_calc_sf(quantity)) AS diff
FROM
    bb_basket
WHERE
    orderplaced = 1;

-- Building and Testing a Function for the Brewbean’s Member Name Display
CREATE OR REPLACE FUNCTION memfmt1_sf (
    p_id IN NUMBER,
    p_first IN VARCHAR2,
    p_last IN VARCHAR2
) RETURN VARCHAR2 IS
    lv_mem_txt VARCHAR2(35);
BEGIN
    lv_mem_txt := 'Member '
                  ||p_id
                  ||' - '
                  ||p_first
                  ||'
'
                  ||p_last;
    RETURN lv_mem_txt;
END;
/

DECLARE
    lv_name_txt  VARCHAR2(50);
    lv_id_num    NUMBER(4) := 25;
    lv_first_txt VARCHAR2(15) := 'Scott';
    lv_last_txt  VARCHAR2(20) := 'Savid';
BEGIN
    lv_name_txt := memfmt1_sf(lv_id_num, lv_first_txt, lv_last_txt);
    DBMS_OUTPUT.PUT_LINE(lv_name_txt);
END;
/

-- Building and Testing a Function...
CREATE OR REPLACE PROCEDURE login_sp (
    p_user IN VARCHAR2,
    p_pass IN VARCHAR2,
    p_id OUT NUMBER,
    p_flag OUT CHAR,
    p_mem OUT VARCHAR2
) IS
    lv_first_txt bb_shopper.firstname%TYPE;
    lv_last_txt  bb_shopper.lastname%TYPE;
BEGIN
    SELECT
        idShopper,
        firstname,
        lastname INTO p_id,
        lv_first_txt,
        lv_last_txt
    FROM
        bb_shopper
    WHERE
        username = p_user
        AND password = p_pass;
    p_flag := 'Y';
    p_mem := memfmt1_sf(p_id, lv_first_txt, lv_last_txt);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_flag := 'N';
END;
/

DECLARE
    lv_user_txt bb_shopper.username%TYPE := 'fdwell';
    lv_pass_txt bb_shopper.password%TYPE := 'tweak';
    lv_id_num   bb_shopper.idshopper%TYPE;
    lv_flag_txt CHAR(1);
    lv_name_txt VARCHAR2(50);
BEGIN
    login_sp(lv_user_txt, lv_pass_txt, lv_id_num, lv_flag_txt, lv_name_txt);
    DBMS_OUTPUT.PUT_LINE('ID Number: '
                         || lv_id_num);
    DBMS_OUTPUT.PUT_LINE('Flag Text: '
                         || lv_flag_txt);
    DBMS_OUTPUT.PUT_LINE('Name Text: '
                         || lv_name_txt);
END;
/

-- A function with one RETURN statement
CREATE OR REPLACE FUNCTION ship_calc_sf (p_qty IN NUMBER)
RETURN NUMBER
IS
    lv_ship_num NUMBER (5,2);
BEGIN
    IF p_qty > 10 THEN -- Fixed comparison operator
        lv_ship_num := 11.00; -- Use := for assignment
    ELSIF p_qty > 5 THEN -- Changed condition to check if greater than 10 already
        lv_ship_num := 8.00; -- Use := for assignment
    ELSE
        lv_ship_num := 5.00; -- Use := for assignment
    END IF; -- Corrected syntax for IF statement

    RETURN lv_ship_num;
END ship_calc_sf; -- Corrected function end syntax

-- A function with multiple RETURN statements
CREATE OR REPLACE FUNCTION ship_calc2_sf (
    p_qty IN NUMBER
) RETURN NUMBER IS
BEGIN
    IF p_qty > 10 THEN
        RETURN 11.00;
    ELSIF p_qty > 5 THEN
        RETURN 8.00;
    ELSE
        RETURN 5.00;
    END IF;
END;
