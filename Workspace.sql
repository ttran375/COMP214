

CREATE OR REPLACE PROCEDURE login_sp (
    p_user IN VARCHAR2,
    p_pass IN VARCHAR2,
    p_id OUT NUMBER,
    p_flag OUT CHAR,
    p_mem OUT VARCHAR2
) IS
    lv_first_txt bb_shopper.firstname%TYPE;
    lv_last_txt  bb_shopper.lastname%TYPE;
BEGIN
    SELECT
        idShopper,
        firstname,
        lastname INTO p_id,
        lv_first_txt,
        lv_last_txt
    FROM
        bb_shopper
    WHERE
        username = p_user
        AND password = p_pass;
    p_flag := 'Y';
    p_mem := memfmt1_sf(p_id, lv_first_txt, lv_last_txt);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_flag := 'N';
END;
/

DECLARE
    lv_user_txt bb_shopper.username%TYPE := 'fdwell';
    lv_pass_txt bb_shopper.password%TYPE := 'tweak';
    lv_id_num   bb_shopper.idshopper%TYPE;
    lv_flag_txt CHAR(1);
    lv_name_txt VARCHAR2(50);
BEGIN
    login_sp(lv_user_txt, lv_pass_txt, lv_id_num, lv_flag_txt, lv_name_txt);
    DBMS_OUTPUT.PUT_LINE('ID Number: '
                         || lv_id_num);
    DBMS_OUTPUT.PUT_LINE('Flag Text: '
                         || lv_flag_txt);
    DBMS_OUTPUT.PUT_LINE('Name Text: '
                         || lv_name_txt);
END;
/
