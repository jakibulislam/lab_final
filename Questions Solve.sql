
1. List all buses along with their respective company names.
SELECT  bus.bus_name, company.name
FROM bus, company 
WHERE bus.bus_id=company.id

2. Find all drivers who work for 'SR Group'.
SELECT  driver.name as 'driver_name'
FROM driver, company, bus
where driver.bus_id=bus.bus_id
AND bus.company_id=company.id
AND company.name="SR Group" 

3. Count the number of passengers who have booked tickets for the bus named 'Alam'.
SELECT Bus.bus_name,COUNT(passenger.p_id) as "Number of Passernger"
from passenger,bus,book_ticket
where book_ticket.passenger_id=passenger.p_id
AND book_ticket.bus_id=bus.bus_id
AND bus.bus_name="Alam"

4. Find the average of payment by each Pangsengar
SELECT passenger.p_id, passenger.first_name, passenger.last_name, AVG(payment.amount) AS average_payment
FROM payment,passenger 
where payment.passenger_id = passenger.p_id
GROUP BY passenger.p_id, passenger.first_name, passenger.last_name

5. Find the total number of buses for each company.
SELECT company.name, COUNT(bus.company_id) AS total_buses
FROM company,bus
where company.id=bus.company_id
GROUP BY company.name;

6. Find all passengers who use Banglalink phone number. Hints: phone number starts with 019 or 014

SELECT concat(passenger.first_name, " ", passenger.last_name) AS 'passenger name', passenger.phone
FROM passenger
WHERE passenger.phone LIKE '19%' 
or passenger.phone LIKE '14%'
or
SELECT concat(passenger.first_name, " ", passenger.last_name) AS 'passenger name'
FROM passenger
WHERE passenger.phone LIKE '19%' 
or passenger.phone LIKE '14%'

7. List the details of passengers who have made more than one payment.
SELECT passenger.*
FROM passenger
JOIN (
    SELECT passenger_id
    FROM payment
    GROUP BY passenger_id
    HAVING COUNT(*) > 1
) AS multiple_payment
ON passenger.p_id = multiple_payment.passenger_id;

8. List the details of the top 3 most frequently traveled passengers.
SELECT passenger.*, travel_count
FROM passenger
JOIN (
    SELECT passenger_id, COUNT(*) AS travel_count
    FROM book_ticket
    GROUP BY passenger_id
    ORDER BY travel_count DESC
    LIMIT 3
) AS top_travelers
ON passenger.p_id = top_travelers.passenger_id;

9. Create a view for the following problem:
Find the name (first_name and last_name), email, phone of all passengers.
SELECT concat(passenger.first_name, " ", passenger.last_name) as name ,passenger.email,passenger.phone
from passenger

10. Find the total revenue generated by each company.
SELECT company.name, SUM(payment.amount) AS total_revenue
FROM payment,bus,company
where payment.bus_id=bus.bus_id
AND bus.company_id=company.id
GROUP by company.name