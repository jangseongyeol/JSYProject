--회원관련 데이터베이스
create table storemember(
usernum number not null,
userid varchar2(50) not null constraint user_userid_pk primary key,
passwd varchar(64) not null,
username varchar2(50) not null,
birthday varchar2(30),
useremail varchar2(50),
phone varchar2(50),
postcode varchar2(10),
address varchar2(200),
address2 varchar2(200),
join_date date default sysdate
);

--회원관련 데이터베이스
create table storemember(
usernum number not null,
userid varchar2(50) not null constraint user_userid_pk primary key,
passwd varchar(64) not null,
username varchar2(50) not null,
birthday varchar2(30),
useremail varchar2(50),
phone varchar2(50),
postcode varchar2(10),
address varchar2(200),
address2 varchar2(200),
join_date date default sysdate
);
drop table storeproduct;
-- 상품관련 데이터베이스
create table storeproduct(
productid number constraint product_productid_pk  primary key,
producttype varchar2(20),
producttype2 varchar2(20),
productname varchar2(20),
explanation varchar2(50),
price number,
filename1 varchar2(50),
filename2 varchar2(50),
filename3 varchar2(50),
filename4 varchar2(50),
filename5 varchar2(50),
filename6 varchar2(50),
filename7 varchar2(50),
filename8 varchar2(50),
color varchar2(30),
modelsize varchar2(30),
inventory number);

--장바구니 관련 데이터베이스
create table storebasket(
basketid varchar2(50) constraint basket_basketid_pk primary key,
userid varchar2(50),
productid number,
numbers number,
validity number);

--결제관련 데이터베이스
create table storepayment(
paymentid number constraint payment_paymentid_pk  primary key,
userid varchar2(50),
poduckid number,
numbers number,
address varchar2(50),
contact varchar2(50),
creditcardnumber varchar2(20),
creditcardpassword varchar2(10));

select * from storeproduct;

commit;
insert into storeproduct (productid, producttype) values ((select nvl(max(productid)+1,1) from storeproduct),'best');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'best','juniorbest');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'best','babybest');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'best','accbest');

insert into storeproduct (productid, producttype) values ((select nvl(max(productid)+1,1) from storeproduct),'sale');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'sale','spring');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'sale','summer');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'sale','fall');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'sale','winter');

insert into storeproduct (productid, producttype) values ((select nvl(max(productid)+1,1) from storeproduct),'baby');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'baby','babyouter');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'baby','babytop');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'baby','babybottom');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'baby','babyset');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'baby','babydress');

insert into storeproduct (productid, producttype) values ((select nvl(max(productid)+1,1) from storeproduct),'junior');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'junior','juniorouter');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'junior','juniortop');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'junior','juniorbottom');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'junior','juniorset');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'junior','juniordress');


insert into storeproduct (productid, producttype) values ((select nvl(max(productid)+1,1) from storeproduct),'acc');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'acc','bag');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'acc','cap');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'acc','socks');
insert into storeproduct (productid, producttype, producttype2) values ((select nvl(max(productid)+1,1) from storeproduct),'acc','muffler');