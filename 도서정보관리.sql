--도서정보관리
drop table books_info;

create table BIDB (
 isbn varchar2(20) primary key,
 title varchar2(50) not null,
 price number(6),
 author varchar2(40) not null,
 publisher varchar2(50),
 category varchar2(50) not null,
 description varchar2(2000));
 
 select * from BIDB;
 select * from books_info where title like '%자바%';
 
 insert into BIDB(isbn,title,price,author,publisher,category,description)
 values('2021001','자바를잘하는기술들',50000,'현대빈','현대','기술','자바기술 소개');
 
  
 insert into BIDB(isbn,title,price,author,publisher,category,description)
 values('2021002','JSP를잘하는기술들',30000,'이병진','삼성','기술','JSP기술 소개');
 
  insert into BIDB(isbn,title,price,author,publisher,category,description)
 values('2021003','Servlet 잘하는기술들',100000,'김영진','쌍용데이터','기술','Servlet기술 소개');
 
  
insert into BIDB(isbn,title,price,author,publisher,category,description)
values('11-22-33-44','시안디자인개발응용',35000,'이승아','프로그래밍','나눔','FrontEndDeveloper');
 
create table login(
id varchar2(20) primary key,
pw varchar2(20) not null);
 
 select * from login;
 