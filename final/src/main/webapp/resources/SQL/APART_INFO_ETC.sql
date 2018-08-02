create table APART_INFO_ETC(
	INFO_ETC_NUM number(10) primary key,
	Admin_no number(30) ,
	INFO_ETC_SUB varchar2(100) not null,
	INFO_ETC_VISIT varchar2(10) not null,
	INFO_ETC_DATE date not null,
	INFO_ETC_FILE varchar2(100),
	INFO_ETC_CONT varchar2(500) not null,
	INFO_ETC_ORIGINAL varchar2(100)
);


select  INFO_ETC_NUM, INFO_ETC_SUB 
from (
   	select rownum rnum,INFO_ETC_NUM,Admin_no,INFO_ETC_SUB,INFO_ETC_VISIT,INFO_ETC_DATE,INFO_ETC_FILE,INFO_ETC_CONT,INFO_ETC_ORIGINAL
   	from
   		(select INFO_ETC_NUM,Admin_no,INFO_ETC_SUB,INFO_ETC_VISIT,INFO_ETC_DATE,INFO_ETC_FILE,INFO_ETC_CONT,INFO_ETC_ORIGINAL
   		from
   			APART_INFO_ETC order by INFO_ETC_DATE desc
   		)
   		)
where rnum=2  or rnum=0


-- 상세보기 글의 rnum 구하기
select rnum, INFO_ETC_NUM,Admin_no,INFO_ETC_SUB
from ( 
        select rownum rnum,INFO_ETC_NUM,Admin_no,INFO_ETC_SUB,INFO_ETC_VISIT,INFO_ETC_DATE,INFO_ETC_FILE,INFO_ETC_CONT,INFO_ETC_ORIGINAL
        from (select INFO_ETC_NUM,Admin_no,INFO_ETC_SUB,INFO_ETC_VISIT,INFO_ETC_DATE,INFO_ETC_FILE,
               INFO_ETC_CONT,INFO_ETC_ORIGINAL 
              from APART_INFO_ETC order by INFO_ETC_DATE desc )
         ) 
where INFO_ETC_NUM = 26

--rnum을 기준으로 +1, -1 기타정보글의 번호, 제목
select INFO_ETC_NUM, INFO_ETC_SUB
from (
        select rownum rnum,INFO_ETC_NUM,Admin_no,INFO_ETC_SUB,INFO_ETC_VISIT,INFO_ETC_DATE,INFO_ETC_FILE,INFO_ETC_CONT,INFO_ETC_ORIGINAL
        from (select INFO_ETC_NUM,Admin_no,INFO_ETC_SUB,INFO_ETC_VISIT,INFO_ETC_DATE,INFO_ETC_FILE,
               INFO_ETC_CONT,INFO_ETC_ORIGINAL 
              from APART_INFO_ETC order by INFO_ETC_DATE desc )
         ) 
)

create sequence INFO_ETC_num_seq
increment by 1
start with 1
nocache;

drop sequence INFO_ETC_num_seq;

desc APART_INFO_ETC;

select * from APART_INFO_ETC;

drop table APART_INFO_ETC;



   	
   	select * from (
   	select rownum rnum,INFO_ETC_NUM,Admin_no,INFO_ETC_SUB,INFO_ETC_VISIT,INFO_ETC_DATE,INFO_ETC_FILE,INFO_ETC_CONT,INFO_ETC_ORIGINAL
   	from
   		(select rownum rnum,INFO_ETC_NUM,Admin_no,INFO_ETC_SUB,INFO_ETC_VISIT,INFO_ETC_DATE,INFO_ETC_FILE,INFO_ETC_CONT,INFO_ETC_ORIGINAL
   		from
   			APART_INFO_ETC order by INFO_ETC_DATE desc
   		))
   	where rnum >= 1 and rnum <= 5

