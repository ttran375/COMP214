-- Traditional Join
SELECT
    p.productname,
    p.active,
    d.deptname
FROM
    bb_product    p
    JOIN bb_department d
    ON p.iddepartment = d.iddepartment;
