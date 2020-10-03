drop database if exists furama;
create database furama;

use furama;

create table `position` (
	position_id int primary key auto_increment,
    position_name varchar(45)
);

insert into `position` (position_name)
values
	('Receptionist'),
	('Serve'),
	('Expert'),
	('Monitoring'),
	('Manage'),
	('Manager');

create table education_degree (
	education_degree_id int primary key auto_increment,
    education_degree_name varchar (45)
);

insert into education_degree (education_degree_name)
values
	('Intermediate'),
	('College'),
	('University'),
	('After University');

create table division (
	division_id int primary key auto_increment,
    division_name varchar (45)
);

insert into division (division_name)
values
	('Sale – Marketing'),
	('Administration'),
	('Serve'),
	('Manage');

create table customer_type (
	customer_type_id int primary key auto_increment,
    customer_type_name varchar (45)
);

insert into customer_type (customer_type_name)
values
	('Diamond'),
	('Platinium'),
	('Gold'),
	('Silver'),
	('Member');

create table rent_type (
	rent_type_id int primary key auto_increment,
    rent_type_name varchar (45),
    rent_type_cost double
);

insert into rent_type (rent_type_name)
values
	('Full day'),
	('Full Week'),
	('Full month');

create table service_type (
	service_type_id int primary key auto_increment,
    service_type_name varchar (45)
);

insert into service_type (service_type_name)
values
	('Villa'),
	('House'),
	('Room');

create table attach_service (
	attach_service_id int primary key auto_increment,
    attach_service_name varchar(45),
    attach_service_cost double,
    attach_service_unit int,
    attach_service_status varchar(45)
);

create table `role` (
	role_id int primary key auto_increment,
    role_name varchar(255)
);

insert into `role` (role_name)
values
	('Manager'),
	('Employee');


create table `user` (
	user_name varchar(255) primary key,
    `password` varchar(255)
);

insert into `user` (user_name, `password`)
values
	('Admin', 'ok'),
	('Client', 'notok');

create table user_role (
	role_id int,
    user_name varchar(255)
);

create table customer (
	customer_id varchar(25) primary key,
    customer_name varchar(45),
    customer_birthday date,
    customer_gender varchar(45),
    customer_id_card varchar(45),
    customer_phone varchar(45),
    customer_email varchar(45),
    customer_address varchar(45),
    
    customer_type_id int,
    foreign key (customer_type_id) references customer_type(customer_type_id)
);

insert into customer (customer_id, customer_name, customer_birthday, customer_gender, customer_email, customer_address)
values
	('KH-6789', 'Chau Luong', '1995-05-27', 'Male', 'chauluong@codegym.com', 'Quang Nam'),
	('KH-0515', 'Mai Ho', '1995-05-15', 'Female', 'maiho@codegym.com', 'Da Nang'),
	('KH-0202', 'Lanh Nguyen', '1997-02-02', 'Male', 'lanhnguyen@codegym.com', 'Da Nang'),
	('KH-0606', 'Din Luong', '1996-06-06', 'Male', 'dinluong@codegym.com', 'Quang Ngai'),
	('KH-0902', 'Khanh Nguyen', '1994-09-02', 'Male', 'khanh@codegym.com', 'Da Nang'),
	('KH-0707', 'Vu Nguyen', '1997-07-07', 'Male', 'vunguyen@codegym.com', 'Ha Tinh');

create table service (
	service_id varchar(25) primary key,
    service_name varchar(45),
    service_area int,
    service_cost double,
    service_max_people int,
    standard_room varchar(45),
    description_other_convenience varchar(45),
    pool_area double,
    number_of_floors int,
    
    rent_type_id int,
    foreign key (rent_type_id) references rent_type(rent_type_id),
    
    service_type_id int,
    foreign key (service_type_id) references service_type(service_type_id)
);

create table employee (
	employee_id int primary key auto_increment,
    employee_name varchar(45),
    employee_birthday date,
    employee_id_card varchar(45),
    employee_salary double,
    employee_phone varchar(45),
    employee_email varchar(45),
    employee_address varchar(45),
    
    position_id int,
    foreign key(position_id) references `position`(position_id),
    
    education_degree_id int,
    foreign key(education_degree_id) references education_degree(education_degree_id),
    
    division_id int,
    foreign key(division_id) references division(division_id),
    
    user_name varchar(255),
    foreign key(user_name) references `user`(user_name)
);

create table contract (
	contract_id int primary key auto_increment,
    contract_start_date datetime,
    contract_end_date datetime,
    contract_deposite double,
    contract_total_money double,
    
    employee_id int,
    foreign key(employee_id) references employee(employee_id),
    
    customer_id varchar(25),
    constraint fk_customer foreign key(customer_id) references customer(customer_id),
    
    service_id varchar(25),
    constraint fk_service foreign key(service_id) references service(service_id)
);

create table contract_detail (
	contract_detail_id int primary key auto_increment,
    quantity int,
    
    contract_id int,
    constraint fk_contract foreign key(contract_id) references contract(contract_id),
    
    attach_service_id int,
    foreign key(attach_service_id) references attach_service(attach_service_id)
);

alter table contract
drop foreign key fk_customer;
 
alter table contract
add constraint fk_customer foreign key(customer_id) references customer(customer_id) on delete cascade
on update cascade;

alter table contract
drop foreign key fk_service;
 
alter table contract
add constraint fk_service foreign key(service_id) references service(service_id) on delete cascade
on update cascade;
 
alter table contract_detail
drop foreign key fk_contract;
 
alter table contract_detail
add constraint fk_contract foreign key(contract_id) references contract(contract_id) on delete cascade
on update cascade;

DELIMITER //
CREATE PROCEDURE find_customer_by_id(id_need_find varchar(25))
BEGIN
	select *
    from customer
    where customer_id = id_need_find;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE delete_customer(id_need_delete varchar(25))
BEGIN
	delete from customer
    where customer_id = id_need_delete;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE update_customer(id_need_update varchar(25), name_need_update varchar(45), birthday_need_update date, gender_need_update varchar(45), 
id_card_need_update varchar(45), phone_need_update varchar(45), email_need_update varchar(45), address_need_update varchar(45), type_id_need_update int)
BEGIN
	update customer
    set customer_name = name_need_update, customer_email = email_need_update, customer_birthday = birthday_need_update, customer_gender = gender_need_update,
    customer_id_card = id_card_need_update,
    customer_phone = phone_need_update, customer_email = email_need_update, customer_address = address_need_update, customer_type_id = type_id_need_update
    where customer_id = id_need_update;
END //
DELIMITER ;