-- Cursor Variables
DECLARE
    cv_prod       SYS_REFCURSOR;
    rec_item      bb_basketitem%ROWTYPE;
    rec_status    bb_basketstatus%ROWTYPE;
    lv_input1_num NUMBER(2) := 2;
    lv_input2_num NUMBER(2) := 3;
BEGIN
    IF lv_input1_num = 1 THEN
        OPEN cv_prod FOR
            SELECT
                *
            FROM
                bb_basketitem
            WHERE
                idBasket = lv_input2_num;
        LOOP
            FETCH cv_prod INTO rec_item;
            EXIT WHEN cv_prod%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(rec_item.idProduct);
        END LOOP;
    ELSIF lv_input1_num = 2 THEN
        OPEN cv_prod FOR
            SELECT
                *
            FROM
                bb_basketstatus
            WHERE
                idBasket = lv_input2_num;
        LOOP
            FETCH cv_prod INTO rec_status;
            EXIT WHEN cv_prod%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(rec_status.idStage
                                 || ' - '
                                 || rec_status.dtstage);
        END LOOP;
    END IF;
END;
