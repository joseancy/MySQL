CREATE TABLE admin (
    id INT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    password VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE products (
    id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(200) NOT NULL,
    product_description VARCHAR(1000),
    product_category_id INT,
    price FLOAT(9,2) NOT NULL,
    discount FLOAT(5,2),
    mrp FLOAT(9,2) NOT NULL,
    stock INT NOT NULL,
    status ENUM('Enabled', 'Disabled'),
    PRIMARY KEY (id),
    FOREIGN KEY (product_category_id) REFERENCES product_category(id)
);

CREATE TABLE product_images (
    id INT NOT NULL AUTO_INCREMENT,
    product_id INT,
    image VARCHAR(500) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE product_category (
    id INT NOT NULL AUTO_INCREMENT,
    catagory_name VARCHAR(100),
    description VARCHAR(1000) NOT NULL,
    image VARCHAR(500) NOT NULL,
    status ENUM('Enabled', 'Disabled'),
    PRIMARY KEY (id)
);

CREATE TABLE customers (
    id INT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(200) NOT NULL,
    phone_no VARCHAR(20) NOT NULL,
    email_id VARCHAR(100) NOT NULL,
    password VARCHAR(50) NOT NULL,
    address_line1 VARCHAR(500) NOT NULL,
    address_line2 VARCHAR(500),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE cards (
    id INT NOT NULL AUTO_INCREMENT,
    customer_id INT,
    card_no INT NOT NULL,
    expiry_month INT NOT NULL,
    expiry_year INT NOT NULL,
    name_on_card VARCHAR(200),
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE ratings (
    id INT NOT NULL AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    rating INT NOT NULL,
    comments VARCHAR(1000),
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE shopping_cart (
    id INT NOT NULL AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE orders (
    id INT NOT NULL AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price FLOAT(9,2) NOT NULL,
    gross_amount FLOAT(9,2) NOT NULL,
    order_date DATETIME NOT NULL,
    order_status ENUM('pending payment', 'ready to dispatch', 'cancelled', 'shipped,delivered'),
    payment_id INT,
    shipped_date DATETIME NOT NULL,
    address_line1 VARCHAR(500) NOT NULL,
    address_line2 VARCHAR(500),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (payment_id) REFERENCES payments(id)
);

CREATE TABLE payments (
    id INT NOT NULL AUTO_INCREMENT,
    payment_method  ENUM('card', 'UPI', 'COD'),
    transaction_id VARCHAR(20),
    payment_date DATETIME,
    amount FLOAT(9,2) NOT NULL,
    payment_status ENUM('paid', 'cancelled', 'COD'),
    PRIMARY KEY (id)
);