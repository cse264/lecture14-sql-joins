# Lecture 14 In-Class Activity: Joins

Work with a partner. We'll stop three times to talk about what people found, so when you get to a **Stop** line, finish what you're running and wait for the rest of the class.

## Getting set up

1. Connect to the ValleyEats database in DBeaver with your own account, same as last class.
2. Open `examples.sql` and run the examples top to bottom. They show how joins work, how to use aliases, and how to combine a join with the `WHERE`, `ORDER BY`, and `GROUP BY` you already know. Read the comments as you go.
3. Write your own queries in `activity.sql`.

Remember that `orders` mostly stores ID numbers and codes, not names. Today is about getting the names back.

## Part 1: Swapping codes for names (about 8 minutes)

- Show 10 orders with the name of the restaurant each one came from, instead of the `restaurant_id`.
- List every restaurant along with the full name of the zone it's in, not just the zone code.
- Show 10 orders with the restaurant's name, the restaurant's cuisine, and the full name of the zone the order was delivered to.

**Stop.** Did anyone get an error saying a column was "ambiguous"? What does that mean, and how did you fix it? And one more to think about: `orders` stores a `restaurant_id` instead of the restaurant's name. Why would anyone design it that way, if it means you have to join every time you want the name?

## Part 2: Missing rows (about 7 minutes)

- Show every order next to the first name of the driver who delivered it. Count how many rows that gives you, and compare it to the total number of orders.
- If the numbers don't match, figure out which orders went missing and why. Then change your query so every order shows up, even the ones with no driver.

**Stop.** Where did the missing orders go? What did you change to get them back? When would you want the version that leaves them out?

## Part 3: Joins with grouping (about 9 minutes)

- How many orders were delivered to each city?
- What's the average subtotal for each cuisine? Which cuisine has the biggest orders on average?
- How many orders went to a different city from the one the restaurant is in?

For that last one, you need two cities for every order: the restaurant's city and the city it was delivered to. Both come from the `zones` table. You're allowed to join the same table more than once, as long as each copy gets its own alias.

**Stop.** How did you get both cities into one query? What number did you get?

## If you finish early

Stay on the part you're on and try one of these:

- Show the 10 biggest tips along with the first name of the driver who got each one. Look closely at the top rows. What's going on, and how do you fix it?
- Which cuisines have more than one restaurant in Bethlehem?
- Show the 10 most expensive orders that crossed city lines, with the name of the restaurant and both city names.

## Before you leave

Make sure both names are at the top of `activity.sql`, then commit and push it before the end of class.
