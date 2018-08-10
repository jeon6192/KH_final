

select * from ZIPCODE5



CREATE TABLE APT_COMPLEX(
   COMPLEX_ID NUMBER PRIMARY KEY,
   COMPLEX_ADDRESS VARCHAR2(300) NOT NULL,
   COMPLEX_LAT NUMBER NOT NULL,
   COMPLEX_LNG NUMBER NOT NULL,
   COMPLEX_APARTNAME VARCHAR2(50) NOT NULL,
   COMPLEX_PDATE DATE NOT NULL,
   COMPLEX_STATE NUMBER NOT NULL,
   COMPLEX_INFO VARCHAR2(1000),
   COMPLEX_SUBWAY NUMBER NOT NULL,
   COMPLEX_STATION VARCHAR2(30),
   COMPLEX_FOOT NUMBER
);

update apt_complex set complex_state = 2




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
   APART_INTERIOR VARCHAR2(1000))
   
   
   
   select * from apartment
   
select * from apt_complex





update apt_complex set complex_state = 1 where complex_subway = 1


insert into apt_complex 
		values(2,'����Ư���� ������ ������',24.5,22.5,'�켺����Ʈ',sysdate,1,'��������Ʈ �Դϴ�','1','���￪',15)
		insert into apt_complex 
		values(15,'����Ư���� ������ û�㵿',24.5,22.5,'�켺����Ʈ',sysdate,1,'��������Ʈ �Դϴ�','1','���￪',15)

		
		
		select * from 
(select rownum rnum, complex_address, complex_apartname, complex_pdate,
	complex_subway, complex_station, complex_foot,minarea, maxarea, minprice,maxprice,
	complex_lat,complex_lng
		from
		(select c.complex_address, c.complex_apartname, c.complex_pdate,
					c.complex_subway, c.complex_station, c.complex_foot,
						min(a.apart_area) minarea ,max(a.apart_area) maxarea,
						min(a.apart_price) minprice ,max(a.apart_price) maxprice
						,c.complex_lat,c.complex_lng
			 from apt_complex c, apartment a
			where c.complex_id = a.complex_id and 
				c.complex_address like '%서울 중구%' 
			group by c.complex_address, c.complex_apartname, c.complex_pdate,
					c.complex_subway, c.complex_station, c.complex_foot
					,c.complex_lat,c.complex_lng
				order by maxprice desc))
				where rnum >= 1 and rnum <= 10
/


delete from apt_complex where complex_id = 180731571








			select c.complex_id, c.complex_apartname, max(a.apart_area) maxarea , min(a.apart_price) minprice
					  from apt_complex c, apartment a where c.complex_id = a.complex_id
					  and a.apart_id = (select max(apart_id) from apartment)
					  group by c.complex_apartname, c.complex_id


