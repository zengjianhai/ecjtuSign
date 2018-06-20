/*题目表*/
create table sign_examination_questions(
	/*类型_排序序号*/
	id nvarchar2(30) primary key,
	/*类型：选择，填空；比如：1对应选择*/
	types nvarchar2(30) not null,
	/*科目：语文，数学，高等数学，问卷调查；用枚举存储数据*/
	subject nvarchar2(20),
	/*题目内容*/
	question nvarchar2(2000) not null,
	answer nvarchar2(2000),
	/*创建时间*/
	create_time date not null,
	/*题目被选中记录*/
	change_record number(10),
	/*题目答对记录*/
	answer_record number(10),
	/*题目相对应的图片*/
	question_img nvarchar2(100),
	/*年级；比如：1对应一年级*/
	grade nvarchar2(20),
	/*扩展字段:多选*/
	extend nvarchar2(10),
	/*扩展字段:选择题的选项*/
	extend2 nvarchar2(500)
);


CREATE SEQUENCE questions_sequence
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
CACHE 10;

select *
from (
      select * 
      from sign_examination_questions
      where types=''
      order by dbms_random.value)
where rownum=1