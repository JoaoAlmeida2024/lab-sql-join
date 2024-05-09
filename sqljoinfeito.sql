-- sql.join
-- List the number of films per category.


select * from sakila.film;

select * from sakila.category;

SELECT CATEGORY_ID, count(FILM_ID)
FROM SAKILA.FILM_CATEGORY
GROUP BY 1;

select c.category_id, count(f.film_id) as total_per_category
from sakila.film f
left join sakila.film_category fc
on f.film_id = fc.film_id
left join sakila.category c
on c.category_id = fc.category_id
group by 1
order by 1 asc;

-- Display the first and the last names, as well as the address, of each staff member

select * from sakila.address;

select * from sakila.staff;

SELECT S.FIRST_NAME, S.LAST_NAME, A.ADDRESS
FROM SAKILA.STAFF S
left join SAKILA.ADDRESS A
ON S.ADDRESS_ID = A.ADDRESS_ID;

--  the total amount rung up by each staff member in August 2005

select * from sakila.payment;

select st.staff_id, sum(p.amount) as total_amount_perstaff
from sakila.staff st
left join sakila.payment p
on p.staff_id = st.staff_id
where extract(month from payment_date) = 8 and extract(year from payment_date) = 2005
group by 1
order by 1 asc;

-- List all films and the number of actors who are listed for each film.

select * from sakila.actor;

select * from sakila.film_actor;

select * from sakila.film;

select fm.film_id, count(a.actor_id) as total_actor_perfilm
from sakila.actor a
left join sakila.film_actor fm
on a.actor_id = fm.actor_id
left join sakila.film sm
on fm.film_id = sm.film_id
group by 1 
order by 1 asc;

-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.

 select * from sakila.payment;
 
 select * from sakila.customer;
 
 select ska.customer_id, sum(pa.amount)
 from sakila.customer ska
 left join sakila.payment pa
 on ska.customer_id = pa.customer_id
 group by 1
 order by 2 desc;