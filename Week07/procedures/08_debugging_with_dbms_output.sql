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
