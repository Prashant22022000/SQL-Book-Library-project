select * from books;
select * from branch;
select * from employees;
select * from issued_status;
select * from members;
select * from return_status;

------------------------------------------------------------------------
---Practice Questions 
----Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
insert into books(isbn, book_title, category, rental_price, status, author, publisher)
	values('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')

----Task 2: Update an Existing Member's Address


update members
set member_address = '125 Oak St'
where member_id = 'C101'

-----Task 3: Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

delete from issued_status
	where issued_id = 'IS121'

----Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.
select *
from issued_status
where issued_emp_id ='E101'

----Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.
select
	issued_member_id,
	count(*)
from issued_status
group by 1
having count(*) > 1

----Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

drop table if exists issued_book_cnt;
create table issued_book_cnt as
select
	isbn,
	book_title,
	count(issued_book_isbn)
from books as b
join issued_status as isn
on b.isbn = isn.issued_book_isbn
group by 1,2;


----ask 7. Retrieve All Books in a Specific Category:

select*
from books
where category ='Classic'

---Task 8: Find Total Rental Income by Category:
with table_1 as (
select
	book_title,
	category,
	rental_price,
	count(issued_book_isbn) as quantity
from books as b
join issued_status as isn
on  b.isbn = isn.issued_book_isbn
group by 1,2,3
),
table_2 as (
select
	*,
	(rental_price*quantity) as total_rent
from table_1
)
select
	category,
	sum(total_rent) as total_rental_incone
from table_2
group by category



----Task 9: List Members Who Registered in the Last 365 Days:

select*
from members
where reg_date > current_date - 365

---- Task 10: List Employees with Their Branch Manager's Name and their branch details:


select * from employees;
select * from branch;


select 
	e1.emp_id,
	e1.emp_name,
	b.manager_id,
	b.branch_address,
	e2.emp_name as manger
from employees as e1
join branch as b
on b.branch_id = e1.branch_id
join employees as e2
on e2.emp_id = b.manager_id




