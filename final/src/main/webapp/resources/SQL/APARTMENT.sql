drop table apartment cascade constraint

CREATE TABLE APARTMENT(
	APART_ID NUMBER PRIMARY KEY,
	COMPLEX_ID NUMBER REFERENCES APT_COMPLEX(COMPLEX_ID),
	APART_DONG NUMBER NOT NULL,
	APART_HO NUMBER NOT NULL,
	APART_FLOOR NUMBER NOT NULL,
	APART_AREA NUMBER NOT NULL,
	APART_PRICE NUMBER NOT NULL,
	APART_ROOM NUMBER NOT NULL,
	APART_TOILET NUMBER NOT NULL,
	APART_DIRECTION VARCHAR2(50) NOT NULL, 
	APART_INTERIOR VARCHAR2(1000), 
	user_no NUMBER REFERENCES Member(user_no)
)

select * from event_win
select * from apartment;

select event_win_no, ew.user_no, apt.apart_id, event_con, complex_id,apart_dong, apart_ho from event_win ew , apartment apt
 		 where ew.apart_id=apt.apart_id and ew.user_no=2 and event_con=0
 		 

delete from apartment
delete from apt_complex

drop sequence apart_seq
ALTER TABLE apartment ADD FOREIGN KEY (user_no) REFERENCES member (user_no);

alter table apartment add(user_no number);
create sequence apart_seq
	start with 1
	increment by 1
	nomaxvalue

create or replace
FUNCTION get_apart_seq RETURN NUMBER AS 
num NUMBER;
BEGIN
  SELECT apart_seq.nextval 
  INTO num 
  FROM dual;  
  return num;  
END get_apart_seq;


   
   select complex_id, apart_dong, apart_floor, apart_area,  
			apart_room, apart_toilet, apart_direction, apart_interior, 
			min(apart_price) minprice, max(apart_price) maxprice
		from apartment
		where complex_id = 190730463 and apart_dong = 101
		group by complex_id, apart_dong, apart_floor, apart_area, 
			apart_room, apart_toilet, apart_direction, apart_interior

select * from apt_complex
select * from APARTMENT
select count(*) from apartment where complex_id = 190711945
select min(apart_price), max(apart_price) from apartment where complex_id = 190711945
select min(apart_area), max(apart_area) from apartment where complex_id = 190711945
select avg(apart_area), avg(apart_area) from apartment where complex_id = 190711945

select complex_id, count(*) from apartment group by(complex_id)


select * from APT_COMPLEX where complex_id=190731596

select * from apartment 
	where complex_id = (
	select complex_id from apt_complex 
		where complex_apartname = '123')

		
delete from APARTMENT


select complex_id, apart_dong, apart_floor, apart_area,  
	apart_room, apart_toilet, apart_interior, min(apart_price) minprice, max(apart_price) maxprice
from apartment
where complex_id = 190816691 and apart_dong = 501
group by complex_id, apart_dong, apart_floor, apart_area, 
	apart_room, apart_toilet, apart_interior
	
	
update apartment set apart_interior = ''
	
	
	
select * from 
	(select rownum rnum, complex_address, complex_apartname, complex_pdate,
	complex_subway, complex_station, complex_foot,minarea, maxarea, minprice,maxprice
		from
		(select c.complex_address, c.complex_apartname, c.complex_pdate,
					c.complex_subway, c.complex_station, c.complex_foot,
						min(a.apart_area) minarea ,max(a.apart_area) maxarea,
						min(a.apart_price) minprice ,max(a.apart_price) maxprice
			 from apt_complex c, apartment a
			where c.complex_id = a.complex_id and 
				c.complex_address like #{addr} 
			group by c.complex_address, c.complex_apartname, c.complex_pdate,
					c.complex_subway, c.complex_station, c.complex_foot
				order by ${sort}))
				where rnum &gt; = #{start} and rnum &lt; = #{end}
			

select c.complex_id, c.complex_address, c.complex_lat, c.complex_lng, c.complex_apartname, 
	c.complex_sdate, c.complex_edate, c.complex_pdate, c.complex_state, c.complex_info, 
	c.complex_subway, c.complex_station, c.complex_foot, min(a.apart_area) minarea, 
	max(a.apart_area) maxarea, min(a.apart_price) minprice, max(a.apart_price) maxprice 
from apt_complex c, apartment a 
where c.complex_id = 190730463
group by c.complex_id, c.complex_address, c.complex_lat, c.complex_lng, c.complex_apartname, 
	c.complex_sdate, c.complex_edate, c.complex_pdate, c.complex_state, c.complex_info, 
	c.complex_subway, c.complex_station, c.complex_foot
	
	
select max(apart_price) from apartment where complex_id = 190730463;

select c.complex_id, c.complex_address, c.complex_lat, c.complex_lng, c.complex_apartname, 
	c.complex_sdate, c.complex_edate, c.complex_pdate, c.complex_state, c.complex_info, 
	c.complex_subway, c.complex_station, c.complex_foot, min(a.apart_area) minarea, 
	max(a.apart_area) maxarea, min(a.apart_price) minprice, max(a.apart_price) maxprice 
from apt_complex c, apartment a 
where c.complex_id = a.complex_id
	and c.complex_lat between 37.56372654226325 and 126.95345796660939
	and c.complex_lng between 37.58751721463506 and 127.0335136809066
group by c.complex_id, c.complex_address, c.complex_lat, c.complex_lng, c.complex_apartname, 
	c.complex_sdate, c.complex_edate, c.complex_pdate, c.complex_state, c.complex_info, 
	c.complex_subway, c.complex_station, c.complex_foot