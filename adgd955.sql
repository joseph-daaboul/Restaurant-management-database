/*
Student name: Joseph Daaboul              
Student username: adgd955            
*/

/* SECTION 1 - CREATE TABLE STATEMENTS */

CREATE TABLE `adgd955_Customer` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `customer_name` varchar(50) NOT NULL,
  `contact_number` int(11) DEFAULT NULL
);

CREATE TABLE `adgd955_Employee` (
  `employeeID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `employee_name` varchar(50) NOT NULL,
  `contact_number` int(11) DEFAULT NULL,
  `hire_date` int(6) DEFAULT NULL,
  `role` varchar(20) NOT NULL
);

CREATE TABLE `adgd955_Seating` (
  `table_number` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `table_seats` int(11) NOT NULL
);

CREATE TABLE `adgd955_TableOrder` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `customer_id` int(11) NOT NULL REFERENCES adgd955_Customer(customerID),
  `employee_id` int(11) NOT NULL REFERENCES adgd955_Employee(employeeID),
  `tableNumber` int(11) NOT NULL REFERENCES adgd955_Seating(table_number)
);

CREATE TABLE `adgd955_Booking` (
  `bookingID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `customer_id` int(11) NOT NULL REFERENCES adgd955_Customer(customerID),
  `party_size` int(11) NOT NULL,
  `booking_date` datetime NOT NULL,
  `table_number` int(11) NOT NULL,
  Foreign key (customer_id) references adgd955_Customer (customerID)
);


/* SECTION 2 - INSERT STATEMENTS */


INSERT INTO `adgd955_Customer` (`customerID`, `customer_name`, `contact_number`) VALUES
(1, 'Jamal', 771962356),
(2, 'Carla', NULL),
(3, 'Carina', NULL),
(4, 'Elon', 774621909),
(5, 'Chris', 776343592),
(6, 'Fatima', 772554190),
(7, 'Jana', 779626841),
(8, 'Amy', 779376005),
(9, 'Matt', NULL),
(10, 'Tony', NULL),
(11, 'Andre', 771803939),
(12, 'Omar', 775680065);

INSERT INTO `adgd955_Employee` (`employeeID`, `employee_name`, `contact_number`, `hire_date`, `role`) VALUES
(1, 'Jake', 776583958, 201105, 'Chef'),
(2, 'Olivia', NULL, NULL, 'Chef'),
(3, 'James', 777452547, 180122, 'Chef'),
(4, 'Ray', NULL, NULL, 'Waiter '),
(5, 'Lauren', 778493553, NULL, 'Waiter'),
(6, 'Ali', 774536329, 220308, 'Waiter'),
(7, 'Alexa', NULL, 191218, 'Waiter'),
(8, 'Ahmed', 772539477, 200510, 'Manager'),
(9, 'Katie', 777836452, NULL, 'Cashier'),
(10, 'Olivia', NULL, 230314, 'Waiter'),
(11, 'Yara', 774892842, 180707, 'Cashier');

INSERT INTO `adgd955_Seating` (`table_number`, `table_seats`) VALUES
(1, 2),
(2, 4),
(3, 6),
(4, 4),
(5, 2),
(6, 4),
(7, 8),
(8, 4),
(9, 4),
(10, 10),
(11, 8),
(12, 4);

INSERT INTO `adgd955_Booking` (`bookingID`, `customer_id`, `party_size`, `booking_date`, `table_number`) VALUES
(1, 12, 5, '2023-12-21 16:00:00', 3),
(2, 7, 2, '2023-12-21 15:30:00', 1),
(3, 11, 2, '2023-12-21 19:00:00', 5),
(4, 3, 9, '2023-12-21 14:30:00', 10),
(5, 9, 8, '2023-12-21 20:00:00', 7),
(6, 2, 4, '2023-12-21 20:30:00', 8),
(7, 4, 4, '2023-12-21 15:00:00', 9),
(8, 1, 4, '2023-12-21 21:00:00', 4),
(9, 8, 4, '2023-12-21 20:00:00', 2),
(10, 12, 6, '2023-12-21 20:00:00', 3),
(11, 6, 4, '2023-12-21 14:30:00', 12);

INSERT INTO `adgd955_TableOrder` (`orderID`, `customer_id`, `employee_id`, `tableNumber`) VALUES
(1, 3, 4, 10),
(2, 6, 5, 12),
(3, 4, 6, 9),
(4, 7, 7, 1),
(5, 10, 10, 3),
(6, 11, 4, 5),
(7, 8, 5, 2),
(8, 9, 6, 7),
(9, 5, 7, 3),
(10, 2, 10, 8),
(11, 1, 4, 4);
                     
