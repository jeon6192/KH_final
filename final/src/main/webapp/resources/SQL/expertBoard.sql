

		


--전문가 게시판
create table expertBoard(
		eb_num number primary key,				-- 글넘버
		eb_source varchar2(50) not null, 		-- 출처
		eb_subject varchar2(50) not null,		-- 제목
		eb_content varchar2(3000) not null,		-- 내용
		eb_readcount number,					-- 조회수
		eb_date date,							-- 등록일
		eb_file varchar2(1000)
)



select * from expertBoard



select * from
(select rownum rnum, eb_num, eb_source, eb_subject, eb_content, eb_readcount, eb_date, eb_file
from
(select * from expertBoard order by eb_num))
where rnum >= 1 and rnum <= 10
