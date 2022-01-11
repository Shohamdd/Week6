1.
  CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  full_name VARCHAR(45) NOT NULL
);


CREATE TABLE customer_profile (
	profile_id SERIAL REFERENCES customers( customer_id) ,
  first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(45) NOT NULL,
	city text NOT NULL,
	customer_date date
);

INSERT INTO customers(full_name)
VALUES ('David'), ('Ron')


INSERT INTO customer_profile(first_name , last_name,city,customer_date)
VALUES ('David','Ron','tel-aviv','12/12/1996')

SELECT *  FROM customer_profile;
SELECT * FROM customers;

SELECT * FROM customers
FULL OUTER JOIN customer_profile
ON customers.customer_id = customer_profile.profile_id;

SELECT * FROM customers
JOIN customer_profile
ON customers.customer_id = customer_profile.profile_id;

SELECT * FROM customers
LEFT JOIN customer_profile
ON customers.customer_id = customer_profile.profile_id;

SELECT * FROM customers
RIGHT JOIN customer_profile
ON customers.customer_id = customer_profile.profile_id;

2.
CREATE TABLE customer(
customer_id SERIAL,
customer_name VARCHAR(50) NOT NULL,
PRIMARY KEY (customer_id)
);

CREATE TABLE customer_profile(
pk_customer_id INTEGER NOT NULL,
customer_character TEXT NOT NULL,
PRIMARY KEY (pk_customer_id),
CONSTRAINT fk_customer_id FOREIGN KEY (pk_customer_id) REFERENCES customer (customer_id)
);

INSERT INTO customer(customer_name) VALUES
('John'),
('Dan'),
('Anne'),
('Lian'),
('Dana');

INSERT INTO customer_profile(pk_customer_id, customer_character) VALUES
((SELECT customer_id FROM customer WHERE customer_name = 'Dana'), 'She is very cool and useful.'),
((SELECT customer_id FROM customer WHERE customer_name = 'Dan'), 'He is very lazy.');

SELECT customer.customer_name, customer_profile.customer_character as character
FROM customer
FULL OUTER JOIN customer_profile
ON customer.customer_id = customer_profile.pk_customer_id;


CREATE TABLE product (
item_id SERIAL,
product_name VARCHAR(30) NOT NULL,
PRIMARY KEY (item_id)
);

INSERT INTO product(product_name) VALUES
('Chair'),
('Table'),
('Fan'),
('Bottle'),
('Drill'),
('Stickers');

CREATE TABLE item_order (
customer_id INTEGER NOT NULL,
item_id INTEGER NOT NULL,
number_order INTEGER NOT NULL,
PRIMARY KEY (customer_id, item_id),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON UPDATE CASCADE,
FOREIGN KEY (item_id) REFERENCES product(item_id) ON UPDATE CASCADE
);

INSERT INTO item_order(customer_id, item_id, number_order) VALUES
((SELECT customer_id FROM customer  WHERE customer_name = 'Dan'), (SELECT item_id FROM product WHERE product_name = 'Chair'), 5),
((SELECT customer_id FROM customer  WHERE customer_name = 'Dana'), (SELECT item_id FROM product WHERE product_name = 'Bottle'), 2),
((SELECT customer_id FROM customer  WHERE customer_name = 'John'), (SELECT item_id FROM product WHERE product_name = 'Drill'), 1);
