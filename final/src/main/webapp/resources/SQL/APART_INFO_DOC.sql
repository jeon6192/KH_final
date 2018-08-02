create table APART_INFO_DOC(
	INFO_DOC_NUM number(10) primary key,
	Admin_no number(30) ,
	INFO_DOC_SUB varchar2(100) not null,
	INFO_DOC_DATE DATE not null,
	INFO_DOC_FILE varchar2(100) ,
	INFO_DOC_ORIGINAL varchar2(100)
);


create sequence INFO_DOC_num_seq
increment by 1
start with 1
nocache;

drop sequence INFO_DOC_num_seq;
desc APART_INFO_DOC;

select * from(select rownum rnum, INFO_DOC_NUM, Admin_no,  INFO_DOC_SUB, INFO_DOC_DATE, INFO_DOC_FILE, INFO_DOC_ORIGINAL
 from APART_INFO_DOC order by INFO_DOC_DATE desc)
	
select * from APART_INFO_DOC;

drop table APART_INFO_DOC;

