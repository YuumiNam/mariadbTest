show tables;
desc emaillist;

-- insert
insert into emaillist values(null,'이','선무','dltjsam@gmail.com');
insert into emaillist values(null,'또','치','ddochi@gmail.com');


-- select
select * from emaillist order by no desc;


-- delete (by email)
delete from emaillist where email = 'dolli@gmail.com';

-- delete All
delete from emaillist;