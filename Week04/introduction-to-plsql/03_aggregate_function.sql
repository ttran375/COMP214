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
