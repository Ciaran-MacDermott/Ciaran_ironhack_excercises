use bank;
SELECT * FROM client;
/*Get the id values of the first 5 clients from district_id with a value equals to 1.*/
SELECT * FROM client WHERE district_id = 1 
LIMIT 5;

/*In the client table, get an id value of the last client where the district_id equals to 72.*/
SELECT client_id FROM client WHERE district_id = 72
ORDER BY client_id DESC;

/*Get the 3 lowest amounts in the loan table.*/
SELECT amount FROM loan
ORDER BY amount
limit 3;

/*What are the possible values for status, ordered alphabetically in ascending order in the loan table?*/

SELECT DISTINCT status from loan
ORDER BY status;

/*What is the loan_id of the highest payment received in the loan table?*/
SELECT loan_id from loan
ORDER BY payments desc
limit 1;

/*What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount*/
SELECT account_id,amount from loan
ORDER BY account_id
limit 5;

/*7. What are the top 5 account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?*/
SELECT account_id from loan WHERE duration = 60
ORDER BY amount
limit 5;

/*8. What are the unique values of k_symbol in the order table?
There shouldn't be a table name order, since order is reserved from the ORDER BY clause. 
You have to use backticks to escape the order table name.*/

SELECT DISTINCT k_symbol FROM `bank`.`order`
ORDER BY k_symbol;

/*9. In the order table, what are the order_ids of the client with the account_id 34?
Expected result:
29445,29446,29447*/

SELECT order_id FROM `bank`.`order`WHERE account_id = 34
order by order_id;

/*10. in the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
Expected result:88,90,96,97*/

SELECT DISTINCT account_id FROM `bank`.`order` WHERE order_id >= 29540 and order_id <= 29560
ORDER BY account_id;

/*11 In the order table, what are the individual amounts that were sent to (account_to) id 30067122?
Expected result:5123*/

SELECT amount FROM `bank`.`order` where account_to = 30067122;

/*12 In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in chronological order, from newest to oldest.
Expected result:
3556468	981231	PRIJEM	78.6
233254	981216	VYDAJ	600
233104	981212	VYDAJ	1212
233248	981211	VYDAJ	851
233176	981207	VYDAJ	204
3556467	981130	PRIJEM	75.1
233395	981130	VYDAJ	14.6
233103	981112	VYDAJ	1212
233247	981111	VYDAJ	851
233175	981107	VYDAJ	204*/

SELECT `trans_id`,`date`,`type`,`amount` FROM trans WHERE account_id = 793
order by `date` desc
limit 10;

/*13
In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? 
Show the results sorted by the district_id in ascending order.*/


SELECT district_id,COUNT(district_id) FROM client WHERE district_id < 10
GROUP BY district_id
ORDER BY
	district_id;
    
/*14 In the card table, how many cards exist for each type? Rank the result starting with the most frequent type.
Expected result:
classic	659,junior	145,gold	88*/

SELECT  `type` ,COUNT(`type`) FROM card
GROUP BY `type`
order by COUNT(`type`) DESC;

/* Query 15
Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.*/
SELECT account_id, SUM(amount) from loan
GROUP BY account_id
ORDER BY SUM(amount) desc
limit 10;

/*16 in the loan table, retrieve the number of loans issued for each day, 
before (excl) 930907, ordered by date in descending order.*/

SELECT `date`, COUNT(`loan_id`) from loan where `date` < 930907
group by `date`
Order by `date` desc;

/* 17In the loan table, for each day in December 1997, 
count the number of loans issued for each unique loan duration, ordered by date and duration, both in ascending order. 
You can ignore days without any loans in your output.*/

SELECT date, duration, COUNT(date) from loan 
where `date` > 971201 and `date` <= 9712131
group by `date`,duration
Order by `date`,duration; 








