create table Option_f(
f_opkey number primary key,
apart_id number REFERENCES APT_COMPLEX(COMPLEX_ID),
user_no number REFERENCES member(user_no),
bedroom_closet number not null,
kitchen_height number not null,
balcony number not null,
interior_color number not null
)

drop table Option_f

delete Option_f where user_no=0;
create sequence optionF_seq
increment by 1
start with 1


select * from Option_f