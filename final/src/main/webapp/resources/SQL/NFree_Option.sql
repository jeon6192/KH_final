
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

drop table Option_nf;

create sequence optionNF_seq;

delete from Option_nf where user_no=0;
select *  from Option_nf