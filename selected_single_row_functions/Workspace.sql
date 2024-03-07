-- LOWER Function
SELECT
    firstname,
    lastname
FROM
    customers
WHERE
    LOWER(lastname) = 'nelson';

-- INITCAP Function
SELECT
    LOWER (firstname),
    LOWER (lastname)
FROM
    customers
WHERE
    LOWER (lastname) = 'nelson';

-- SUBSTR Function
SELECT
    DISTINCT zip,
    SUBSTR (zip, 1, 3),
    SUBSTR (zip, -3, 2)
FROM
    customers
WHERE
    SUBSTR (zip, -3, 2) <30;

-- -- INSTR Function
-- SELECT
--     name,
--     INSTR (name, '')        "First comma",
--     INSTR (name, ',', 10)   "Start read position 10",
--     INSTR (name, ',', 1, 2) "Second comma"
-- FROM
--     contact;

-- LENGTH Function
SELECT
    DISTINCT LENGTH (address)
FROM
    customers
ORDER BY
    LENGTH (address) DESC;

-- LPAD and RPAD Functions
SELECT
    FIRSTNAME,
    LPAD (FIRSTNAME, 12, ' '),
    LPAD (firstname, 12, '*')
FROM
    customers
WHERE
    firstname LIKE 'J%';

-- LTRIM and RTRIM Functions
SELECT
    lastname,
    address,
    LTRIM(address, 'P.O. BOX')
FROM
    customers
WHERE
    state = 'FL';

-- REPLACE Function
SELECT
    address,
    REPLACE(address, 'P.0.', 'POST OFFICE') AS new_address
FROM
    customers
WHERE
    state = 'FL';

-- TRANSLATE Function
-- SELECT
--     name,
--     TRANSLATE(name, ',', '-') AS name_with_hyphens,
--     TRANSLATE(name, 'A', 'a') AS name_with_lowercase_a
-- FROM
--     contacts;

