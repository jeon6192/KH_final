drop table apt_complex cascade constraint

CREATE TABLE APT_COMPLEX(
	COMPLEX_ID NUMBER PRIMARY KEY,
	COMPLEX_ADDRESS VARCHAR2(300) NOT NULL,
	COMPLEX_LAT NUMBER NOT NULL,
	COMPLEX_LNG NUMBER NOT NULL,
	COMPLEX_APARTNAME VARCHAR2(50) NOT NULL,
	COMPLEX_SDATE DATE NOT NULL,
	COMPLEX_EDATE DATE NOT NULL,
	COMPLEX_PDATE DATE NOT NULL,
	COMPLEX_STATE NUMBER NOT NULL,
	COMPLEX_INFO VARCHAR2(1000),
	COMPLEX_SUBWAY NUMBER NOT NULL,
	COMPLEX_STATION VARCHAR2(30),
	COMPLEX_FOOT NUMBER
);

select * from APT_COMPLEX


delete from APT_COMPLEX

select count(*) from APARTMENT where complex_id = 19072520;

update apt_complex set complex_info = '1234' where complex_id = 190730463



select c.complex_id, c.complex_address, c.complex_lat, c.complex_lng, c.complex_apartname, 
	c.complex_sdate, c.complex_edate, c.complex_pdate, c.complex_state, c.complex_info, 
	c.complex_subway, c.complex_station, c.complex_foot, min(a.apart_area) minarea, 
	max(a.apart_area) maxarea, min(a.apart_price) minprice, max(a.apart_price) minprice, count(a.apart_area) cnt
from apt_complex c, apartment a 
where c.complex_id = a.complex_id
	and c.complex_lat between 37.564419258914214 and 126.98306723531553
	and c.complex_lng between 37.57631185331255 and 127.02037688702883
	and c.complex_id != 1
	and c.complex_state = 0
group by c.complex_id, c.complex_address, c.complex_lat, c.complex_lng, c.complex_apartname, 
	c.complex_sdate, c.complex_edate, c.complex_pdate, c.complex_state, c.complex_info, 
	c.complex_subway, c.complex_station, c.complex_foot
			
	
select distinct(c.complex_id) from apt_complex c, apartment a where c.complex_id = a.complex_id

alter table apartment add(
	user_no NUMBER REFERENCES Member(user_no)
);

update apartment set user_no = NULL

select * from apartment where complex_id = 190730463