CREATE TABLE BB_BASKETITEM (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    price DECIMAL(10, 2),
    quantity INT
);

CREATE PROCEDURE SHIP_COST_SP (
    IN BASKET_ID INT,
    OUT SHIPPING_COST DECIMAL(10, 2)
)
BEGIN
 -- Your procedure logic here
 -- For example, you might calculate shipping cost based on basket_id
 -- Set the shipping_cost output parameter accordingly
END;

SELECT
    REFERENCED_NAME,
    REFERENCED_TYPE,
    REFERENCED_OWNER
FROM
    USER_DEPENDENCIES
WHERE
    NAME = 'ORDER_TOTAL_SP';
