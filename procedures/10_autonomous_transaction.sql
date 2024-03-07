-- Autonomous Transaction
CREATE OR REPLACE PROCEDURE tc_test_sp2 IS
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    INSERT INTO bb_testl VALUES (
        2
    );
    COMMIT;
END tc_test_sp2;
