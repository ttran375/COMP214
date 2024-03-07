-- Single-Row Subquery in a WHERE Clause
SELECT
    category,
    title,
    cost
FROM
    books
WHERE
    cost > (
        SELECT
            cost
        FROM
            books
        WHERE
            title = 'DATABASE IMPLEMENTATION'
    )
    AND category = 'COMPUTER'

-- Single-Row Subquery in a HAVING Clause
SELECT
    category,
    AVG(retail-cost) "Average Profit"
FROM
    books
GROUP BY
    category
HAVING
    AVG(retail-cost) > (
        SELECT
            AVG(retail-cost)
        FROM
            books
        WHERE
            category = 'LITERATURE'
    );

-- Single-Row Subquery in a SELECT Clause
SELECT
    title,
    retail
FROM
    books;

SELECT
    TO_CHAR(AVG(retail), '999.99') AS "Overall Average"
FROM
    books;

-- Multiple-Row Subquery in a WHERE Clause
SELECT
    title,
    retail,
    category
FROM
    books
WHERE
    retail IN (
        SELECT
            MAX(retail)
        FROM
            books
        GROUP BY
            category
    )
ORDER BY
    category;

-- Multiple-Row Subquery in a WHERE Clause (continued)
SELECT
    title,
    retail
FROM
    books
WHERE
    retail <ANY (
        SELECT
            retail
        FROM
            books
        WHERE
            category = 'COOKING'
    );

-- Multiple-Row Subquery in a FROM Clause
SELECT
    b.title,
    b.retail,
    a.category,
    a.cataverage
FROM
    books b,
    (
        SELECT
            category,
            AVG(retail) cataverage
        FROM
            books
        GROUP BY
            category
    )     a
WHERE
    b.category = a.category
    AND b.retail > a.cataverage;

-- Multiple-Column Subquery in a FROM Clause
SELECT
    b.title,
    b.retail,
    a.category,
    a.cataverage
FROM
    books b,
    (
        SELECT
            category,
            AVG(retail) cataverage
        FROM
            books
        GROUP BY
            category
    )     a
WHERE
    b.category= a.category
    AND b.retail > a.cataverage;

-- Multiple-Column Subquery in a WHERE Clause
SELECT
    title,
    retail,
    category
FROM
    books
WHERE
    (category, retail) IN (
        SELECT
            category,
            MAX(retail)
        FROM
            books
        ORDER BY
            category;

GROUP BY CATEGORY)

-- NULL Values
SELECT
    customer#
FROM
    customers
WHERE
    NVL (referred, 0) = (
        SELECT
            NVL (referred, 0)
        FROM
            customers
        WHERE
            customer# = 1005
    );

-- Correlated Subqueries (continued)
SELECT
    title
FROM
    books
WHERE
    EXISTS (
        SELECT
            isbn
        FROM
            orderitems
        WHERE
            books.isbn = orderitems.isbn
    );

-- Nested Subqueries (continued)
SELECT
    customer#,
    lastname,
    firstname
FROM
    customers
    JOIN orders
    USING (customer#)
WHERE
    order# IN (
        SELECT
            order#
        FROM
            orderitems
        GROUP BY
            order#
        HAVING
            COUNT(*) = (
                SELECT
                    MAX(COUNT(*))
                FROM
                    orderitems
                GROUP BY
                    order#
            )
    );

-- Subquery Factoring Clause
-- WITH dcount AS (
--     SELECT
--         deptno,
--         COUNT(*) AS dcount
--     FROM
--         employees
--     GROUP BY
--         deptno
-- )
-- SELECT
--     e.lname   Emp_Lastname,
--     e.deptno  e_dept,
--     d1.dcount edept_count,
--     m.lname   manager_name,
--     m.deptno  mdept,
--     d2.dcount mdept_count
-- FROM
--     employees e,
--     dcount    d1,
--     employees m,
--     dcount    d2
-- WHERE
--     e.deptno = d1.deptno
--     AND e.mgr = m.empno
--     AND m.deptno = d2.deptno
--     AND e.mgr = '7839';

-- Subquery in a DML action
-- UPDATE employees
-- SET
--     bonus = (
--         SELECT
--             AVG (bonus)
--         FROM
--             employees
--     )
-- WHERE
--     empno 8844;

-- MERGE Statement (continued)
MERGE INTO books_1 a USING books_2 b
ON (a.isbn = b.isbn)
WHEN MATCHED THEN
UPDATE SET a. retail = b.retail, a.category = b.category
WHEN NOT MATCHED THEN
INSERT (isbn, title, pubdate, retail, category)
VALUES (b.isbn, b.title, b.pubdate, b.retail, b.category);

SELECT
    *
FROM
    books_1;

