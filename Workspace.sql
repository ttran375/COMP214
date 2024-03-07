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
