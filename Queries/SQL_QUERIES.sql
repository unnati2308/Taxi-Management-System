SQL QUERIES: 

1)	To see all available Taxis:

SELECT Taxi_id, Registration_no, Taxi_Model
FROM TAXI
WHERE Status = 'Active';

2)	To get all drivers details with their ratings:

SELECT Driver_id, F_name, L_name, Rating
FROM DRIVER;

3)	Find the total number of trips and the average trip amount for each taxi model:

SELECT t.Taxi_Model,
       COUNT(td.Trip_id) AS Total_Trips,
       AVG(td.Trip_amt) AS Avg_Trip_Amount
FROM TAXI t
JOIN TRIP_DETAILS td ON t.Taxi_id = td.Taxi_id
GROUP BY t.Taxi_Model;

4)	Find all trips:

SELECT * FROM TRIP_DETAILS
ORDER BY Trip_date DESC;

5)	Find drivers with rating equal to 5:

SELECT Driver_id, F_name, L_name, Rating
FROM DRIVER WHERE rating = 5;

6)	Find total revenue of company in year 2017:

SELECT SUM(Trip_amt) AS Total_Revenue
FROM TRIP_DETAILS
WHERE EXTRACT(YEAR FROM Trip_date) = 2017;

7)	Get average rating of all taxis in company:

SELECT AVG(Rating) AS Average_Rating
FROM DRIVER;

8)	Find fraction of male and female users using the company services:

SELECT 
    Gender,
    COUNT(*) AS Total_Users,
    COUNT(*) / (SELECT COUNT(*) FROM USER_TBL) AS Fraction
FROM 
    USER_TBL
GROUP BY 
    Gender;

9)	Find fraction of good and bad feedback:

SELECT 
    Message,
    COUNT(*) AS Total_Feedback,
    COUNT(*) / (SELECT COUNT(*) FROM FEEDBACK) AS Fraction
FROM 
    FEEDBACK
GROUP BY 
    Message;

10)	To retrieve the users' names, contact information, ratings, and emails by joining the USER_TBL and FEEDBACK tables:

SELECT 
    U.F_name AS First_Name,
    U.L_name AS Last_Name,
    U.Contat_no AS Contact,
    F.Message AS Rating,
    F.Email
FROM 
    USER_TBL U
JOIN 
    FEEDBACK F ON U.Usr_id = F.Usr_id;



