CREATE DATABASE IF NOT EXISTS grad_Test;

USE grad_Test;

CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    job_title VARCHAR(50),
    business_phone VARCHAR(25),
    home_phone VARCHAR(25),
    mobile_phone VARCHAR(25),
    address LONGTEXT,
    city VARCHAR(50),
    state_province VARCHAR(50),
    zip_postal_code VARCHAR(15),
    country_region VARCHAR(50),
    web_page LONGTEXT,
    notes LONGTEXT,
    attachments LONGBLOB
);

CREATE TABLE IF NOT EXISTS Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_code VARCHAR(25),
    product_name VARCHAR(50),
    description LONGTEXT,
    standard_cost DECIMAL(19,4),
    list_price DECIMAL(19,4),
    in_stock INT,
    target_level INT,
    quantity_per_unit VARCHAR(50),
    discontinued TINYINT(1),
    minimum_stock_quantity INT,
    category VARCHAR(50),
    attachments LONGBLOB
);

CREATE TABLE IF NOT EXISTS Suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100),
    contact_person VARCHAR(50),
    contact_phone VARCHAR(25),
    contact_email VARCHAR(50)
);

CREATE TABLE  IF NOT EXISTS OrderStatus (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(20)
);

CREATE TABLE  IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_price DECIMAL(19,4),
    status_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (status_id) REFERENCES OrderStatus(status_id)
);

CREATE TABLE  IF NOT EXISTS RestockingStatus (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(20)
);

CREATE TABLE  IF NOT EXISTS Restocking (
    restocking_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT,
    order_date DATE,
    status_id INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (status_id) REFERENCES RestockingStatus(status_id)
);


CREATE TABLE IF NOT EXISTS WishList (
    wishlist_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    date_added DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE IF NOT EXISTS Ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    rating_value DECIMAL(3, 2), -- Assuming a decimal value for ratings (e.g., 4.5)
    comment TEXT,
    rating_date DATE,
    CONSTRAINT FK_ProductRating FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Create CustomerCredentials Table
CREATE TABLE IF NOT EXISTS CustomerCredentials (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    password_hash VARCHAR(255) NOT NULL, -- Store hashed password
    -- Add other fields as needed
    CONSTRAINT fk_customer_credentials
        FOREIGN KEY (customer_id)
        REFERENCES Customers (customer_id)
        ON DELETE CASCADE -- or ON DELETE RESTRICT, depending on your requirements
);


CREATE TABLE IF NOT EXISTS Cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);







