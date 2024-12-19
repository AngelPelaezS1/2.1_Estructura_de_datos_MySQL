create database pizzeria;
use pizzeria;

create table province(
province_id int not null auto_increment primary key,
province_name varchar(50) not null
);

create table locality(
locality_id int not null auto_increment primary key,
locality_name varchar(50) not null,
province_id int not null,
foreign key(province_id) references province(province_id)
);


create table costumer(
costumer_id int not null auto_increment primary key,
costumer_name varchar(50) not null,
costumer_lastnames varchar(50) not null,
costumer_address varchar(100) not null,
costumer_postalCode int not null,
locality_id int not null,
costumer_numberPhone varchar(15) not null,
foreign key(locality_id) references locality(locality_id)
);

create table category(
category_id int not null auto_increment primary key,
category_name varchar(50) not null
);

create table product(
product_id int not null auto_increment primary key,
product_name varchar(50) not null,
product_description varchar(50) not null,
product_photo varchar(150) not null,
product_price float(10,2) not null,
category_id int,
product_type enum('pizza', 'burger', 'drink') not null,
foreign key(category_id) references category(category_id)
);

create table store(
store_id int not null auto_increment primary key,
store_address varchar(100) not null,
store_postalCode int not null,
locality_id int not null,
foreign key(locality_id) references locality(locality_id)
);

create table employee(
employee_id int not null auto_increment primary key,
employee_name varchar(50) not null,
employee_lastName varchar(50) not null,
employee_NIF varchar(20) not null,
employee_numberPhone varchar(15) not null,
employee_position enum('delivery', 'chef'),
store_id int null,
foreign key(store_id) references store(store_id)
);

create table orders(
order_id int not null auto_increment primary key,
order_date datetime not null,
order_type enum('delivery', 'take away'),
product_quantity int not null,
price float(10,2) not null,
costumer_id int not null,
employee_id int,
store_id int not null,
foreign key(store_id) references store(store_id),
foreign key(costumer_id) references costumer(costumer_id),
foreign key(employee_id) references employee(employee_id)
);

create table order_details(
order_id int not null,
product_id int not null,
foreign key(order_id) references orders(order_id),
foreign key(product_id) references product(product_id)
);