/* SECTION 3 - UPDATE STATEMENTS */

UPDATE adgd955_Seating SET table_seats = 5 WHERE table_number = 2;
UPDATE adgd955_Employee SET role = 'Cashier' WHERE employee_name = 'Olivia' AND employeeID = 2;


/* SECTION 4 - SINGLE TABLE SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs*/


/* 
1) List the table numbers of all tables who have exactly 4 seats. 

*/

SELECT table_number FROM adgd955_Seating WHERE table_seats = 4;


/* 
2) List the ID and roles of all employees named Olivia. 

*/

SELECT employeeID, role FROM adgd955_Employee WHERE employee_name = 'Olivia';

/* 
3) List all the details of employees with no registered contact number and hire date.

*/

SELECT * FROM `adgd955_Employee` WHERE contact_number IS NULL and hire_date IS NULL;

/* 
4) List the names of customers who have a registered contact number. Sort the list by the customer names in ascending order. 

*/

SELECT customer_name FROM `adgd955_Customer` WHERE contact_number IS NOT NULL
ORDER BY customer_name ASC;


/* 
5) List the number of employees that were hired in 2020. 

*/

SELECT COUNT(employeeID) FROM adgd955_Employee WHERE hire_date >= 200101 and hire_date <= 201231;

/* 
6) Which customers have made a booking at 8 pm or later on the 21st of December? 

*/

SELECT customer_id, COUNT(*) FROM adgd955_Booking WHERE booking_date >= '2023-12-21 20:00:00' GROUP BY customer_id;


/* SECTION 5 - MULTIPLE TABLE SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs */


/* 
1) List the names of the customers who have been served by the employee Ray. 

*/

SELECT customer_name FROM adgd955_Customer WHERE customerID IN (SELECT DISTINCT customer_id FROM adgd955_TableOrder WHERE employee_id = 4);

/* 
2) List the names of both the employee and customer at every table.

*/

SELECT employee_name, customer_name, tableNumber FROM adgd955_Employee T1 INNER JOIN adgd955_TableOrder T2 ON T1.employeeID = T2.employee_id INNER JOIN adgd955_Customer T3 ON T2.customer_id = T3.customerID;

/* 
3) List the names of the waiters who have served at least 2 tables. Show how many tables each waiter has served.

*/

SELECT employee_name, role, COUNT(*)
FROM adgd955_TableOrder, adgd955_Employee
WHERE adgd955_TableOrder.employee_id = adgd955_Employee.employeeID
GROUP BY employee_name, role
HAVING COUNT(*) >= 2;

/* 
4) List all employees’ names and roles, and show how many orders they have taken. Sort the list in decreasing order of table orders taken. 

*/

SELECT e.employee_name, e.role, COUNT(t.orderID) as total_orders
FROM adgd955_Employee e
LEFT JOIN adgd955_TableOrder t ON e.employeeID = t.employee_id
GROUP BY e.employee_name, e.role
ORDER BY total_orders DESC;

/* 
5) List all the customers who have more than one booking and show how many bookings they have. 

*/


SELECT c.customer_name, COUNT(b.bookingID) as bookings_count
FROM adgd955_Customer c
JOIN adgd955_Booking b ON c.customerID = b.customer_id
GROUP BY c.customer_name
HAVING bookings_count > 1
ORDER BY bookings_count DESC;

/* 
6) List the customers who have made bookings of the same party size. 

*/

SELECT c.customer_name, b.party_size
FROM adgd955_Customer c
JOIN adgd955_Booking b ON c.customerID = b.customer_id
WHERE b.party_size IN (SELECT party_size FROM adgd955_Booking GROUP BY party_size HAVING COUNT(*) > 1)
ORDER BY b.party_size, c.customer_name;

/* SECTION 6 - DELETE ROWS (make sure the SQL is commented out in this section)

DELETE FROM adgd955_Employee WHERE employeeID = 11;
DELETE FROM adgd955_Customer WHERE customerID = 5 AND customer_name = 'Chris';

 
*/

/* SECTION 7 - DROP TABLES (make sure the SQL is commented out in this section)

DROP TABLE adgd955_Booking;
DROP TABLE adgd955_Customer;
DROP TABLE adgd955_Employee;
DROP TABLE adgd955_Seating;
DROP TABLE adgd955_TableOrder;

*/

