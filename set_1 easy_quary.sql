-- SET 1 : EASY
-- Q1: Who is the senior most employee based on job title?

select CONCAT(RTRIM(first_name),' ',LTRIM(last_name)) full_name from employee
order by levels desc
limit 1

-- Q2: Which countries have the most Invoices?

select billing_country, count(billing_country) total from invoice
group by billing_country
order by total desc
limit 1

-- Q3: What are top 3 values of total invoice?

select total from invoice
order by total desc
limit 3

-- Q4: Which city has the best customers? We would like to throw a promotional 
-- Music Festival in the city we made the most money.
-- Write a query that returns one city that has the highest sum of invoice totals.
-- Return both the city name & sum of all invoice totals

select billing_city, billing_country as city, sum(total) total from invoice
group by 1,2 
order by 3 desc
limit 1

--Q5: Who is the best customer? The customer who has spent the most money
-- will be declared the best customer. 
-- Write a query that returns the person who has spent the most money

select CONCAT(RTRIM(customer.first_name), ' ', LTRIM(customer.last_name)) full_name,
sum(invoice.total) total from customer 
join invoice on customer.customer_id = invoice.customer_id 
group by customer.customer_id
order by 2 desc
limit 1





