--1
create table employee2(

employee_id SERIAL primary key,
department VARCHAR(100),
title VARCHAR(100),
first_name VARCHAR(100),
last_name VARCHAR(100)

);

--2
CREATE TABLE customer2 (
  customer_id SERIAL primary key,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  address VARCHAR(150),
  billing  VARCHAR(150)
 
);

--3
create table make3( 

make_id SERIAL primary key,
make_name VARCHAR(50),
make_model VARCHAR(50),
make_year integer

);
--4
create table car (
car_id SERIAL primary key,
vin numeric(20),
color VARCHAR(10),
make_id INTEGER not null,
foreign key (make_id) references make3(make_id)

);

--5
CREATE TABLE invoice2 (
  invoice_id SERIAL primary key,
  amount NUMERIC(10,2),
  invoice_date VARCHAR(10),
  customer_id INTEGER not null,
  foreign key(customer_id) references customer2(customer_id),
  employee_id INTEGER not null,
  foreign key(employee_id) references employee2(employee_id),
  car_id INTEGER not null,
  foreign key(car_id) references car(car_id)
  
);

--6
create table inventory2 (

inventory_id SERIAL primary key,
make_id INTEGER not null,
foreign key(make_id) references make3(make_id),
amount INTEGER

);

--7

create table sales (

sales_id SERIAL primary key,
date_ VARCHAR(10),
amount NUMERIC(10,2),
employee_id INTEGER not null,
foreign key(employee_id) references employee(employee_id),
invoice_id INTEGER not null,
foreign key( invoice_id) references invoice2(invoice_id)

);

--8

create table service(

service_id SERIAL primary key,
date_ VARCHAR(10),
car_id INTEGER not null,
foreign key(car_id) references car(car_id),
customer_id INTEGER not null,
foreign key(customer_id) references customer2(customer_id)

);

--9

create table parts (

part_id SERIAL primary key,
name_ VARCHAR(100)

);

