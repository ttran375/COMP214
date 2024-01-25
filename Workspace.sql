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