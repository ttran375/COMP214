-- ANSI Join
SELECT
    p.productname,
    p.active,
    d.deptname
FROM
    bb_product    p
    INNER JOIN bb_department d
    USING (iddepartment);
