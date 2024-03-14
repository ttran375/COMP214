-- Object Status
SELECT
    object_name,
    status
FROM
    user_objects
WHERE
    object_name = 'ORDER_TOTAL_SP';

CREATE OR REPLACE PROCEDURE ORDER_TOTAL_SP AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('This is a basic stored procedure.');
END;
/

-- Data Dictionary
SELECT
    referenced_name,
    referenced_type,
    referenced_owner
FROM
    user_dependencies
WHERE
    name = 'ORDER_TOTAL_SP';
