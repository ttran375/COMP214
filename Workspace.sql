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
    AND category = 'COMPUTER';

SELECT
    category,
    AVG(retail - cost)
FROM
    books
GROUP BY
    category
HAVING
    AVG(retail - cost) > (
        SELECT
            AVG(retail - cost)
        FROM
            books
        WHERE
            category = 'LITERATURE'
    );

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

SELECT
    title,
    retail
FROM
    books
WHERE
    retail < ANY (
        SELECT
            retail
        FROM
            books
        WHERE
            category = 'COOKING'
    );

SELECT
    order#,
    SUM(quantity * paideach)
FROM
    orderitems
GROUP BY
    order#
HAVING
    SUM(quantity * paideach) > ALL (
        SELECT
            SUM(quantity * paideach)
        FROM
            customers
            JOIN orders USING (customer#)
            JOIN orderitems USING (order#)
        WHERE
            state = 'FL'
        GROUP BY
            order#
    );

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
            AVG(retail) AS cataverage
        FROM
            books
        GROUP BY
            category
    ) a
WHERE
    b.category = a.category
    AND b.retail > a.cataverage;

SELECT
    customer#
FROM
    customers
WHERE
    (referred, 0) = (
        SELECT
            NVL(referred, 0)
        FROM
            customers
        WHERE
            customer# = 1005
    );


select firstname from bb_shopper;