-- CONCAT Function
SELECT
    firstname,
    lastname,
    CONCAT('Customer number: ', customer#) "Number"
FROM
    customers
WHERE
    state = 'FL';

-- ROUND Function
SELECT
    title,
    retail,
    ROUND(retail, 1)  AS rounded_1_decimal,
    ROUND(retail, 0)  AS rounded_no_decimal,
    ROUND(retail, -1) AS rounded_nearest_10
FROM
    books;

-- TRUNC Function
SELECT
    title,
    retail,
    TRUNC (retail, 1),
    TRUNC (retail, 0),
    TRUNC (retail, -1)
FROM
    books;

-- MOD Function
SELECT
    235/16
FROM
    DUAL;

SELECT
    TRUNC(235/16, 0) AS LBS,
    MOD(235, 16)     AS OZ
FROM
    DUAL;

-- ABS Function
SELECT
    pubdate,
    SYSDATE,
    ROUND(pubdate - SYSDATE)      AS "Days",
    ABS(ROUND(pubdate - SYSDATE)) AS "ABS Days"
FROM
    books
WHERE
    category = 'CHILDREN';

-- Date Functions
SELECT
    order#,
    shipdate,
    orderdate,
    (shipdate-orderdate) Delay
FROM
    orders
WHERE
    order# = 1004;

-- MONTHS_BETWEEN Function
SELECT
    title,
    MONTHS_BETWEEN(orderdate, pubdate) AS MTHS
FROM
    books
    JOIN orderitems
    USING (isbn)
    JOIN orders
    USING (order#)
WHERE
    order# = 1004;

-- ADD_MONTHS Function
SELECT
    title,
    pubdate,
    ADD_MONTHS ('01-DEC-08', 18) "Renegotiate Date",
    ADD_MONTHS (pubdate, 84)     "Drop Date"
FROM
    books
WHERE
    category = 'COMPUTER'
ORDER BY
    "Renegotiate Date";

-- NEXT_DAY Function
SELECT
    order#,
    orderdate,
    NEXT_DAY (orderdate, 'MONDAY')
FROM
    orders
WHERE
    order# = 1018;

-- TO_DATE Function
SELECT
    order#,
    orderdate,
    shipdate
FROM
    orders
WHERE
    orderdate= TO_DATE('March 31, 2009', 'Month DD, YYYY');

-- ROUND Function
SELECT
    pubdate,
    ROUND (pubdate, 'MONTH'),
    ROUND (pubdate, 'YEAR')
FROM
    books;

-- TRUNC Function
SELECT
    title,
    TRUNC(MONTHS_BETWEEN (orderdate, pubdate), 0) MTHS
FROM
    books
    JOIN orderitems
    USING (isbn)
    JOIN orders
    USING (order#)
WHERE
    order# = 1004;

-- REGEXP_LIKE
-- SELECT
--     *
-- FROM
--     suppliers
-- WHERE
--     REGEXP_LIKE (description, '[0-9] (3) [-][0-9]{3} [-][0-9]{4}');

-- NVL Function
SELECT
    order#,
    orderdate,
    shipdate,
    NVL (shipdate, '06-APR-09')-orderdate "Ship Days"
FROM
    orders
WHERE
    orderdate >= '03-APR-09';

-- NVL2 Function
SELECT
    order#,
    orderdate,
    NVL2 (shipdate, 'Shipped', 'Not Shipped') "Status"
FROM
    orders
WHERE
    orderdate >= '03-APR-09';

-- NULLIF Function
SELECT
    o.customer#,
    order#,
    isbn,
    oi.paideach,
    b.retail,
    NULLIF(oi.paideach, b.retail)
FROM
    orders     o
    JOIN orderitems oi
    USING (order#)
    JOIN books b
    USING (isbn)
WHERE
    order# IN (1001, 1007)
ORDER BY
    order#;

-- TO_CHAR Function

SELECT
    title,
    TO_CHAR(pubdate, 'MONTH DD, YYYY') "Publication Date",
    TO_CHAR(retail, '$999.99')         "Retail Price"
FROM
    books
WHERE
    isbn = 0401140733;

-- DECODE Function
SELECT
    customer#,
    state,
    DECODE(state, 'CA', .08, 'FL', .07, 'GA', .06, 'TX', .082, 0) AS "Sales Tax Rate"
FROM
    customers
WHERE
    state IN ('CA', 'FL', 'GA', 'TX');

-- CASE Expression
-- SELECT
--     empno,
--     lname,
--     fname,
--     ROUND (MONTHS_BETWEEN ('01-JUL-09', hiredate)/12, 2) "Years",
--     CASE
--         WHEN (MONTHS_BETWEEN ('01-JUL-09', hiredate)/12) < 4 THEN
--             'Level 1'
--         WHEN (MONTHS_BETWEEN ('01-JUL-09', hiredate)/12) < 8 THEN
--             'Level 2'
--         WHEN (MONTHS_BETWEEN ('01-JUL-09', hiredate)/12) < 11 THEN
--             'Level 3'
--         WHEN (MONTHS_BETWEEN ('01-JUL-09', hiredate)/12) < 15 THEN
--             'Level 4'
--         ELSE
--             'Level 5'
--     END                                                  "Retire Level"
-- FROM
--     employees;

-- SOUNDEX Function
SELECT
    customer#,
    lastname,
    firstname
FROM
    customers
WHERE
    SOUNDEX (lastname) = SOUNDEX('smyth');

-- TO_NUMBER Function
SELECT
    title,
    pubdate,
    TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - TO_NUMBER(TO_CHAR(pubdate, 'YYYY')) AS "Yrs"
FROM
    books
WHERE
    category = 'COMPUTER';

-- Using DUAL
SELECT
    ROUND (4769.43, -2),
    Length('Hello')
FROM
    DUAL;
