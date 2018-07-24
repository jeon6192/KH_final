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
	




select * from APARTMENT;
select count(*) from apartment

select complex_id, count(*) from apartment group by(complex_id)


select * from apartment 
	where complex_id = (
	select complex_id from apt_complex 
		where complex_apartname = '123')

		
delete from APARTMENT