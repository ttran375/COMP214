-- Test Variable Initialization
DECLARE
  lv_ord_date DATE := SYSDATE;
  lv_last_txt VARCHAR2(25) := 'Unknown';
  lv_qty_num NUMBER := 0;
  lv_shipflag_bln BOOLEAN := FALSE;
BEGIN
  DBMS_OUTPUT.PUT_LINE(lv_ord_date);
  DBMS_OUTPUT.PUT_LINE(lv_last_txt);
  DBMS_OUTPUT.PUT_LINE(lv_qty_num);
END;
