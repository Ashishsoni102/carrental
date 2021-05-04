# carrental
The Car Rental Database involves around three main entities Car, User and Reservation
Car can be reserved from a rental location with a specific address. It has a unique Rental_Location_ID, a phone number and a contact email. A rental location keeps track of address where the car belongs using street name, state and zip code.
A rental location has a number of cars for rental. Each car is described by VIN, Registration Number, Color, Model, Manufactured year, Seating capacity of the car, whether it has Disabled friendly feature and its Status marked ‘Available’ or ‘Unavailable’

Queries:-
1.Display vehicles which is available.
SELECT Model from car WHERE Status='Available';
2.Display vehicle name having maximum seating capacity.
SELECT Model, MAX(Seating_Capacity) AS max_seating_capacity FROM car GROUP BY Model;
3.Delete all the reservations whose location is in “irving”.
DELETE FROM rental_location WHERE Street_Name LIKE '%Irving%';
4.Find names of Drivers whose last name starts with ‘P’.
SELECT Fname,Lname FROM car_user WHERE LNAME like 'P%';
5.Display the list of additional drivers .
SELECT * from additional_drivers;
6.Show the list of available promo codes.
SELECT Promo_code,Description FROM offer_details WHERE Status='available';
7.Show the driver phone number,licence number whose name is Patrick.
SELECT License_no,Phone FROM `car_user` WHERE Fname='Patrick';
8. Display the type of vehicle having Minimum price.
SELECT Car_Type,MIN(Price_per_day) as min_price FROM car_type;
9.Display the price of car Insurance whose type is 'Comprehesive'.
SELECT Insurance_Price from car_insurance WHERE Insurance_Type='Comprehensive';
10.Write a query to fetch the number of Additional Driver working.
SELECT COUNT(*) FROM additional_driver;
11.Write query to find all the car whose price is between 20 to 100 per day.
SELECT * FROM car_type WHERE Price_Per_Day BETWEEN '20' AND '100';
12. Select all the different values from the Insurance type column in the car insurance table.
SELECT DISTINCT Insurance_type FROM car_insurance;
13.Display car size is the most preferred.
 SELECT seating_capacity FROM car WHERE Model = (SELECT MAX(seating_capacity) FROM car);
14.Delete all the reservations for customer whose last name starts with ‘S’
DELETE FROM RESERVATION WHERE Reservation_ID IN (SELECT Reservation_ID FROM car_user WHERE LNAME LIKE 'S%');
