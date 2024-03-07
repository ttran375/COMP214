-- Creating a Sequence
CREATE SEQUENCE orders_order#_seq
INCREMENT BY 1
START WITH 1021
NOCACHE
NOCYCLE;

-- Verify Sequence Creation
SELECT
    object_name
FROM
    user_objects
WHERE
    object_type = 'SEQUENCE';

-- Verify Sequence Options Settings
SELECT
    *
FROM
    user_sequences;

-- Using Sequence Values
INSERT INTO orders (
    order#,
    customer#,
    orderdate,
    shipdate,
    shipstreet,
    shipcity,
    shipstate,
    shipzip
) VALUES (
    orders_order#_seq.NEXTVAL,
    1010,
    TO_DATE('06-APR-09', 'DD-MON-YY'),
    NULL,
    '123 WEST MAIN',
    'ATLANTA',
    'GA',
    30418
);

-- Order added using a sequence value for the Order#
SELECT
    order#,
    customer#,
    orderdate,
    shipdate,
    shipstreet,
    shipcity,
    shipstate,
    shipzip
FROM
    orders
WHERE
    customer# = 1010;

-- Using CURRVAL to insert an order detail row
INSERT INTO orderitems (
    order#,
    item#,
    isbn,
    quantity,
    paideach
) VALUES (
    orders_order#_seq. CURRVAL,
    1,
    8117949391,
    1,
    8.50
);

-- Verifying the CURRVAL value
SELECT
    *
FROM
    orderitems
WHERE
    order# = 1021;

-- Create sequence and table with default value using a sequence
CREATE SEQUENCE test_defval_seq
INCREMENT BY 1
START WITH 100
NOCACHE
NOCYCLE;

CREATE TABLE test_defval (
    coll NUMBER DEFAULT test_defval_seq.NEXTVAL,
    co12 NUMBER
);

-- Execute Inserts to test sequence default value
INSERT INTO test_defval (
    coll,
    co12
) VALUES (
    DEFAULT,
    350
);

INSERT INTO test_defval (
    co12
) VALUES (
    355
);

INSERT INTO test_defval (
    coll,
    co12
) VALUES (
    222,
    360
);

-- Execute a query to review values inserted
SELECT
    *
FROM
    test_defval;

-- Command to change the INCREMENT BY setting for a sequence
ALTER SEQUENCE orders_order#_seq INCREMENT BY 10;

-- New settings for the ORDERS_ORDER#_SEQ sequence
SELECT
    *
FROM
    user_sequences;

-- Using the DUAL table
SELECT
    SYSDATE
FROM
    DUAL;

-- Removing a Sequence
DROP SEQUENCE orders_order#_seq;

-- Verify sequence removal
SELECT
    *
FROM
    user_sequences;

-- Create table with an Identity Column
CREATE TABLE test_ident (
    col1 NUMBER GENERATED AS IDENTITY PRIMARY KEY,
    col2 NUMBER
);

-- Using an Identity Column
INSERT INTO test_ident (
    col2
) VALUES (
    350
);

INSERT INTO test_ident (
    col1,
    col2
) VALUES (
    222,
    355
);

INSERT INTO test_ident (
    col1,
    col2
) VALUES (
    DEFAULT,
    360
);

-- Columns values resulting from inserts
SELECT
    *
FROM
    test_ident;

-- Creating an index on the Zip column
CREATE INDEX customers_zip_idx
ON customers (zip);

-- Explain Plan – Indicating Full Table Scan
SELECT
    customer#,
    lastname,
    city,
    state,
    zip
FROM
    customers
WHERE
    zip = 49006;

-- Explain Plan – Index used
SELECT /*+INDEX (customers)*/
    customer#,
    lastname,
    city,
    state,
    zip
FROM
    customers
WHERE
    zip = 49006;

-- Explicitly creating a unique index
CREATE UNIQUE INDEX books_title_idx
ON books (title);

-- Explicitly creating a unique index – DESC sort
CREATE INDEX customers_zip_desc_idx ON customers (zip DESC);

-- Creating a composite index
CREATE INDEX customer_name_idx
ON customers (lastname, firstname);

-- Creating a bitmap index on the Region column
CREATE BITMAP INDEX customers_region_idx
ON customers (region);

-- Creating a function-based index
CREATE INDEX books_profit_idx
ON books (retail-cost);

-- Index Organized Tables
CREATE TABLE books2 (
    ISBN VARCHAR2(10),
    title VARCHAR2(30),
    pubdate DATE,
    pubID NUMBER (2),
    cost NUMBER (5, 2),
    retail NUMBER (5, 2),
    category VARCHAR2(12),
    CONSTRAINT books2_isbn_pk PRIMARY KEY(isbn)
) ORGANIZATION INDEX;

-- Verifying an Index (continued)
SELECT
    table_name,
    index_name,
    index_type
FROM
    user_indexes
WHERE
    table_name = 'CUSTOMERS';

-- USER_IND_COLUMNS
SELECT
    table_name,
    index_name,
    column_name
FROM
    user_ind_columns
WHERE
    table_name = 'CUSTOMERS';

-- Removing an Index
-- DROP INDEX books_profitcalc_idx;

-- CREATE SYNONYM Command
-- CREATE SYNONYM orderentry FOR orders;

-- SELECT
--     *
-- FROM
--     orderentry
-- WHERE
--     customer# = 1010;

-- Deleting a SYNONYM
-- DROP SYNONYM orderentry;
