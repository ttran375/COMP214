SELECT
    idProduct,
    price,
    ROUND(price, 0)
FROM
    bb_product
WHERE
    idProduct < 4;
