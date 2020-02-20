create table storemember(
usernum number not null,
userid varchar2(50) not null primary key,
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

insert into storemember values
((select nvl(max(usernum)+1,1) from storemember)
, 'jang6845'
, 'jang1234'
, '장성열'
, '남'
, '1987년1월26일'
, 'jang6845@naver.com'
, '01040466845'
, '12345'
, '서울시중랑구망우3동'
, '432-72번지 301호'
, sysdate);


insert into storemember 
(usernum, userid,passwd,name,gender,birthday,email,hp)
values ((select nvl(max(usernum)+1,1) from storemember)
,'jang6845'
, PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('jang1234')
, '장성열'
, '남'
, '1986년1월26일'
, 'jang6845@naver.com'
, '010-4046-6845');