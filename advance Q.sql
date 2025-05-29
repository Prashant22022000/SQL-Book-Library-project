----Task 11. Create a Table of Books with Rental Price Above a Certain Threshold:
create table rental_price as 
select*
from books
where rental_price > 7

---Task 12: Retrieve the List of Books Not Yet Returned

select *
from issued_status as ist
left join return_status rs
on ist.issued_id = rs.issued_id
where return_id is null

/*Task 13: Identify Members with Overdue Books
Write a query to identify members who have overdue books (assume a 420 -day return period). 
Display the member's_id, member's name, book title, issue date, and days overdue.
 */
select
	m.member_id,
	m.member_name,
	ist.issued_book_name,
	ist.issued_date,
	(current_date - ist.issued_date)  as over_due
from issued_status as ist
join members as m
on ist.issued_member_id = m.member_id
left join return_status as rs
on ist.issued_id = rs.issued_id
where return_id is null 
and
(current_date - ist.issued_date) > 420
order by 1

/*Task 15: Branch Performance Report
Create a query that generates a performance report for each branch,
showing the number of books issued,
the number of books returned,
and the total revenue generated from book rentals.
*/

select*from books
select*from issued_status
select*from return_status
select*from employees

select
	branch_id,
	count(ist.issued_id) as issued_cnt,
	count(rs.return_id) as return_cnt,
	sum(rental_price) as branch_revenue
from issued_status as ist
join employees as e
on ist.issued_emp_id = e.emp_id
left join return_status as rs
on ist.issued_id = rs.issued_id
join books as b
on b.isbn = ist. issued_book_isbn
group by 1
order by 1


/*Task 16: CTAS: Create a Table of Active Members
Use the CREATE TABLE AS (CTAS) statement to create a new table active_members
containing members who have issued at least one book in the last 420 day.*/

select m.*,
(current_date - issued_date) as last_issued
from issued_status  as ist
join members m
on m.member_id = ist.issued_member_id
where current_date - issued_date < 420
order by 1,5


/*Task 17: Find Employees with the Most Book Issues Processed
Write a query to find the top 3 employees who have processed the most book issues.
Display the employee name, number of books processed, and their branch.*/


select 
	e.emp_id,
	emp_name,
	branch_id,
	count(issued_id) as emp_count
from issued_status as ist
join employees as e
on ist.issued_emp_id = e.emp_id
group by 1,2
order by count(issued_id) desc
limit 3