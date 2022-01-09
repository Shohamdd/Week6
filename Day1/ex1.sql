CREATE TABLE items (
item_number SERIAL PRIMARY KEY,
name varchar(25) not null,
price smallint not null);

CREATE TABLE customers (
id SERIAL PRIMARY KEY,
first_name varchar(15) not null,
last_name varchar(15) not null);

insert into items(name,price)
values ('Small Desk',100),
('Large desk',300),
('Fan',80);

INSERT INTO customers ( first_name, last_name)
VALUES ('Greg', 'Jones'),
('Sandra', 'Jones'),
('Scott', 'Scott'),
('Trevor', 'Green'),
('Melanie', 'Johnson');

SELECT * FROM items;
SELECT * FROM customers;

SELECT * FROM items WHERE price > 80;
SELECT * FROM items WHERE price<300;
SELECT * FROM customers WHERE last_name='Smith'    //SHOWS EMPTY
SELECT * FROM customers WHERE last_name='Jones'
SELECT * FROM customers WHERE first_name!='Scott'
