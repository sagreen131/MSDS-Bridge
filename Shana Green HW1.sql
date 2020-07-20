/*	Shana Green
	SQL Bridge
	HW 1 
    Due 07/19/2020
*/

/*1. Which destination in the flights database is the furthest distance away, based on information in the flights table.  Show the SQL query(s) that support your conclusion.

Honolulu, HI (HNL) is the furthest distance away from JFK with 4983 miles.

*/
SELECT origin, dest, distance FROM flights GROUP BY dest ORDER BY distance DESC LIMIT 1;

/*2. What are the different numbers of engines in the planes table?  For each number of engines, which aircraft have the most number of seats?  Show the SQL statement(s) that support your result. 

The different numbers of engines are 1, 2, 3, and 4. 

CESSNA has 1 engine with a maximum of 2 seats.
EMBRAER has 2 engines with a maximum of 55 seats.
AIRBUS has 3 engines with a maximum of 379 seats.
AIRBUS INDUSTRIE has 4 engines with a maximum of 375 seats. 
*/

SELECT engines, COUNT(engines), manufacturer, seats FROM planes GROUP BY engines ORDER BY seats DESC; 

/*3. Show the total number of flights.*/

SELECT COUNT(*) FROM flights;

/*4. Show the total number of flights by airline (carrier).*/ 

SELECT carrier, COUNT(carrier) FROM flights GROUP BY carrier;

/*5. Show all of the airlines, ordered by number of flights in descending order.*/

SELECT carrier, COUNT(carrier) FROM flights GROUP BY carrier ORDER BY COUNT(carrier) DESC;

/*6*. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.*/

SELECT carrier, COUNT(carrier) FROM flights GROUP BY carrier ORDER BY COUNT(carrier) DESC LIMIT 5;

/*7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order.*/

SELECT carrier, COUNT(carrier) FROM flights WHERE distance >= 1000 GROUP BY carrier ORDER BY COUNT(carrier) DESC LIMIT 5;

/*8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and write down both the question, and the query that answers the question. 

What was the average tempature in July, departing from JFK?

*/

SELECT origin, AVG(temp) FROM weather WHERE origin = 'JFK' AND month = 7 AND day BETWEEN 1 AND 31 