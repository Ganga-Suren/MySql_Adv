-- Insert data into Customers table
INSERT INTO Customers (first_name, last_name, email, job_title, business_phone, home_phone, mobile_phone, address, city, state_province, zip_postal_code, country_region, web_page, notes, attachments)
VALUES
('John', 'Doe', 'john.doe@example.com', 'Manager', '123-456-7890', '987-654-3210', '555-123-4567', '123 Main St', 'Cityville', 'CA', '12345', 'USA', 'http://www.example.com', 'Some notes about John Doe', NULL),
('Jane', 'Smith', 'jane.smith@example.com', 'Engineer', '111-222-3333', '444-555-6666', '777-888-9999', '456 Oak St', 'Townsville', 'NY', '54321', 'USA', 'http://www.janeswebsite.com', 'Notes about Jane Smith', NULL),
('Bob', 'Johnson', 'bob.johnson@example.com', 'Sales Associate', '555-111-2222', '333-444-5555', '666-777-8888', '789 Pine St', 'Villageton', 'TX', '67890', 'USA', 'http://www.bobsbusiness.com', 'Bob\'s notes', NULL),
('Alice', 'Williams', 'alice.williams@example.com', 'Designer', '222-333-4444', '555-666-7777', '888-999-0000', '890 Cedar St', 'Hamletsville', 'FL', '98765', 'USA', 'http://www.alicesdesigns.com', 'Alice\'s notes', NULL),
('Charlie', 'Brown', 'charlie.brown@example.com', 'Technician', '777-888-9999', '222-333-4444', '555-666-7777', '567 Birch St', 'Villageton', 'TX', '54321', 'USA', 'http://www.charliesrepairs.com', 'Charlie\'s notes', NULL);

-- Insert data into Products table
INSERT INTO Products (product_code, product_name, description, standard_cost, list_price, in_stock, target_level, quantity_per_unit, discontinued, minimum_stock_quantity, category, attachments)
VALUES
('P001', 'Product A', 'Description of Product A', 10.00, 19.99, 50, 100, 'Unit', 0, 20, 'Electronics', NULL),
('P002', 'Product B', 'Description of Product B', 15.00, 29.99, 30, 80, 'Pack', 0, 15, 'Clothing', NULL),
('P003', 'Product C', 'Description of Product C', 20.00, 39.99, 20, 60, 'Case', 1, 10, 'Appliances', NULL),
('P004', 'Product D', 'Description of Product D', 25.00, 49.99, 40, 70, 'Set', 0, 25, 'Furniture', NULL),
('P005', 'Product E', 'Description of Product E', 30.00, 59.99, 10, 40, 'Pair', 0, 12, 'Home & Garden', NULL);

-- Insert data into Suppliers table
INSERT INTO Suppliers (supplier_name, contact_person, contact_phone, contact_email)
VALUES
('Supplier XYZ', 'Jane Supplier', '555-987-6543', 'jane.supplier@example.com'),
('ABC Distributors', 'John Distributor', '888-555-2222', 'john.distributor@example.com'),
('Global Suppliers', 'Bob Global', '777-444-1111', 'bob.global@example.com'),
('Quality Suppliers', 'Alice Quality', '333-222-1111', 'alice.quality@example.com'),
('Tech Providers', 'Charlie Tech', '999-888-7777', 'charlie.tech@example.com');


-- Insert data into OrderStatus table
INSERT INTO OrderStatus (status_name)
VALUES
('Pending'),
('Shipped'),
('Delivered');

-- Insert data into Orders table
INSERT INTO Orders (customer_id, order_date, total_price, status_id)
VALUES
(1, '2023-01-15', 150.00, 1), -- Assuming status_id 1 corresponds to 'Pending'
(2, '2023-01-16', 200.00, 2), -- Assuming status_id 2 corresponds to 'Shipped'
(3, '2023-01-17', 120.00, 1), -- Assuming status_id 1 corresponds to 'Pending'
(4, '2023-01-18', 180.00, 3), -- Assuming status_id 3 corresponds to 'Completed'
(5, '2023-01-19', 250.00, 1); -- Assuming status_id 1 corresponds to 'Pending'

-- Insert data into RestockingStatus table
INSERT INTO RestockingStatus (status_name)
VALUES
('Pending'),
('In Progress'),
('Completed');

-- Insert data into Restocking table
INSERT INTO Restocking (product_id, quantity, order_date, status_id)
VALUES
(1, 30, '2023-01-20', 1), -- Assuming status_id 1 corresponds to 'Pending'
(2, 25, '2023-01-21', 2), -- Assuming status_id 2 corresponds to 'Received'
(3, 15, '2023-01-22', 1), -- Assuming status_id 1 corresponds to 'Pending'
(4, 10, '2023-01-23', 2), -- Assuming status_id 2 corresponds to 'Received'
(5, 20, '2023-01-24', 1); -- Assuming status_id 1 corresponds to 'Pending'

-- Insert data into WishList table
INSERT INTO WishList (customer_id, product_id, date_added)
VALUES
(1, 1, '2023-01-10'),
(2, 2, '2023-01-11'),
(3, 3, '2023-01-12'),
(4, 4, '2023-01-13'),
(5, 5, '2023-01-14');



-- Insert sample ratings data
INSERT INTO Ratings (product_id, rating_value, comment, rating_date)
VALUES
(1, 4.5, 'Great product!', '2023-02-01'),
(1, 3.8, 'Good but could be better', '2023-02-05'),
(2, 5.0, 'Excellent!', '2023-02-10');

-- Sample data for CustomerCredentials (you may adjust this based on your needs)
INSERT INTO CustomerCredentials (customer_id, customer_name, password_hash)
VALUES
    (1, 'John', 'John'),
    (2, 'Jane', 'Jane'),
    (3, 'Bob', 'Bob'),
    (4, 'Alice', 'Alice'),
    (5, 'Charlie', 'Charlie'),
    (6, 'Kranthi', 'Kranthi');
    -- Add more rows as needed;
    
INSERT INTO Partners (partner_name) VALUES
    ('Northwind Traders', 'Sells Food Items'),
    ('AdventureWorks Cycles', 'Sells Bikes and Accessories'),
    ('Sakila Films', 'Sells Films');
