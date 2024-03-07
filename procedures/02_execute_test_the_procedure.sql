-- Execute/Test the Procedure
DECLARE
    lv_ship_num NUMBER(6, 2);
BEGIN
    SHIP_COST_SP(7, lv_ship_num);
    DBMS_OUTPUT.PUT_LINE('Ship Cost = '
                         || TO_CHAR(lv_ship_num));
END;
