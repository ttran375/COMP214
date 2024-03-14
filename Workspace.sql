DECLARE
    v_emp_name employees.first_name%TYPE;
    v_emp_rec employees%ROWTYPE;
BEGIN
    SELECT first_name INTO v_emp_name FROM employees WHERE employee_id = 100;
    SELECT * INTO v_emp_rec FROM employees WHERE employee_id = 100;
END;

SELECT * FROM employees;

INSERT INTO employees (employee_id, first_name, last_name, hire_date)
VALUES (101, 'John', 'Doe', TO_DATE('2024-03-14', 'YYYY-MM-DD'));
