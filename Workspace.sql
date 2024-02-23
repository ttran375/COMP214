SELECT
    SUM(shipping)                               AS actual,
    SUM(ship_calc_sf(quantity))                 AS calc,
    SUM(shipping) - SUM(ship_calc_sf(quantity)) AS diff
FROM
    bb_basket
WHERE
    orderplaced = 1;
