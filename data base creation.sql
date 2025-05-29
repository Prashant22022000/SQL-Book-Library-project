---- creating data base

create database libaray_p1

-- creating table 
drop table if exists books;

create table books (
	isbn varchar(30),
	book_title varchar(50),
	category varchar(20),
	rental_price float,
	status varchar(10),
	author varchar(25),
	publisher varchar(30)
);
-------------------------------------------------------------
alter table books
alter column isbn type varchar(30),
alter column book_title type varchar(75)

-------------------------------------------------------------
alter table books 
add primary key (isbn)
----------------------------------------------------------------

select * from books

----------------------------------------------------------------

create table Branch(
	branch_id varchar(10),
	manager_id varchar(10),
	branch_address varchar(15),
	contact_no varchar(15)
);

alter table branch
add primary key (branch_id)

select * from branch
-----------------------------------------------------------------
create table employees(
	emp_id varchar(10),
	emp_name varchar(20),
	position varchar(10),
	salary varchar(10),
	branch_id varchar(10)
)

-----------------------------------

alter table employees
add primary key (emp_id)

------------------------------------------------
select * from employees
------------------------------------------------------------------------
 create table issued_status(
	issued_id varchar(10) primary key,
	issued_member_id varchar(10),
	issued_book_name varchar(75),	
	issued_date	date,
	issued_book_isbn varchar(20),	
	issued_emp_id varchar(10)
 );

select*from issued_status

----------------------------------------------------------------

create table members(
	member_id varchar(10),
	member_name varchar(20),
	member_address varchar(15),
	reg_date date
)

alter table members
add primary key (member_id)

select * from members

---------------------------------------------------------------

create table return_status(
	return_id varchar(10) primary key,
	issued_id varchar(10),
	return_book_name varchar(75),
	return_date	date,
	return_book_isbn varchar(20)
)


select * from return_status
order by issued_id

--------------------------------------------------------------------------

------inserting forigen_key or data modeling


alter table employees
add foreign key (branch_id) references branch(branch_id)

alter table issued_status
add foreign key (issued_member_id) references members(member_id),
add foreign key (issued_book_isbn) references books(isbn),
add foreign key (issued_emp_id) references employees(emp_id)





alter table return_status
add foreign key (issued_id) references issued_status(issued_id)


delete from return_status
	where issued_id in ('IS101','IS103','IS105')

	---------------------------------------------------------------
