insert into employee2(

employee_id,
department,
title,
first_name,
last_name

)values
(578654,'Sales','Sales Representative','Katheline','Campos'),
(4,'Sales','Sales Shift Supervisor','Anacaona','Campos'),
(302263,'Maintenance','Mechanic Level 2','Alberto','Campos'),
(267988,'Maintenance','Mechanic Level 1','Rodolfo','Campos'),
(1,'sales','Sales Representative','Abraham','Campos');


insert into customer2(

  customer_id,
  first_name,
  last_name,
  address,
  billing
  
)values

(1,'Zhe','Wang','1045 FIU DR','4242-4242-4242-623 03/23'),
(2,'Leo','Rodriguez','1099 West St','4343-4343-433 02/23'),
(3,'James','Rodriguez','1099 South St','5555-4343-433 10/23'),
(4,'Brian','Smith','1099 West St','4343-5555-444 02/24'),
(5,'Lalo','Perez','1099 W 52nd St','5543-5555-444 02/24');


insert into make3(

make_id,
make_name,
make_model,
make_year

)values 
(5,'Bugatti','Tourbillon','2026');
(1,'Toyota','Corolla','2022'),
(2,'Toyota','Corolla','2020'),
(3,'Toyota','Camry','2024'),
(4,'Lamborghini','Reventon','2023');

insert into car(

car_id,
vin,
color,
make_id

)values

(1,123123123,'Blue',1),
(2,122133123,'Gray',1),
(3,55555555,'Black',2),
(4,585575656,'Black',2),
(5,584377886,'Red',5),
(6,984366886,'Red',3);


insert  into invoice2(

  invoice_id,
  amount,
  invoice_date,
  customer_id,
  employee_id,
  car_id
  
  ) values
(1,53450.10,'05/10/23',4,3,1),
(2,53450.10,'05/10/23',2,4,1),
(3,100450.10,'05/10/23',5,4,4),
(4,100450.10,'05/10/23',3,2,1),
(5,250450.10,'05/10/23',1,1,5);


insert into inventory2(

inventory_id,
make_id,
amount


)values
(1,2,30),
(2,3,10),
(3,5,5),
(4,1,20),
(5,4,11);


insert into sales(

sales_id,
date_,
amount,
employee_id,
invoice_id


) values 
(1,'04/23/2024',4,3,5),
(2,'04/24/2024',3,2,1),
(3,'04/24/2024',5,5,2),
(4,'04/26/2024',5,1,3),
(5,'04/26/2024',3,3,5);

insert into service (

service_id,
date_,
car_id,
customer_id

) values

(1,'10/22/2023',1,2),
(2,'10/31/2023',2,5),
(3,'11/01/2023',4,3),
(4,'11/01/2023',3,1),
(5,'11/01/2023',5,4);

insert into parts (

part_id,
name_

) values

(1,'Rear-view mirror'),
(2,'Tires'),
(3,'Muffler'),
(4,'Gas Tank'),
(5,'Pistons');


---- The Following Queries represent some of the Procedures I wrote.

-- DATA INSERTION WITH PROCEDURES.


--- I use This function to add NEW employee to the employee table 
create or replace function add_employee(_new_id INTEGER, _department VARCHAR, _title VARCHAR,
_first_name VARCHAR,_last_name VARCHAR)
returns VOID 

as $MAIN$
begin insert into team_members(employee_id,department,title,first_name,last_name)
values (_new_id,_department,_title,_first_name,_last_name);

end;
$MAIN$
language plpgsql;

select *from employee2 ;
select add_employee(6,'Sales','Sales Rep','John','Doe');
select add_employee(7,'Service','Mechanic','Daddy','Yankee');


--- I can also write a statement to delete the function when no longer needed.

drop function add_employee ;

----- This Next Function is used to update the car_make table--

select * from car_make;

create or replace function add_car_maker(_make_id INTEGER, _make_name VARCHAR, _make_model VARCHAR,_make_year INTEGER)
returns void 
as $MAIN$
begin 
	insert into car_make(make_id, make_name, make_model,make_year)
	VALUES(_make_id,_make_name,_make_model,_make_year);
end;
$MAIN$
language plpgsql;

--Call the function--

select add_car_maker(6,'Bugatti','Chiron',2019);
select * from car_make ;


drop function add_car_maker ;


--- Function to drop an employee who is no longer employed
select * from team_members;

create or replace function drop_employee(_employee_id INTEGER)
returns void
as $MAIN$
begin 
	delete from team_members where employee_id = _employee_id;
end;
$MAIN$
language plpgsql;

-- Run function and verify works.

select drop_employee(7);
select * from team_members;

