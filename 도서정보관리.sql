--������������
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
 select * from books_info where title like '%�ڹ�%';
 
 insert into BIDB(isbn,title,price,author,publisher,category,description)
 values('2021001','�ڹٸ����ϴ±����',50000,'�����','����','���','�ڹٱ�� �Ұ�');
 
  
 insert into BIDB(isbn,title,price,author,publisher,category,description)
 values('2021002','JSP�����ϴ±����',30000,'�̺���','�Ｚ','���','JSP��� �Ұ�');
 
  insert into BIDB(isbn,title,price,author,publisher,category,description)
 values('2021003','Servlet ���ϴ±����',100000,'�迵��','�ֿ뵥����','���','Servlet��� �Ұ�');
 
  
insert into BIDB(isbn,title,price,author,publisher,category,description)
values('11-22-33-44','�þȵ����ΰ�������',35000,'�̽¾�','���α׷���','����','FrontEndDeveloper');
 
create table login(
id varchar2(20) primary key,
pw varchar2(20) not null);
 
 select * from login;
 