DELIMITER //

CREATE PROCEDURE CancelOrder (
    IN order_id_param INT
)
BEGIN
    DECLARE product_id INT;
    DECLARE quantity INT;
    DECLARE done INT DEFAULT FALSE;

    START TRANSACTION;

    -- Get product_id and quantity from the order
    CREATE TEMPORARY TABLE tempOrderProducts AS
    SELECT product_id, quantity
    FROM OrderProducts
    WHERE order_id = order_id_param;

    -- Update product stock for the canceled order
    SET done = FALSE;

    WHILE NOT done DO
        -- Fetch product_id and quantity
        SELECT MIN(product_id), MIN(quantity)
        INTO product_id, quantity
        FROM tempOrderProducts;

        IF product_id IS NOT NULL THEN
            -- Update product stock
            UPDATE Products
            SET in_stock = in_stock + quantity
            WHERE product_id = product_id;
        ELSE
            -- No more rows, exit the loop
            SET done = TRUE;
        END IF;
    END WHILE;

    -- Update order status to canceled
    UPDATE Orders
    SET status_id = 3 -- Assuming status_id 3 corresponds to 'Canceled'
    WHERE order_id = order_id_param;

    COMMIT;
    DROP TEMPORARY TABLE IF EXISTS tempOrderProducts;
    SELECT 'Order canceled successfully.' AS Result;
END //

DELIMITER ;
