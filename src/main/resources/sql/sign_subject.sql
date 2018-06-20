create table sign_subject(
	suject_name varchar2(30) not null,
	CONSTRAINT sign_subject_name UNIQUE (suject_name) 
);
insert into sign_subject(suject_name) values('英语')
create table sign_question_types(
	type_name varchar2(30) not null,
	CONSTRAINT sign_subject_name UNIQUE (suject_name) 
);