-- 게시판 종류
CREATE TABLE board1 (
    boardcd varchar2(20),
    boardnm varchar2(40) NOT NULL,
    CONSTRAINT PK_BOARD PRIMARY KEY(boardcd)
);

-- 게시글
CREATE TABLE article (
    articleno NUMBER PRIMARY KEY,
    id  varchar2(30),
    boardcd varchar2(20),
    title varchar2(200) NOT NULL,
    content CLOB,
    hit NUMBER,
    regdate DATE,
     CONSTRAINT id_CONS foreign key (id) references member(id)
);

select * from board1;
select * from ARTICLE;

drop table article;
drop table board1;
-- 게시글 번호 생성기
CREATE SEQUENCE SEQ_ARTICLE
INCREMENT BY 1
START WITH 1;

drop sequence seq_article;
 
--게시판 데이터 입력
INSERT INTO board1 VALUES ('free','자유게시판');
INSERT INTO board1 VALUES ('qna','QnA게시판');
INSERT INTO board1 VALUES ('data','자료실');

insert into article values(seq_article.nextval, NULL, 'test1', 'it''s test1', 'email1', 0, sysdate);
insert into article values(seq_article.nextval, NULL, 'test2', 'it''s \*test2', 'email2', 0, sysdate);
insert into article values(seq_article.nextval, NULL, 'test2', 'it''s \$test3', 'email3', 0, sysdate);
 
-- 첨부파일 
create table attachfile (
 attachfileno number,
 filename varchar2(50),
 filetype varchar2(30),
 filesize number,
 articleno number,
 constraint PK_ATTACHFILE PRIMARY KEY(attachfileno)
);

drop table attachfile;
-- 첨부파일 번호 생성기
create sequence SEQ_ATTACHFILE
increment by 1
start with 1;

drop sequence SEQ_ATTACHFILE;
commit

-- 덧글
create table comments(
  commentno number,
  articleno number,
  Admin_no NUMBER,
  memo varchar2(4000),
  regdate date,
  constraint PK_COMMENTS PRIMARY KEY(commentno),
  CONSTRAINT Admin_no foreign key (Admin_no) references Admin(Admin_no)
);

drop table comments
-- 덧글 번호 생성기
create sequence SEQ_COMMENTS
  increment by 1
  start with 1;
  
drop sequence comments

select * from comments

SELECT * FROM article  where rownum <= 5 order by hit desc

SELECT * FROM (select * from article order by hit desc) 
where rownum <= 5