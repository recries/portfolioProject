-- 생성자 Oracle SQL Developer Data Modeler 18.1.0.082.1041
--   위치:        2022-07-18 12:00:56 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



CREATE TABLE ezenbooks (
    num             NUMBER(5) NOT NULL,
    book_id         VARCHAR2(20),
    book_title      VARCHAR2(100),
    book_author     varchar2(100),
    book_publisher  varchar2(100),
    book_price      NUMBER(20),
    book_content    VARCHAR2(4000),
    book_category   NUMBER(3),
    book_isbn       VARCHAR2(20),
    book_img        VARCHAR2(4000),
    book_stock      NUMBER(1),
    book_status     NUMBER(1)
);

<<<<<<< HEAD
=======
insert into ezenbooks(
num, book_id, book_title, book_author, book_publisher, book_price, book_content, book_category, book_isbn, book_img, book_stock,book_status)
values(ezenbooks_num_seq.nextval,'제품 번호', '방황하는 칼날', '히가시노 게이고', '모름', '10000', '아버지는 딸의 복수를 위해 괴물이 되었다', 1, 'bbbb', '이미지 링크', 1, 0);



>>>>>>> 26b24329678c3e8eafdaf726b3bd6d93a3254378
select * from EZENBOOKS;
CREATE TABLE ezenmembers (
    num              NUMBER(20) NOT NULL,
    member_number    VARCHAR2(20),
    member_id        VARCHAR2(30),
    member_pass      VARCHAR2(30),
    member_address   VARCHAR2(4000),
    member_phone     VARCHAR2(30),
    member_email     VARCHAR2(100),
    member_type      NUMBER(1),
    member_status    NUMBER(1)
);

<<<<<<< HEAD
=======

insert into ezenmembers(
num, member_number, member_id, member_pass, member_address, member_phone, member_email, member_type, member_status
)values(ezenmembers_num_seq.nextval, '임의 번호', 'hyhy', 'a1234', '대한민국', '010-****-****', 'ezen@ezen.com', 0, 1); 


>>>>>>> 26b24329678c3e8eafdaf726b3bd6d93a3254378
select*from EZENMEMBERS;
CREATE TABLE ezenorders (
    num             NUMBER(38) NOT NULL,
    order_number    VARCHAR2(30),
    order_qty       NUMBER(20),
    member_number   VARCHAR2(20),
    book_id         VARCHAR2(20),
    order_status    NUMBER(1)
);
<<<<<<< HEAD
select*from EZENORDERS;

=======

insert into ezenorders(
num, order_number, order_qty, member_number, book_id, order_status
)values(ezenorders_num_seq.nextval, '임의 주문번호', 1, '임의 번호', 'AA220721163806', 1);


update ezenmembers set 
member_pass = 'a1234'
where num=5;


alter table ezenorders add order_phone VARCHAR2(30);
alter table ezenorders add order_name VARCHAR2(30);
alter table ezenorders add order_address VARCHAR2(4000);
alter table ezenorders rename column order_qty to order_cost;

alter table ezenmembers add member_name VARCHAR2(30);

alter table ezenorders add book_qty number(38);

select*from EZENORDERS
order by order_number; 


select order_number
from ezenorders
order by order_number;


 select o.num, o.order_number, o.order_qty, o.member_number, o.book_id, o.order_status, 
    m.member_id, b.book_title, b.book_price
    from ezenbooks b, ezenmembers m, ezenorders o
    where o.member_number = m.member_number
    and o.book_id=b.book_id
    order by o.num;
    
    
    create table ezencoupons(
    num             NUMBER(38) NOT NULL,
    coupon_number VARCHAR2(30),
    member_number   VARCHAR2(20),
    coupon_type     number(1),
    coupon_value    number(20)
    );
    
    commit;
    
select*from ezencoupons;
 
 
 
 
 
 create table ezencarts(
num number not null primary key,
member_number varchar2(20) not null,
book_id varchar2(20) not null, 
cart_amount number default 1
); 
 
 select*from ezencarts;
 
 
 
 
 create table ezenboards(
   	num number,
   	member_id varchar2(20),     
 	member_email varchar2(30),
	subject varchar2(50),
	reg_date date,
	readcount number default 0, 
	ref number, 
	re_step number, 
	re_level number,
	board_type number, 
	content varchar2(100),
    upload varchar2(300)
);
 
 select*from ezenboards;
    
    
    
>>>>>>> 26b24329678c3e8eafdaf726b3bd6d93a3254378
create sequence ezenbooks_num_seq
start with 1 
increment by 1
nocache
nocycle;

create sequence ezenmembers_num_seq
start with 1 
increment by 1
nocache
nocycle;

create sequence ezenorders_num_seq
start with 1 
increment by 1
nocache
nocycle;

<<<<<<< HEAD
=======

create sequence ezencoupons_num_seq
start with 1 
increment by 1
nocache
nocycle;

create sequence seq_cart
start with 1
increment by 1;

create sequence ezenfreeboards_num_seq
start with 1 
increment by 1
nocache
nocycle;

create sequence ezenreviewboards_num_seq
start with 1 
increment by 1
nocache
nocycle;

create sequence ezenqnaboards_num_seq
start with 1 
increment by 1
nocache
nocycle;

>>>>>>> 26b24329678c3e8eafdaf726b3bd6d93a3254378
commit;

-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              0
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
