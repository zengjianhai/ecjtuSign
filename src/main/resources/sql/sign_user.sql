/*用户表*/
create table sign_user(
	/*主键自动增长*/
	id number(6) primary key, 
	name varchar2(30) not null,
	sex varchar2(1) not null,
	birthday varchar2(10) not null,
	phone number(12) not null,
	password varchar2(16) not null,
	school varchar2(50),
	create_time date not null,
	CONSTRAINT sign_user_phone UNIQUE (phone) 
);

CREATE SEQUENCE user_sequence
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
CACHE 10;

create table sign_update_password(
	/*主键自动增长*/
	phone number(12) primary key, 
	name varchar2(30) not null,
	sex nvarchar(1) not null,
	birthday varchar2(10) not null,
	create_time date not null,
);