create table APART_INFO_POLICY(
	INFO_POLICY_NUM number(10) primary key,
	Admin_no number(30) not null,
	INFO_POLICY_SUB varchar2(100) not null,
	INFO_POLICY_VISIT varchar2(10) not null,
	INFO_POLICY_DATE date not null,
	INFO_POLICY_FILE varchar2(100),
	INFO_POLICY_CONT varchar2(500) not null,
	INFO_POLICY_ORIGINAL varchar2(100) 
);

create sequence INFO_POLICY_num_seq
increment by 1
start with 1
nocache;

drop sequence INFO_POLICY_num_seq;

desc APART_INFO_POLICY;

select * from APART_INFO_POLICY;

drop table APART_INFO_POLICY;

