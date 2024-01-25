--Question 1
--List all products whose unit price is less than the average price.
--1 mark
SELECT
    *
FROM
    Products
WHERE
    UnitPrice < (
        SELECT
            AVG(UnitPrice)
        FROM
            Products
    );

--Question 2
--List the shipper id, shipping company and freight cost for the order with the lowest freight charge.
--2 marks
SELECT
    shippers.SHIPPERID,
    shippers.COMPANYNAME,
    MIN(orders.FREIGHT) as lowest_freight_cost
FROM
    orders
    JOIN shippers ON orders.SHIPVIA = shippers.SHIPPERID
GROUP BY
    shippers.SHIPPERID,
    shippers.COMPANYNAME
ORDER BY
    lowest_freight_cost ASC
FETCH FIRST
    1 ROWS ONLY;

--Question 3
--List all products with their highest unit price, i.e. not discounted.
--3 marks
SELECT
    PRODUCTID,
    PRODUCTNAME,
    MAX(UNITPRICE) as highest_unit_price
FROM
    products
GROUP BY
    PRODUCTID,
    PRODUCTNAME;

--Question 4
--List the average unit price for each product category and
--the average unit price without discounts
--4 marks
SELECT
    c.CATEGORYID,
    c.CATEGORYNAME,
    AVG(p.UNITPRICE) as avg_unit_price
FROM
    products p
    JOIN categories c ON p.CATEGORYID = c.CATEGORYID
WHERE
    p.DISCONTINUED = 0
GROUP BY
    c.CATEGORYID,
    c.CATEGORYNAME;
