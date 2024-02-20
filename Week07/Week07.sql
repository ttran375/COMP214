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

-- DESCRIBE Command
DESCRIBE order_total_sp

-- Debugging with DBMS_OUTPUT
DECLARE
    promo_flag VARCHAR2(1);
BEGIN
    FOR rec_purch IN cur_purch LOOP
        IF rec_purch.sub > 50 THEN
            promo_flag := 'A';
        ELSIF rec_purch.sub > 25 THEN
            promo_flag := 'B';
        END IF;

        DBMS_OUTPUT.PUT_LINE('Shopper '
                             || rec_purch.idshopper
                             || ' has sub '
                             || rec_purch.sub
                             || ' and flag = '
                             || promo_flag);
        IF promo_flag IS NOT NULL THEN
            DBMS_OUTPUT.PUT_LINE('Insert processed for shopper');
            INSERT INTO bb_promolist (
                idshopper,
                column_name_for_path,
                column_name_for_year,
                promo_flag,
                some_other_column
            ) VALUES (
                rec_purch.idshopper,
                path,
                p_year,
                promo_flag,
                NULL
            );
        END IF;
    END LOOP;

    COMMIT;
END;

