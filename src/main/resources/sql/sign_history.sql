/*历史记录表*/
create table sign_history(
	id nvarchar2(30) primary key,
	test_name nvarchar2(50) not null,
	subject nvarchar2(20),
	create_time date not null,
	grade nvarchar2(20),
	user_name nvarchar2(50) not null,
	titles nvarchar2(1000),
	score number(3),
	titles_score nvarchar2(1000)
);

CREATE SEQUENCE history_sequence
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
CACHE 10;