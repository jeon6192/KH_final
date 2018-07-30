drop table member

create table Member(
	id	varchar2(30) unique,
	user_no Number primary key, 
	password varchar2(30) not null,
	name varchar2(30) not null,
	postcode varchar2(30) not null,
	address1 varchar2(200) not null,
	address2 varchar2(200) not null,
	address3 varchar2(200) not null,
	tel varchar2(100) not null,
	idNumber1 Number not null,
	idNumber2 Number not null,
	homelessTerm Number not null,
	familySize Number not null,
	age Number not null,
	score Number not null,
	state Number not null /*����ȸ�� 1, Ż��ȸ�� 2 */
    
	);

create sequence member_user_no_seq 
increment by 1 start with 1 nocache;	
	
drop sequence member_user_no_seq;	


create table Admin(
	Admin_no Number primary key,
	Admin_id varchar2(20) not null,
	Admin_pwd varchar2(20) not null,
	Admin_name varchar2(10) not null
	
);

create sequence Admin_no_seq;
select*from Admin;
delete from member where user_no=28;
drop table Admin;

select * from member;
select * from member where id = 'duswn3844';

drop table Member;

select count(*) from admin
			where admin_id='admin';
	