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
