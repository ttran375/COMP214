-- FIGURE 4-16 Code displaying an error message to users
DECLARE
    v_number NUMBER := 10;
BEGIN
    IF v_number > 0 THEN
        DBMS_OUTPUT.PUT_LINE('The number is positive.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The number is not positive.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('You have no saved baskets!');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('A problem has occurred in retrieving your saved basket.');
        DBMS_OUTPUT.PUT_LINE('Tech Support will be notified and contact you via email.');
END;
