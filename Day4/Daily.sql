CREATE TABLE orders (
id serial Primary key,
client_id integer references users(client_id),
	item1_id integer unique references items(id),
	item2_id integer unique references items(id)
);

CREATE TABLE items(
id serial primary key,
	item_name varchar (25) not null,
	price smallint not null,
	order_id integer);


CREATE FUNCTION price_per_order (id integer)
RETURNS int AS $order_price$
declare
order_price integer;
BEGIN
order_price := ISNULL(SELECT price from items join order on item1_id=items.id,0)+ ISNULL(select price from items join order on item2_id=items.id,0)
RETURN order_price
END;
$order_price$ LANGUAGE plpgsql;


insert into items (item_name,price) values ('pc',500), ( 'desk',70), ('console',30), ('robot',200);
insert into orders (client_name,item1_id,item2_id) values ('dan',1,2), ('dana',3,null), ('Adam',4,null);


UPDATE items SET order_id =1 where id in(1,2)

SELECT SUM(price) from orders
join items on items.id=orders.item1_id and items.id= orders.item2_id
