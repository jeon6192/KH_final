drop table member


create table Member(
   id   varchar2(30) not null,
   user_no Number primary key, 
   password varchar2(30) not null,
   name varchar2(30) not null,
   address varchar2(200) not null,
   tel Number not null,
   idNumber Number not null,
   homelessTerm Number not null,
   familySize Number not null,
   age Number not null,
   score Number not null
   );
   
   insert into Member values('a123', 0, '1234', '이름0' , '주소0', 0000000,0,0,0,20,30);
   insert into Member values('b123', 1, '1234', '이름1' , '주소1', 0012310,0,0,0,30,34);
   insert into Member values('c123', 2, '1234', '이름2' , '주소2', 0002200,0,0,0,40,40);
   insert into Member values('d123', 3, '1234', '이름3' , '주소3', 0033300,0,0,0,50,50);
   insert into Member values('e123', 4, '1234', '이름4' , '주소4', 0044400,0,0,0,60,60);
   insert into Member values('f123', 5, '1234', '이름5' , '주소5', 00055500,0,0,0,22,70);
   insert into Member values('g123', 6, '1234', '이름6' , '주소6', 0000660,0,0,0,25,80);
   insert into Member values('h123', 7, '1234', '이름7' , '주소7', 000770,0,0,0,32,32);
   insert into Member values('i123', 8, '1234', '이름8' , '주소8', 0008800,0,0,0,35,10);
   insert into Member values('j123', 9, '1234', '이름9' , '주소9', 0009900,0,0,0,36,30);
   insert into Member values('k123', 10, '1234', '이름10' , '주소10', 00100000,0,0,0,51,10);
   insert into Member values('l123', 11, '1234', '이름11' , '주소11', 000110110,0,0,0,22,20);
   
   
 create table event_list(
 	Event_no number primary key,
 	user_no number,
 	Event_day date,
 	complex_id number,
 	Event_check number,
 	FOREIGN KEY (user_no)     
  	REFERENCES Member (user_no),
  	FOREIGN KEY (complex_id)     
  	REFERENCES apt_complex (complex_id)    
 );
 
 create sequence event_no_seq;
 
 create table event_win(
 	Event_win_no number primary key,
 	user_no number,
 	Apart_id number,
 	event_con number,
 	FOREIGN KEY (user_no)     
  	REFERENCES Member (user_no),
  	FOREIGN KEY (Apart_id)     
  	REFERENCES APARTMENT (Apart_id)
 );
 
 
 
 select * from event_win natural join apartment where user_no=0;
 
 
  select event_win_no, ew.user_no, apt.apart_id, event_con, complex_id,apart_dong, apart_ho from event_win ew , apartment apt
 		 where ew.apart_id=apt.apart_id and ew.user_no=17 and (event_con=0 or event_con=1)
 		 
 create sequence event_win_no_seq;
 
 insert into event_win values(0,0,0,0);
 insert into event_win values(1,0,1,0);
  insert into event_win values(2,0,2,0);
   insert into event_win values(3,0,3,0);
    insert into event_win values(4,0,4,0);
     insert into event_win values(5,0,5,0);
      insert into event_win values(6,0,6,0);
      insert into event_win values(7,0,7,0);
 insert into event_win values(8,0,8,0);
  insert into event_win values(9,0,9,0);
   insert into event_win values(10,0,10,0);
    insert into event_win values(11,0,11,0);
     insert into event_win values(12,0,12,0);
      insert into event_win values(13,0,13,0);
   insert into event_win values(14,0,14,0);
    insert into event_win values(15,0,15,0);
     insert into event_win values(16,0,16,0);
      insert into event_win values(17,0,17,0);
       insert into event_win values(18,0,18,0);
        insert into event_win values(19,0,19,0);
       insert into event_win values(20,0,20,0);
 
 select * from event_win;
 drop table event_win;
 select * from member;
 select * from event_win;
 delete from event_win where apart_id=2388;
 select event_win_no_seq.nextval from dual;