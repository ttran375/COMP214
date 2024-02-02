ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YYYY';

SELECT
    *
FROM
    BB_PRODUCT;

DECLARE
    V_PRODUCT_ID         NUMBER := 1; -- Replace with the actual product ID
    V_INVENTORY_QUANTITY NUMBER;
BEGIN
    SELECT
        STOCK INTO V_INVENTORY_QUANTITY
    FROM
        BB_PRODUCT
    WHERE
        IDPRODUCT = V_PRODUCT_ID;
    DBMS_OUTPUT.PUT_LINE('Inventory Quantity: '
                         || V_INVENTORY_QUANTITY);
END;
/

DECLARE
    V_PRODUCT_ID         NUMBER := 1; -- Replace with the actual product ID
    V_INVENTORY_QUANTITY NUMBER;
BEGIN
    SELECT
        STOCK INTO V_INVENTORY_QUANTITY
    FROM
        BB_PRODUCT
    WHERE
        IDPRODUCT = V_PRODUCT_ID;
    DBMS_OUTPUT.PUT_LINE('Inventory Quantity: '
                         || V_INVENTORY_QUANTITY);
END;
/

DECLARE
    LV_ORD_DATE     DATE; -- Declare a date variable
    LV_LAST_TXT     VARCHAR2(25); -- Declare a string variable with a maximum length of 25
    LV_QTY_NUM      NUMBER(2); -- Declare a number variable with a maximum precision of 2
    LV_SHIPFLAG_BLN BOOLEAN; -- Declare a boolean variable
BEGIN
 ---- PL/SQL executable statements go here ----
    LV_ORD_DATE := SYSDATE; -- Assign the current date to the date variable
END;
/

DECLARE
  myVariable NUMBER(10); -- Starts with a letter, contains lowercase letters
  VAR123     VARCHAR2(25); -- Starts with a letter, contains numbers
  _temp      DATE; -- Starts with a letter, contains an underscore
  $total#    NUMBER(2); -- Starts with a letter, contains a dollar sign and a hash symbol
BEGIN
  -- PL/SQL executable statements go here
    myVariable := 100;
    VAR123 := 'Hello World';
    _temp := SYSDATE;
    $total# := 100;

END;
/

DECLARE
   -- Scalar variable declarations
   lv_ord_date bb_Basket.dtOrdered%TYPE;
   lv_last_txt bb_Basket.ShipFlag%TYPE;
   lv_qty_num bb_BasketItem.Quantity%TYPE;
   lv_shipflag_bln bb_Basket.ShipFlag%TYPE;
BEGIN
   -- Example usage of the variables
   SELECT dtOrdered, ShipFlag
   INTO lv_ord_date, lv_last_txt
   FROM bb_Basket
   WHERE idBasket = 3;

   -- Displaying the values (you can replace this with your logic)
   DBMS_OUTPUT.PUT_LINE('Order Date: ' || TO_CHAR(lv_ord_date, 'DD-MON-YYYY'));
   DBMS_OUTPUT.PUT_LINE('Ship Flag: ' || lv_last_txt);

   -- Your PL/SQL executable statements would go here
   -- You can initialize or use these variables within this block
END;
/

DECLARE
  lv_ord_date DATE;         -- Declare a date variable
  lv_last_txt VARCHAR2(25); -- Declare a string variable with a maximum length of 25
  lv_qty_num NUMBER(2);     -- Declare a number variable with a maximum precision of 2
  lv_shipflag_bln BOOLEAN;  -- Declare a boolean variable
BEGIN
  ---- PL/SQL executable statements go here ----
    lv_ord_date := SYSDATE;   -- Assign the current date to the date variable
    lv_last_txt := 'Hello';   -- Assign a string value to the string variable
    lv_qty_num := 10;         -- Assign a number value to the number variable
    lv_shipflag_bln := TRUE;  -- Assign a boolean value to the boolean variable

    -- Display the values of the variables
    DBMS_OUTPUT.PUT_LINE('Order Date: ' || TO_CHAR(lv_ord_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Last Text: ' || lv_last_txt);
    DBMS_OUTPUT.PUT_LINE('Quantity: ' || lv_qty_num);
    DBMS_OUTPUT.PUT_LINE('Ship Flag: ' || CASE WHEN lv_shipflag_bln THEN 'TRUE' ELSE 'FALSE' END);
END;
/

DECLARE
   -- Scalar variable declarations using the bb schema
   lv_ord_date bb_Basket.dtOrdered%TYPE;
   lv_last_txt bb_Basket.ShipFlag%TYPE;
   lv_qty_num bb_BasketItem.Quantity%TYPE;
   lv_shipflag_bln bb_Basket.ShipFlag%TYPE;
BEGIN
   -- Example usage of the variables
   SELECT dtOrdered, ShipFlag
   INTO lv_ord_date, lv_last_txt
   FROM bb_Basket
   WHERE idBasket = 3;

   -- Displaying the values (you can replace this with your logic)
   DBMS_OUTPUT.PUT_LINE('Order Date: ' || TO_CHAR(lv_ord_date, 'DD-MON-YYYY'));
   DBMS_OUTPUT.PUT_LINE('Ship Flag: ' || lv_last_txt);

   -- Your PL/SQL executable statements would go here
   -- You can initialize or use these variables within this block
END;
/
