-- Package Specification (continued)
CREATE OR REPLACE PACKAGE ordering_pkg
IS
    pv_total_num NUMBER(3,2); 
    
    PROCEDURE order_total_pp(
        p_bsktid IN NUMBER,
        p_cnt OUT NUMBER,
        p_sub OUT NUMBER,
        p_ship OUT NUMBER,
        p_total OUT NUMBER
    );
    
    FUNCTION ship_calc_pf(
        p_qty IN NUMBER
    ) RETURN NUMBER;
END ordering_pkg;
/

-- Invoking Package Constructs
-- DECLARE
--     lv_bask_num  bb_basketitem := bb_basketitem(12);
--     lv_cnt_num   NUMBER(3);
--     lv_sub_num   NUMBER(8, 2);
--     lv_ship_num  NUMBER(8, 2);
--     lv_total_num NUMBER(8, 2);
-- BEGIN
--     ordering_pkg.order_total_pp( lv_bask_num, lv_cnt_num, lv_sub_num, lv_ship_num, lv_total_num );
--     DBMS_OUTPUT.PUT_LINE('Count: '
--                          || lv_cnt_num);
--     DBMS_OUTPUT.PUT_LINE('Subtotal: '
--                          || lv_sub_num);
--     DBMS_OUTPUT.PUT_LINE('Shipping: '
--                          || lv_ship_num);
--     DBMS_OUTPUT.PUT_LINE('Total: '
--                          || lv_total_num);
-- END;

-- Package Specification
-- CREATE OR REPLACE PACKAGE metric_pkg IS
--   cup_to_liter CONSTANT NUMBER := .24;
--   pint_to_liter CONSTANT NUMBER := .47;
--   qrt_to_liter CONSTANT NUMBER := .95;
-- END;

-- -- Forward Declarations
-- CREATE OR REPLACE PACKAGE BODY ordering_pkg IS

--     FUNCTION ship_calc_pf(
--         p_qty IN NUMBER
--     ) RETURN NUMBER IS
--     BEGIN
--  -- Implementation of ship_calc_pf function goes here
--         RETURN 0; -- Placeholder return value
--     END ship_calc_pf;

--     PROCEDURE order_total_pp(
--         p_bsktid IN bb_basketitem.idbasket,
--         p_cnt OUT NUMBER,
--         p_sub OUT NUMBER,
--         p_ship OUT NUMBER,
--         p_total OUT NUMBER
--     ) IS
--     BEGIN
--  -- Implementation of order_total_pp procedure goes here
--         NULL; -- Placeholder implementation
--     END order_total_pp;
-- END ordering_pkg;

CREATE OR REPLACE PACKAGE product_info_pkg IS

    PROCEDURE prod_search_pp(
        p_id IN bb_product.idproduct%TYPE,
        p_sale OUT bb_product.saleprice%TYPE,
        p_price OUT bb_product.price%TYPE
    );

    PROCEDURE prod_search_by_name(
        p_name IN bb_product.productname%TYPE,
        p_sale OUT bb_product.saleprice%TYPE,
        p_price OUT bb_product.price%TYPE
    );
END product_info_pkg;
/

-- Overloading Program Units (continued)
CREATE OR REPLACE PACKAGE BODY product_info_pkg IS

    PROCEDURE prod_search_pp(
        p_id IN bb_product.idproduct%TYPE,
        p_sale OUT bb_product.saleprice%TYPE,
        p_price OUT bb_product.price%TYPE
    ) IS
    BEGIN
        SELECT
            saleprice,
            price INTO p_sale,
            p_price
        FROM
            bb_product
        WHERE
            idProduct = p_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
 -- Handle no data found error
            NULL;
    END prod_search_pp;

    PROCEDURE prod_search_by_name(
        p_name IN bb_product.productname%TYPE,
        p_sale OUT bb_product.saleprice%TYPE,
        p_price OUT bb_product.price%TYPE
    ) IS
    BEGIN
        SELECT
            saleprice,
            price INTO p_sale,
            p_price
        FROM
            bb_product
        WHERE
            productname = p_name;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
 -- Handle no data found error
            NULL;
    END prod_search_by_name;
END product_info_pkg;
/
