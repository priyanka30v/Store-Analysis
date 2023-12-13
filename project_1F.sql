# Database of bikes created


CREATE  DATABASE Production;

CREATE  DATABASE  Sales;

USE  Production;

#drop table products;

## Product Table is created
CREATE TABLE products(
product_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(50) NOT NULL,
model_year YEAR NOT NULL,
list_price DECIMAL NOT NULL
);

## Data is inserted into Products Table where product name,year mentioned


INSERT INTO products(product_name,model_year,list_price)
VALUES
("Hero splendor",1996,400),
("Hero splendor plus",1998,401),
("Hero passion",1998,299),
("Hero passion Pro",2000,209),
("Hero splendor plus XTEC",2002,208),
("Hero  super splendor",2004,200),
("Hero splendor iSmart 110",2006,400),
("Hero Xtreme 200S",2008,400),
("Hero Glamour XTEC",2009,207),
("Hero passion XTEC",2011,300),
("Hero Xtreme",2012,133),
("Hero Maestro edge-125",2014,144),
("Hero HF-100",2016,299),
("Hero pleasure",2018,129),
("Honda  SP 125",2020,124),
("Hero Destini 125r",2004,178),
("Hero Xpulse 200",2005,492),
("Hero Xpulse 200T",2006,399),
("Hero Passion XPRO",2007,234),
("Hero Xtreme 200R",2008,234),
("Hero Passion XTEC",2009,167),
("Hero super splendor",2023,484),
("Hero HF 100",2005,145),
("Hero Xpulse 200",2009,469);


DROP TABLE products;

DROP TABLE customers;

## customers table created

CREATE TABLE customers (
	customer_id INT not null  PRIMARY KEY auto_increment,
	full_name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (255) NOT NULL,
	area  VARCHAR (50),
    prod_id int not null,
    FOREIGN KEY (prod_id) REFERENCES products(product_id)
);

## data is inserted into customers table,where customers info is given

INSERT INTO customers(full_name,phone,email,area,prod_id)
VALUES
("Akash varma","9912345678","aka@gmail.com","camp",1),
("Aaditya varma","9912345648","ada@gmail.com","trimurti nagar",2),
("Gauri more","9912343678","ga@gmail.com","trimurti nagar",22),
("Sanket jadhav","9912345638","san@gmail.com","pimple gurav",20),
("Nandan jadhav","9913445678","nan@gmail.com","pimple gurav",3),
("Apurva jadhav","9912343678","apu@gmail.com","wakad",4),
("Shivani more","9812345678","shi@gmail.com","wakad",5),
("Aradhya hinge","9312345678","ar@gmail.com","chakan",6),
("Pinki varma","9912345478","pi@gmail.com","chakan",7),
("kalpana borse","9342345678","kal@gmail.com","moshi",8),
("Alka borse","9912345679","ala@gmail.com","moshi",9),
("Anita borse","9412345678","ani@gmail.com","pimple saudagar",10),
("Sadhna borse","9412345674","sad@gmail.com","pimple saudagar",11),
("Sharvari tambe","9912345634","sha@gmail.com","pimple nilakh",12),
("Nirmala rane","9912345656","aka@gmail.com","NULL",21),
("Shubhangi rane","9934545678","shu@gmail.com","NULL",13),
("Radha varma","9912345456","ra@gmail.com","pimple nilakh",14),
("Akashi varma","NULL","ash@gmail.com","Baner",15),
("jeet more","9422345678","jeet@gmail.com","Baner",16),
("Jivyanshi rathi","NULL","jiv@gmail.com","NULL",17),
("Valmiki sath","9512345678","val@gmail.com","Aundh",18),
("Vayu","9412345678","vay@gmail.com","Aundh",19),
("Vaishali varma","9422345678","vai@gmail.com","Aundh",20),
("Hira seth","9812345678","hir@gmail.com","NULL",23);

## Table store is created

CREATE TABLE stores (
	store_id INT not null PRIMARY KEY auto_increment,
	store_name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	area VARCHAR (255)
);
## Data is inserted into table store where store name and phone is mentioned


INSERT INTO stores (store_name,phone,area)
VALUES("hero bikes","02023445","wakad"),
("hero shine","02023344","chakan"),
("hero proud","02023567","moshi"),
("hero bikes","02012435","pimple saudagar"),
("hero bikes","02023235","pimple gurav"),
("hero cycles","02027435","Baner"),
("hero bikes","02033435","Aundh"),
("hero cycles","02012435","pimple nilakh"),
("hero bikes","02012435","Trimurti nagar"),
("hero cycles","020123435","camp");

SELECT * FROM stores;


## Table staff is created 

CREATE TABLE staffs (
	staff_id INT not null PRIMARY KEY,
	name VARCHAR (50) NOT NULL,
	phone VARCHAR (25),
	store_id INT NOT NULL,
	manager_id INT,
	FOREIGN KEY (store_id) REFERENCES stores (store_id)
);

