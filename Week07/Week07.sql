-- Create Procedure Execution
CREATE OR REPLACE PROCEDURE SHIP_COST_SP (
    p_qty IN NUMBER,
    p_ship OUT NUMBER
) AS
BEGIN
    IF p_qty > 10 THEN
        p_ship := 11.00;
    ELSIF p_qty > 5 THEN
        p_ship := 8.00;
    ELSE
        p_ship := 5.00;
    END IF;
END SHIP_COST_SP;

-- Execute/Test the Procedure
DECLARE
    lv_ship_num NUMBER(6, 2);
BEGIN
    SHIP_COST_SP(7, lv_ship_num);
    DBMS_OUTPUT.PUT_LINE('Ship Cost = '
                         || TO_CHAR(lv_ship_num));
END;

-- Compilation errors
CREATE OR REPLACE PROCEDURE SHIP_COST_SP
  (P_qty IN NUMBER(3), p_ship OUT NUMBER)
AS
BEGIN
  IF P_qty > 10 THEN
    p_ship := 11.00;
  ELSIF P_qty > 5 THEN
    p_ship := 8.00;
  ELSE
    p_ship := 5.00;
  END IF;
END SHIP_COST_SP;

-- Named Association Method
DECLARE
    lv_ship_num NUMBER(6, 2);
BEGIN
    SHIP_COST_SP(
        p_qty => 7,
        p_ship => lv_ship_num
    );
    DBMS_OUTPUT.PUT_LINE('Ship Cost = '
                         || lv_ship_num);
END;

-- IN OUT mode
CREATE OR REPLACE PROCEDURE phone_fmt_sp (
    p_phone IN OUT VARCHAR2
) IS
BEGIN
    p_phone := '('
               || SUBSTR(p_phone, 1, 3)
                  || ')'
                  || SUBSTR(p_phone, 4, 3)
                     || '-'
                     || SUBSTR(p_phone, 7, 4);
END;
