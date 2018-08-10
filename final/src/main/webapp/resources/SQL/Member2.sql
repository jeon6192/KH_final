CREATE TABLE APT_COMPLEX(
   COMPLEX_ID NUMBER PRIMARY KEY,
   COMPLEX_ADDRESS VARCHAR2(300) NOT NULL,
   COMPLEX_LAT NUMBER NOT NULL,
   COMPLEX_LNG NUMBER NOT NULL,
   COMPLEX_APARTNAME VARCHAR2(50) NOT NULL,
   COMPLEX_EDATE DATE NOT NULL,
   COMPLEX_SDATE DATE NOT NULL,
   COMPLEX_PDATE DATE NOT NULL,
   COMPLEX_STATE NUMBER NOT NULL,
   COMPLEX_INFO VARCHAR2(1000),
   COMPLEX_SUBWAY NUMBER NOT NULL,
   COMPLEX_STATION VARCHAR2(30),
   COMPLEX_FOOT NUMBER
);
drop table apt_complex;
insert into APT_COMPLEX values(1,'서울 강남구',1,1,'자이 아파트',sysdate,sysdate,sysdate,0,'asdasd',1,'asd',1);
insert into APT_COMPLEX values(2,'서울 강남구',1,1,'주공 아파트',sysdate,sysdate,sysdate,1,'asdasd',1,'asd',1);
insert into APT_COMPLEX values(3,'서울 강남구',1,1,'주공 아파트',sysdate,sysdate,sysdate,1,'asdasd',1,'asd',1);
insert into APT_COMPLEX values(4,'서울 강남구',1,1,'주공 아파트',sysdate,sysdate,sysdate,0,'asdasd',1,'asd',1);
insert into APT_COMPLEX values(5,'서울 강남구',1,1,'주공 아파트',sysdate,sysdate,sysdate,0,'asdasd',1,'asd',1);

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
   APART_INTERIOR VARCHAR2(1000)
)
drop table apartment;

select * from apt_complex;

select * from apt_complex where complex_state=0 order by complex_id;
select * from apt_complex where complex_state =1 or complex_state =2 order by complex_id;