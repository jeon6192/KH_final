

		


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



drop table expertBoard
select * from expertBoard


