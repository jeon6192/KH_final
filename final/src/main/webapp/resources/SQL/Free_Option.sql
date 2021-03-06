create table Option_f(
f_opkey number primary key,
apart_id number REFERENCES apartment(APART_ID) unique,
user_no number REFERENCES member(user_no),
bedroom_closet number not null,
kitchen_height number not null,
balcony number not null,
interior_color number not null
)

create table Option_nf(
nf_opkey number primary key,
apart_id number REFERENCES apartment(APART_ID),
user_no number REFERENCES MEMBER(user_no),
floor_type number not null,
main_room_slide number not null,
dressroom number not null,
cooktop number not null,
kitchen_shelf number not null,
builtin_ref number not null,
builtin_kref number not null,
showerbooth number not null,
sys_air number not null,
nf_cost number not null
)

select * from option_nf

select opf.f_opkey, opf.bedroom_closet, opf.kitchen_height, opf.balcony, opf.interior_color,
   opnf.nf_opkey, opnf.floor_type, opnf.main_room_slide,
   opnf.dressroom, opnf.cooktop, opnf.kitchen_shelf, opnf.builtin_ref, opnf.builtin_kref, opnf.showerbooth, opnf.sys_air, 
   opnf.nf_cost, ew.user_no, ew.apart_id, m.id, m.name, m.tel, apt.apart_dong, apt.apart_ho, apt.apart_area 
   from OPTION_F opf inner join OPTION_NF opnf on opf.apart_id=opnf.apart_id 
   right outer join event_win ew on ew.apart_id= opf.apart_id 
   inner join member m on ew.user_no = m.user_no and ew.event_con=0 
   right outer join apartment apt on apt.apart_id=ew.apart_id
   where apt.complex_id=1
   order by apt.apart_dong, apt.apart_ho 

select *
		from OPTION_F opf inner join OPTION_NF opnf
	 on opf.apart_id=opnf.apart_id
	 right outer join apartment apt
		on opnf.apart_id=apt.apart_id
		inner join event_win ew
		on ew.apart_id = apt.apart_id
		inner join member m
		on ew.user_no = m.user_no
		inner join apt_complex cx
		on apt.complex_id= cx.complex_id
	where cx.complex_id=1 and ew.event_con=0
	
insert into OPTION_NF values(0, 0, 0, 1, 1,1,1,1,1,1,0,1,1);
insert into OPTION_NF values(1, 1, 1, 1, 1,1,1,1,1,0,1,1,1);
insert into OPTION_NF values(2, 2, 0, 1, 1,1,1,0,1,1,1,1,1);
insert into OPTION_NF values(3, 3, 2, 1, 1,1,1,1,1,1,1,1,1);
insert into OPTION_NF values(4, 4, 3, 1, 1,0,1,1,1,1,1,1,1);
insert into OPTION_NF values(5, 5, 4, 1, 1,0,1,1,1,1,1,1,1);
insert into OPTION_NF values(6, 6, 5, 1, 1,0,1,0,0,0,1,1,1);
insert into OPTION_NF values(7, 7, 6, 1, 1,1,1,1,1,1,1,1,1);
insert into OPTION_NF values(8, 8, 7, 1, 1,1,1,1,1,0,1,0,1);
insert into OPTION_NF values(9, 9, 8, 1, 1,1,1,1,1,1,1,0,1);
insert into OPTION_NF values(10, 10, 9, 1, 1,1,1,1,0,1,1,1,1);
insert into OPTION_NF values(11, 11, 1, 1, 1,1,1,1,1,0,1,0,1);
insert into OPTION_NF values(12, 12, 2, 1, 1,1,1,0,1,1,0,1,1);

insert into OPTION_NF values(13, 13, 1, 1, 1,1,1,1,1,0,1,0,1);
insert into OPTION_NF values(14, 14, 4, 1, 1,1,1,0,1,1,0,1,1);
insert into OPTION_NF values(15, 15, 5, 1, 1,1,1,1,1,0,1,0,1);
insert into OPTION_NF values(16, 16, 4, 1, 1,1,1,0,1,1,0,1,1);
insert into OPTION_NF values(17, 17, 7, 1, 1,1,1,1,1,0,0,0,1);
insert into OPTION_NF values(18, 18, 8, 1, 1,1,1,1,1,1,1,1,1);
insert into OPTION_NF values(19, 19, 7, 1, 1,1,1,1,1,0,1,0,1);
insert into OPTION_NF values(20, 20, 4, 1, 0,0,0,0,0,0,0,0,0);

insert into Option_f values(0, 0, 0, 0, 0, 0, 0);
insert into Option_f values(1, 1, 1, 1, 1, 1, 1);
insert into Option_f values(2, 2, 0, 0, 0, 0, 0);
insert into Option_f values(3, 3, 2, 0, 0, 0, 0);
insert into Option_f values(4, 4, 3, 1, 1, 1, 1);
insert into Option_f values(5, 5, 4, 0, 0, 0, 0);
insert into Option_f values(6, 6, 5, 1, 0, 1, 0);
insert into Option_f values(7, 7, 6, 0, 1, 0, 0);
insert into Option_f values(8, 8, 7, 0, 1, 0, 0);
insert into Option_f values(9, 9, 8, 0, 0, 0, 0);
insert into Option_f values(10, 10, 9, 0, 0, 0, 0);
insert into Option_f values(11, 11, 1, 0, 1, 0, 0);
insert into Option_f values(12, 12, 2, 0, 1, 0, 0);
insert into OPTION_F values(13, 13, 1, 1, 1,1,1);
insert into OPTION_F values(14, 14, 4, 1, 1,1,1);
insert into OPTION_F values(15, 15, 5, 1, 1,1,1);
insert into OPTION_F values(16, 16, 4, 1, 1,1,1);
insert into OPTION_F values(17, 17, 7, 1, 1,1,1);
insert into OPTION_F values(18, 18, 8, 1, 1,1,1);
insert into OPTION_F values(19, 19, 7, 1, 1,1,0);

drop table Option_f

delete Option_f where user_no=0;
create sequence optionF_seq
increment by 1
start with 1


select * from Option_f natural join Option_nf;
select nf_cost from option_nf where apart_id=1;
select count(apart_id) from (select * from option_f natural join option_nf) where apart_id=0


select of.apart_id
from Option_f of, Option_nf onf, APARTMENT apt
where of.apart_id=onf.apart_id and anf

inner join Option_nf onf on of.apart_id=onf.apart_id ;

inner join apartment ap on onf.apart_id=ap.apart_id;
