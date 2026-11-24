CREATE TABLE categories (
	category_id INT AUTO_INCREMENT PRIMARY KEY, 
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    pruduct_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    pruduct_name VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    image VARCHAR(250) NOT NULL,
    availability BOOLEAN DEFAULT TRUE,
    
    FOREIGN KEY (category_id)
    REFERENCES category(category_id)
);

CREATE TABLE orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_phone VARCHAR(100),
    pickup_time DATETIME NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_status VARCHAR(30) DEFAULT 'Pending',
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
	order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),
    
    FOREIGN KEY (product_id)
    REFERENCES product(product_id)
);

INSERT INTO categories (category_name)
VALUES
('Foods'),
('Drinks'),
('Side Dishes'),
('Desserts');

INSERT INTO products (category_id, product_name, description, price, image)
VALUES
(1, 'Classic Hotdog', 'Classic Hotdog Sandwich', 75.00, 'hotdog.jpg'),
(1, 'Cheese Hotdog', 'Hotdog with Cheese', 90.00, 'cheese.jpg'),
(2, 'Iced Tea', 'Refreshing iced tea', 35.00, 'icedtea.jpg'),
(3, 'French Fries', 'Crispy French Fries', 50.00 , 'fries.jpg'),
(4, 'Chocolate Cake', 'Chocolate Dessert', 65.00, 'cake.jpg');