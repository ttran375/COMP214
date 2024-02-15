BEGIN
    UPDATE bb_product
    SET
        stock = stock + 25
    WHERE
        idProduct = 15;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Not Found');
    ELSE
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(SQL%ROWCOUNT));
    END IF;
END;

DECLARE
  lv_tot_num bb_basket.total%TYPE;
BEGIN
  SELECT total
  INTO lv_tot_num
  FROM bb_basket
  WHERE idBasket = 12;

  IF SQL%ROWCOUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Not Found in bb_basket');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Rows affected in bb_basket: ' || TO_CHAR(SQL%ROWCOUNT));
  END IF;

  UPDATE bb_product
  SET stock = stock + 25
  WHERE idProduct = 15;

  IF SQL%ROWCOUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Not Found in bb_product');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Rows affected in bb_product: ' || TO_CHAR(SQL%ROWCOUNT));
  END IF;
END;

DECLARE
  CURSOR cur_basket IS
    SELECT b.idBasket, p.type, bi.price, bi.quantity 
    FROM bb_basketitem bi 
    INNER JOIN bb_product p USING (idProduct)
    WHERE bi.idBasket = :g_basket;

  TYPE type_basket IS RECORD (
    basket bb_basketitem.idBasket%TYPE,
    type bb_product.type%TYPE,
    price bb_basketitem.price%TYPE,
    qty bb_basketitem.quantity%TYPE
  );

  rec_basket type_basket;
  lv_rate_num NUMBER(2,2);
  lv_tax_num NUMBER(4,2) := 0;
BEGIN
  OPEN cur_basket;
  LOOP
    FETCH cur_basket INTO rec_basket;
    EXIT WHEN cur_basket%NOTFOUND;

    IF rec_basket.type = 'E' THEN 
      lv_rate_num := .05; 
    ELSIF rec_basket.type = 'C' THEN 
      lv_rate_num := .03; 
    END IF;

    lv_tax_num := lv_tax_num + ((rec_basket.price * rec_basket.qty) * lv_rate_num);
  END LOOP;
  CLOSE cur_basket;

  DBMS_OUTPUT.PUT_LINE('Tax Amount: ' || TO_CHAR(lv_tax_num));
END;
