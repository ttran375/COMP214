-- Invoking a function from a PL/SQL block
DECLARE
    lv_cost_num NUMBER(5, 2);
BEGIN
    lv_cost_num := SHIP_CALC_ST(5); -- Corrected function name to match the defined function
    DBMS_OUTPUT.PUT_LINE(lv_cost_num); -- Added semicolon at the end of the line
END;