##Data is inserted into staff where staff id,name related to store is mentioned.

INSERT INTO staffs(staff_id,name,phone,store_id,manager_id)
VALUES(1,"Sagar","NULL",1,1);
INSERT INTO staffs(staff_id,name,phone,store_id,manager_id)
VALUES(2,"Akash","9420187163",2,2),
(3,"Vikas","9420187343",3,3),
(4,"Vilas","9420184163",4,4),
(5,"vijay","9820187163",5,5),
(6,"vinaya","NULL",6,6),
(7,"Vijaya","NULL",7,7),
(8,"Kailash","9420347163",8,8),
(9,"Kavita","9812187163",9,9),
(10,"Manasi","9911871632",10,10);


SELECT * FROM staffs;

DROP  TABLE orders;

## create table orders

CREATE TABLE orders (
	order_id INT not null PRIMARY KEY,
	customer_id INT,
	order_date DATE NOT NULL,
	delivery_date DATE,
	store_id INT NOT NULL,
	staff_id INT NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
	FOREIGN KEY (store_id) REFERENCES stores (store_id),
	FOREIGN KEY (staff_id) REFERENCES staffs (staff_id)
 );   
 
 ##Data is inserted into orders where all information related to orders is mentioned
 
 INSERT INTO orders(order_id,customer_id,order_date,delivery_date,store_id,staff_id)
 VALUES
 (1,1,"2021-01-10",NULL,1,1),
 (2,2,"2021-01-17","2021-03-19",3,3),
 (3,3,"2021-03-13","2021-03-24",5,5),
 (4,5,"2021-04-24",NULL,6,6),
 (5,12,"2022-06-20","2022-06-25",8,8),
 (6,16,"2022-03-23","2022-03-30",10,10),
 (7,20,"2021-03-23","2021-03-30",9,9),
 (8,21,"2020-04-23","2020-04-30",9,9),
 (9,10,"2012-04-23","2012-04-30",6,6),
 (10,11,"2013-07-11",NULL,2,2),
 (11,18,"2014-05-17","2014-05-20",2,2),
 (12,4,"2014-05-16","2014-05-30",10,10),
 (13,12,"2012-03-23","2012-03-30",5,5),
 (14,22,"2022-02-12","2022-02-20",4,4),
 (15,16,"2022-03-23",NULL,10,10),
 (16,17,"2022-03-23",NULL,10,10),
 (17,6,"2020-12-23","2020-12-30",1,1),
 (18,7,"2020-12-13","2020-12-23",2,2),
 (19,8,"2014-05-23","2014-05-30",3,3),
 (20,13,"2012-12-23","2012-12-30",7,7);
 
SELECT * FROM orders; 

DROP  TABLE  stocks;

##Table stock is created 

CREATE TABLE stocks (
	store_id INT,
	product_id INT,
	quantity INT,
	PRIMARY KEY (store_id, product_id),
	FOREIGN KEY (store_id) REFERENCES stores (store_id),
	FOREIGN KEY (product_id) REFERENCES products (product_id)
);

## Data related to stock is entered like store_id,quantity

INSERT INTO stocks(store_id,product_id,quantity)
VALUES
(1,1,12),
(2,2,10),
(3,4,8),
(4,3,14),
(5,3,06),
(6,2,11),
(7,5,07),
(7,6,12),
(8,2,12),
(8,5,11),
(7,12,09),
(6,11,06),
(3,10,03),
(2,7,05),
(9,12,04),
(9,13,05),
(10,14,04),
(10,15,06),
(8,23,03),
(8,13,03),
(4,4,04),
(4,13,03),
(3,12,03),
(2,04,05),
(6,12,03),
(6,13,05),
(1,4,11),
(6,20,04),
(6,4,03),
(5,12,05),
(5,11,06);

SELECT * FROM stocks;


## some sample query 

#1) Name the customer who buy hero bikes in chakan area?
SELECT * FROM customers;
SELECT full_name FROM customers WHERE area="chakan";

#2) Name the customer whos mobile number starts with '94'?
SELECT full_name,phone
FROM customers WHERE phone LIKE '%94%';

#3)Name the product that buy from moshi area?
 SELECT p.product_name
 FROM products p
 INNER JOIN customers c ON c.prod_id=p.product_id;
 
 #4)Name product whose model_year after 2000?
 SELECT product_name
 WHERE model_year>2000;
 
#5)How many bikes does store id 1 have?who is working in that store?
SELECT quantity FROM stocks
WHERE store_id=1;
SELECT s.name FROM staffs s
INNER JOIN stores st ON s.store_id=st.store_id 
WHERE st.store_id=1;

#6)Find customer whos bike not yet deliveded
SELECT c.full_name,o.delivery_date
FROM customers c  LEFT JOIN
orders o 
ON c.customer_id=o.customer_id 
WHERE delivery_date IS NULL;