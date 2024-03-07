-- Calling a Procedure from another procedure
CREATE OR REPLACE PROCEDURE ORDER_TOTAL_SP (
    p_bsktid IN bb_basketitem.idbasket%TYPE,
    p_cnt OUT NUMBER,
    p_sub OUT NUMBER,
    p_ship OUT NUMBER,
    p_total OUT NUMBER
) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Order total proc called');
    SELECT
        SUM(quantity),
        SUM(quantity * price) INTO p_cnt,
        p_sub
    FROM
        bb_basketitem
    WHERE
        idbasket = p_bsktid;
    SHIP_COST_SP(p_cnt, p_ship);
    p_total := NVL(p_sub, 0) + NVL(p_ship, 0);
    DBMS_OUTPUT.PUT_LINE('Order total proc ended');
END ORDER_TOTAL_SP;
/

DECLARE
    p_bsktid bb_basketitem.idbasket%TYPE;
    p_cnt NUMBER;
    p_sub NUMBER;
    p_ship NUMBER;
    p_total NUMBER;
BEGIN
    p_bsktid := 1; -- replace with the actual basket id
    ORDER_TOTAL_SP(p_bsktid, p_cnt, p_sub, p_ship, p_total);
    DBMS_OUTPUT.PUT_LINE('Count: ' || p_cnt);
    DBMS_OUTPUT.PUT_LINE('Subtotal: ' || p_sub);
    DBMS_OUTPUT.PUT_LINE('Shipping: ' || p_ship);
    DBMS_OUTPUT.PUT_LINE('Total: ' || p_total);
END;
/
