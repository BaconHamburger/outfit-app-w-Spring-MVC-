create database outfit;

show databases;

use outfit;

create table users(
	id int not null auto_increment,
    username varchar(50),
    passwords varchar(50),
    display_name varchar(50),
    primary key (id)
);

select * from users;

insert into users(username, passwords, display_name)
values
("barbie99", "123abc", "Dolly"),
("epicmoose", "mouse49$", "Lucy");
