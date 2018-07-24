


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
   
 create table event_list(
 	Event_no number primary key,
 	user_no number,
 	Event_day date,
 	Apart_id number,
 	Event_check number,
 	FOREIGN KEY (user_no)     
  	REFERENCES Member (user_no),
  	FOREIGN KEY (Apart_id)     
  	REFERENCES APARTMENT (Apart_id)    
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
 
 create sequence event_win_no_seq;
 
 insert into event_win values(0,0,0,0);
 insert into event_win values(1,1,1,0);
 insert into event_win values(2,2,2,0);
 insert into event_win values(3,3,3,1);
 