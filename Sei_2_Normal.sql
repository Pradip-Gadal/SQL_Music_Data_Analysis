-- SET-2: Normal_Quary

-- Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
-- Return your list ordered alphabetically by email starting with A

--method_1
select distinct email, first_name, last_name from customer as c_
join invoice as i_ on c_.customer_id = i_.customer_id
join invoice_line as i_l on i_.invoice_id = i_l.invoice_id
where track_id in(
	select track_id from track as t_
	join genre as g_ on t_.genre_id = g_.genre_id where g_.name like 'Rock'
)
order by 1

--method_2
select c_.customer_id, c_.email,c_.first_name, c_.last_name from customer as c_
join invoice as i_ on c_.customer_id = i_.invoice_id
join invoice_line as i_l on i_.invoice_id = i_l.invoice_id
join track as t_ on i_l.track_id = t_.track_id
join genre as g_ on t_.genre_id = g_.genre_id where g_.name like 'Rock'
group by 1
order by 2

-- Q2: Let's invite the artists who have written the most rock music in our dataset.
-- Write a query that returns the Artist name and total track count of the top 10 rock bands

select a_.name, count(a_.name) as total from artist as a_
join album as al_ on a_.artist_id = al_.artist_id
join track as t_ on al_.album_id = t_.album_id
where genre_id in(select genre_id from genre where name like 'Rock')
group by 1
order by 2 desc



