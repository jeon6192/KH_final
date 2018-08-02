
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
 drop table event_list;
 
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
 
 drop table event_win;
 create sequence event_win_no_seq;
 
 select count(*) from event_list where complex_id='1';
 
 	select * from apt_complex
		where complex_apartname like '%ÀÚÀÌ%'
		
		