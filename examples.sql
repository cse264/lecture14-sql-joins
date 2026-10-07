-- Run any one of these by clicking on it and pressing Ctrl+Enter (Cmd+Enter on a Mac).


-- WHY JOINS?
-- the orders table doesn't store a restaurant's name, a zone's name, or a driver's name.
-- it stores ID numbers and codes that point to rows in other tables.
-- a JOIN lets us pull those names back in.


-- JOIN
-- orders only stores a zone CODE like 'LUC'. The zone's real name lives in the zones table.
-- JOIN lines up rows from two tables, and ON says which columns have to match.
select orders.order_id, orders.delivery_zone, zones.name
from orders
join zones on orders.delivery_zone = zones.zone_code
limit 10;


-- ALIASES
-- typing full table names gets old fast, so give each table a short nickname (an alias)
-- "o" means orders and "z" means zones for the rest of this query
select o.order_id, z.name, z.city
from orders o
join zones z on o.delivery_zone = z.zone_code
limit 10;

-- you need the alias in front of a column when BOTH tables have a column with that name.
-- leave it off and you'll get an error that the column is "ambiguous".


-- JOIN + EVERYTHING FROM LAST CLASS
-- after a join you can still use WHERE, ORDER BY, LIMIT, and the rest
select o.order_id, z.name, o.subtotal
from orders o
join zones z on o.delivery_zone = z.zone_code
where z.city = 'Easton'
order by o.subtotal desc
limit 10;

-- and GROUP BY works too. how many restaurants are in each city?
-- restaurants only has a zone_code, so we join to zones to get the city
select z.city, count(*) as num_restaurants
from restaurants r
join zones z on r.zone_code = z.zone_code
group by z.city
order by num_restaurants desc;


-- INNER JOIN vs LEFT JOIN
-- a plain JOIN (also called an INNER JOIN) only keeps rows that found a match in BOTH tables.
-- if a row on one side has nothing to match, it quietly disappears from the results.
--
-- a LEFT JOIN keeps EVERY row from the left table (the one after FROM),
-- and fills in blanks (NULL) when nothing on the right side matched.
-- (every zone has at least one restaurant, so you won't see any blanks here.
-- you'll find out where it really matters in Part 2.)
select z.name, r.name as restaurant
from zones z
left join restaurants r on z.zone_code = r.zone_code
order by z.name;


-- MORE THAN TWO TABLES
-- just keep adding JOIN lines. each one needs its own ON.
-- here we join orders to zones AND to drivers: three tables in one query
select o.order_id, z.name as zone, d.first_name as driver, d.vehicle_type
from orders o
join zones z on o.delivery_zone = z.zone_code
join drivers d on o.driver_id = d.driver_id
where z.city = 'Hellertown'
limit 10;
