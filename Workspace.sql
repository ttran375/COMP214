SELECT
    CATEGORY,
    TITLE,
    COST
FROM
    BOOKS
WHERE
    COST > (
        SELECT
            COST
        FROM
            BOOKS
        WHERE
            TITLE = 'DATABASE IMPLEMENTATION'
    )
    AND CATEGORY = 'COMPUTER';

SELECT
    CATEGORY,
    AVG(RETAIL - COST)
FROM
    BOOKS
GROUP BY
    CATEGORY
HAVING
    AVG(RETAIL - COST) > (
        SELECT
            AVG(RETAIL - COST)
        FROM
            BOOKS
        WHERE
            CATEGORY = 'LITERATURE'
    );

SELECT
    TITLE,
    RETAIL,
    CATEGORY
FROM
    BOOKS
WHERE
    RETAIL IN (
        SELECT
            MAX(RETAIL)
        FROM
            BOOKS
        GROUP BY
            CATEGORY
    )
ORDER BY
    CATEGORY;

SELECT
    TITLE,
    RETAIL
FROM
    BOOKS
WHERE
    RETAIL < ANY (
        SELECT
            RETAIL
        FROM
            BOOKS
        WHERE
            CATEGORY = 'COOKING'
    );

SELECT
    ORDER#,
    SUM(QUANTITY * PAIDEACH)
FROM
    ORDERITEMS
GROUP BY
    ORDER#
HAVING
    SUM(QUANTITY * PAIDEACH) > ALL (
        SELECT
            SUM(QUANTITY * PAIDEACH)
        FROM
            CUSTOMERS
            JOIN ORDERS
            USING (CUSTOMER#)
            JOIN ORDERITEMS
            USING (ORDER#)
        WHERE
            STATE = 'FL'
        GROUP BY
            ORDER#
    );

SELECT
    B.TITLE,
    B.RETAIL,
    A.CATEGORY,
    A.CATAVERAGE
FROM
    BOOKS B,
    (
        SELECT
            CATEGORY,
            AVG(RETAIL) AS CATAVERAGE
        FROM
            BOOKS
        GROUP BY
            CATEGORY
    )     A
WHERE
    B.CATEGORY = A.CATEGORY
    AND B.RETAIL > A.CATAVERAGE;

SELECT
    CUSTOMER#
FROM
    CUSTOMERS
WHERE
    (REFERRED, 0) = (
        SELECT
            NVL(REFERRED, 0)
        FROM
            CUSTOMERS
        WHERE
            CUSTOMER# = 1005
    );

SELECT
    FIRSTNAME
FROM
    BB_SHOPPER;

DECLARE
    V_FIRSTNAME       VARCHAR2(100);
    V_QUANTITY        NUMBER;
    V_SHIPPING_CHARGE NUMBER;
BEGIN
 -- Assuming shopper_id is known
    SELECT
        FIRSTNAME INTO V_FIRSTNAME
    FROM
        BB_SHOPPER
    WHERE
        SHOPPER_ID = :SHOPPER_ID;
    SELECT
        QUANTITY INTO V_QUANTITY
    FROM
        ORDERS
    WHERE
        SHOPPER_ID = :SHOPPER_ID;
 -- Calculate shipping charges
    V_SHIPPING_CHARGE := V_QUANTITY * 5; -- $5 shipping charge per item
    DBMS_OUTPUT.PUT_LINE('Shipping charge for '
                         || V_FIRSTNAME
                         || ' is: '
                         || V_SHIPPING_CHARGE);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: '
                             || SQLERRM);
END;

DECLARE
    V_FIRSTNAME       VARCHAR2(100);
    V_QUANTITY        NUMBER;
    V_SHIPPING_CHARGE NUMBER;
    V_INVENTORY       NUMBER;
BEGIN
 -- Assuming shopper_id and product_id are known
    SELECT
        FIRSTNAME INTO V_FIRSTNAME
    FROM
        BB_SHOPPER
    WHERE
        SHOPPER_ID = :SHOPPER_ID;
    SELECT
        QUANTITY INTO V_QUANTITY
    FROM
        ORDERS
    WHERE
        ORDER_ID = :ORDER_ID
        AND PRODUCT_ID = :PRODUCT_ID;
 -- Calculate shipping charges
    V_SHIPPING_CHARGE := V_QUANTITY * 5; -- $5 shipping charge per item
 -- Check and update product inventory
    SELECT
        INVENTORY INTO V_INVENTORY
    FROM
        PRODUCTS
    WHERE
        PRODUCT_ID = :PRODUCT_ID;
    IF V_INVENTORY >= V_QUANTITY THEN
        UPDATE PRODUCTS
        SET
            INVENTORY = INVENTORY - V_QUANTITY
        WHERE
            PRODUCT_ID = :PRODUCT_ID;
    ELSE
 -- Handle insufficient inventory
        DBMS_OUTPUT.PUT_LINE('Insufficient inventory');
    END IF;

    DBMS_OUTPUT.PUT_LINE('Shipping charge for '
                         || V_FIRSTNAME
                         || ' is: '
                         || V_SHIPPING_CHARGE);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: '
                             || SQLERRM);
END;

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE bb_audit_logon';
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error dropping table: ' || SQLERRM);
END;
/

