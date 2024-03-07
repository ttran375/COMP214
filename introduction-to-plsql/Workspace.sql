-- Traditional Join
SELECT
    p.productname,
    p.active,
    d.deptname
FROM
    bb_product    p
    JOIN bb_department d
    ON p.iddepartment = d.iddepartment;

-- ANSI Join
SELECT
    p.productname,
    p.active,
    d.deptname
FROM
    bb_product    p
    INNER JOIN bb_department d
    USING (iddepartment);

-- Aggregate function
SELECT
    deptname,
    COUNT (idproduct)
FROM
    bb_product    p
    INNER JOIN bb_department d
    USING (iddepartment)
GROUP BY
    deptname;

-- WHERE clause filter
SELECT
    AVG(price)
FROM
    bb_product
WHERE
    type = 'C';

-- Creating Tables
CREATE TABLE autos (
    auto_id NUMBER(5),
    acquire_date DATE,
    color VARCHAR2(15),
    CONSTRAINT auto_id_pk PRIMARY KEY (auto_id)
);

-- DML - Insert
INSERT INTO autos (
    auto_id,
    acquire_date,
    color
) VALUES (
    45321,
    TO_DATE('05-MAY-2012', 'DD-MON-YYYY'),
    'gray'
);

INSERT INTO autos (
    auto_id,
    acquire_date,
    color
) VALUES (
    81433,
    TO_DATE('12-OCT-2012', 'DD-MON-YYYY'),
    'red'
);

COMMIT;

SELECT
    *
FROM
    autos;

-- DML - Update
UPDATE autos
SET
    color = 'silver'
WHERE
    auto_id = 45321;

SELECT
    *
FROM
    autos;

-- DML - Delete
DELETE FROM autos
WHERE
    auto_id = 45321;

SELECT
    *
FROM
    autos;

-- Drop Table
DROP TABLE autos;

SELECT
    *
FROM
    autos;
