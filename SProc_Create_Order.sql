DELIMITER //

CREATE PROCEDURE CreateOrder (
    IN customer_id_param INT,
    IN product_ids_param VARCHAR(255), -- Assuming a comma-separated list of product IDs
    IN quantities_param VARCHAR(255)   -- Assuming a comma-separated list of quantities corresponding to product IDs
)
BEGIN
    DECLARE product_id INT;
    DECLARE quantity INT;
    DECLARE product_stock INT;
    DECLARE done INT DEFAULT FALSE;

    START TRANSACTION;

    -- Split the comma-separated product IDs and quantities into separate tables
    CREATE TEMPORARY TABLE tempProductIDs (product_id INT);
    CREATE TEMPORARY TABLE tempQuantities (quantity INT);

    SET @product_ids_param = product_ids_param;
    SET @quantities_param = quantities_param;

    WHILE LENGTH(@product_ids_param) > 0 DO
        SET @pos = IFNULL(NULLIF(LOCATE(',', @product_ids_param) - 1, -1), LENGTH(@product_ids_param));
        SET @product_id = SUBSTRING(@product_ids_param, 1, @pos);
        SET @product_ids_param = SUBSTRING(@product_ids_param, @pos + 2);

        SET @pos = IFNULL(NULLIF(LOCATE(',', @quantities_param) - 1, -1), LENGTH(@quantities_param));
        SET @quantity = SUBSTRING(@quantities_param, 1, @pos);
        SET @quantities_param = SUBSTRING(@quantities_param, @pos + 2);

        INSERT INTO tempProductIDs VALUES (CAST(@product_id AS UNSIGNED));
        INSERT INTO tempQuantities VALUES (CAST(@quantity AS UNSIGNED));
    END WHILE;

    -- Check if the products are in stock and update the stock if available
    SET done = FALSE;

    WHILE NOT done DO
        -- Fetch product_id and quantity
        SELECT MIN(product_id), MIN(quantity)
        INTO product_id, quantity
        FROM tempProductIDs, tempQuantities;

        IF product_id IS NOT NULL THEN
            -- Check if the product is in stock
            SELECT in_stock INTO product_stock
            FROM Products
            WHERE product_id = product_id;

            IF product_stock >= quantity THEN
                -- Sufficient stock available, proceed with the order
                -- Update the product stock
                UPDATE Products
                SET in_stock = in_stock - quantity
                WHERE product_id = product_id;

                -- Insert the order details
                INSERT INTO Orders (customer_id, order_date, total_price, status_id)
                VALUES
                (customer_id_param, CURRENT_DATE, (SELECT list_price * quantity FROM Products WHERE product_id = product_id), 1); -- Assuming status_id 1 corresponds to 'Pending'
            ELSE
                -- Insufficient stock for at least one product, rollback the transaction
                ROLLBACK;
                SELECT CONCAT('Insufficient stock for product ID ', CAST(product_id AS CHAR), '. Order creation failed.') AS Result;
                SET done = TRUE;
            END IF;
        ELSE
            -- No more rows, exit the loop
            SET done = TRUE;
        END IF;
    END WHILE;

    COMMIT;
    DROP TEMPORARY TABLE IF EXISTS tempProductIDs, tempQuantities;
    SELECT 'Order created successfully.' AS Result;
END //

DELIMITER ;
