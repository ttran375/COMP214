-- Nested Loops
BEGIN
    FOR oi IN 1..3 LOOP
        DBMS_OUTPUT.PUT_LINE('Outer Loop');
        FOR ii IN 1..2 LOOP
            DBMS_OUTPUT.PUT_LINE('Inner Loop');
        END LOOP;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('End of Program');
END;
