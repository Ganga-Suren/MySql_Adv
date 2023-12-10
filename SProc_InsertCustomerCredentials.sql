DELIMITER //

CREATE PROCEDURE InsertCustomerAndCredentials(
    IN p_first_name VARCHAR(50),
    IN p_last_name VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_job_title VARCHAR(50),
    IN p_business_phone VARCHAR(25),
    IN p_home_phone VARCHAR(25),
    IN p_mobile_phone VARCHAR(25),
    IN p_address LONGTEXT,
    IN p_city VARCHAR(50),
    IN p_state_province VARCHAR(50),
    IN p_zip_postal_code VARCHAR(15),
    IN p_country_region VARCHAR(50),
    IN p_web_page LONGTEXT,
    IN p_notes LONGTEXT,
    IN p_attachments LONGBLOB,
    IN p_customer_name VARCHAR(50),
    IN p_password_hash VARCHAR(255)
)
BEGIN
    DECLARE new_customer_id INT;

    -- Insert data into Customers table
    INSERT INTO Customers (
        first_name, last_name, email, job_title,
        business_phone, home_phone, mobile_phone,
        address, city, state_province, zip_postal_code,
        country_region, web_page, notes, attachments
    ) VALUES (
        p_first_name, p_last_name, p_email, p_job_title,
        p_business_phone, p_home_phone, p_mobile_phone,
        p_address, p_city, p_state_province, p_zip_postal_code,
        p_country_region, p_web_page, p_notes, p_attachments
    );

    -- Get the auto-generated customer_id for the newly inserted customer
    SET new_customer_id = LAST_INSERT_ID();

    -- Insert data into CustomerCredentials table
    INSERT INTO CustomerCredentials (customer_id, customer_name, password_hash)
    VALUES (new_customer_id, p_customer_name, p_password_hash);
END //

DELIMITER ;
