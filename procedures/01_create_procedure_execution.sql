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

DECLARE
    -- Define variables to hold the result set
    -- Make sure these variables match the output of your stored procedure
    some_variable VARCHAR2(100);
    another_variable NUMBER;
BEGIN
    -- Call the stored procedure and store its results in the variables
    SHIP_COST_SP(some_variable, another_variable);
    
    -- Output the results
    DBMS_OUTPUT.PUT_LINE('Value of some_variable: ' || some_variable);
    DBMS_OUTPUT.PUT_LINE('Value of another_variable: ' || another_variable);
END;

