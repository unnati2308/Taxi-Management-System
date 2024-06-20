PL/SQL STORED FUNCTIONS:

1)	To get full name of the driver using ID: 

CREATE OR REPLACE FUNCTION GetDriverFullName(driver_id_input IN NUMBER)
RETURN VARCHAR2
IS
    full_name VARCHAR2(50);
BEGIN
    SELECT F_name || ' ' || L_name INTO full_name FROM DRIVER WHERE Driver_id = driver_id_input;

    RETURN full_name;
END;
/

2)	To see number of feedbacks from a user ID:

CREATE OR REPLACE FUNCTION GetTotalFeedbacksForUser(user_id_input IN NUMBER)
RETURN NUMBER
IS
    total_feedbacks NUMBER;
BEGIN
    SELECT COUNT(*) INTO total_feedbacks FROM FEEDBACK WHERE Usr_id = user_id_input;
    
    RETURN total_feedbacks;
END;
/

3) To find total amount used by user:

CREATE OR REPLACE FUNCTION CalculateTotalAmountSpentByUser(user_id_input IN NUMBER)
RETURN DECIMAL
IS
    total_amount DECIMAL(10,2);
BEGIN
    SELECT SUM(Trip_amt) INTO total_amount FROM TRIP_DETAILS WHERE Usr_id = user_id_input;
    
    RETURN total_amount;
END;
/

4) Average trip amount by a certain type of car:

CREATE OR REPLACE FUNCTION CalculateAverageTripAmountForTaxiType(taxi_type_input IN VARCHAR2)
RETURN DECIMAL
IS
    avg_amount DECIMAL(10,2);
BEGIN
    SELECT AVG(Trip_amt) INTO avg_amount FROM TRIP_DETAILS 
    WHERE Taxi_id IN (SELECT Taxi_id FROM TAXI WHERE Taxi_type = taxi_type_input);
    
    RETURN avg_amount;
END;
/


