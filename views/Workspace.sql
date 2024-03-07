--CREATING A SIMPLE VIEW
CREATE VIEW inventory AS
    SELECT
        isbn,
        title,
        retail price
    FROM
        books WITH READ ONLY;

-- CREATING A COMPLEX VIEW
CREATE VIEW prices AS
    SELECT
        isbn,
        title,
        cost,
        retail,
        retail-cost profit
    FROM
        books;

-- DML OPERATIONS ON A COMPLEX VIEW WITH AN ARITHMETIC EXPRESSION
CREATE VIEW prices AS
    SELECT
        isbn,
        title,
        cost,
        retail,
        retail-cost profit
    FROM
        books;

SELECT
    *
FROM
    prices
WHERE
    title LIKE '%MICKEY%';

UPDATE prices
SET
    retail = 29.95
WHERE
    title LIKE '%MICKEY%';

SELECT
    *
FROM
    prices
WHERE
    title LIKE'%MICKEY%';

-- DML OPERATIONS ON A COMPLEX VIEW CONTAINING DATA FROM MULTIPLE TABLES
CREATE OR REPLACE VIEW prices AS
    SELECT
        isbn,
        title,
        cost,
        retail,
        retail-cost profit,
        name
    FROM
        books
        JOIN publisher
        USING (pubid);

-- DML OPERATIONS ON A COMPLEX VIEW CONTAINING DATA FROM MULTIPLE TABLES (CONTINUED)
-- UPDATE prices
-- SET
--     name = 'PRINT IS US'
-- WHERE
--     title LIKE '%BEAR%';

-- DML OPERATIONS ON A COMPLEX VIEW CONTAINING FUNCTIONS OR GROUPED DATA
CREATE VIEW balancedue AS
    SELECT
        customer#,
        order#,
        SUM(quantity*retail) Amtdue
    FROM
        customers
        JOIN orders
        USING(customer#)
        JOIN orderitems
        USING(order#)
        JOIN books
        USING(isbn)
    GROUP BY
        customer#,
        order#;

-- DML OPERATIONS ON A COMPLEX VIEW CONTAINING FUNCTIONS OR GROUPED DATA (CONTINUED)
-- DELETE FROM balancedue
-- WHERE
--     customer# = 1010;

-- DROPPING A VIEW
DROP VIEW prices;

-- “TOP-N” ANALYSIS (CONTINUED)
SELECT
    title,
    profit
FROM
    (
        SELECT
            title,
            retail-cost profit
        FROM
            books
        ORDER BY
            retail-cost DESC
    )
WHERE
    ROWNUM <= 5;

-- “TOP-N” ANALYSIS (CONTINUED)
SELECT
    title,
    retail-cost profit
FROM
    books
ORDER BY
    profit FETCH FIRST 3 ROWS ONLY;

-- “TOP-N” ANALYSIS (CONTINUED)
SELECT
    title,
    retail-cost profit
FROM
    books
ORDER BY
    profit FETCH FIRST 25 PERCENT ROWS ONLY;

-- CROSS & OUTER APPLY JOINS
SELECT
    b.isbn,
    b.title,
    sales
FROM
    books b
    CROSS APPLY (
        SELECT
            SUM(quantity*paideach) Sales
        FROM
            orderitems o
        WHERE
            b.isbn = o.isbn
        GROUP BY
            b.isbn
    )
ORDER BY
    b.title;

-- MATERIALIZED VIEWS (CONTINUED)
-- CREATE MATERIALIZED VIEW custbal_mv
-- REFRESH COMPLETE
-- START WITH SYSDATE NEXT SYSDATE+7
-- AS
-- SELECT
--     customer#,
--     city,
--     state,
--     SUM(quantity*retail) Amtdue
-- FROM
--     customers
-- JOIN
--     orders USING (customer#)
-- JOIN
--     orderitems USING (order#)
-- JOIN
--     books USING (isbn)
-- GROUP BY
--     customer#,
--     city,
--     state;

-- MATERIALIZED VIEWS (CONTINUED)
-- DROP VIEW custbal_mv;
-- DROP MATERIALIZED VIEW custbal_mv;
