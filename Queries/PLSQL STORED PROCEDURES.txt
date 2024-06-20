PL/SQL STORED PROCEDURES:

1)	To book a taxi:

CREATE OR REPLACE PROCEDURE BOOK_TAXI(
 Name IN VARCHAR2,
 v_Address IN VARCHAR2,
 v_Contact IN VARCHAR2,
 Taxi_Model IN VARCHAR2,
 v_Gender IN VARCHAR2,
 Advance IN decimal)
AS
 v_usr_id INT := -1;
23
 v_Trip_id INT := -1;
 v_Bill_no INT := -1;
 v_Taxi_id INT := -1;
 v_Driver_id INT := -1;
BEGIN
 SELECT MAX(Usr_id) + 1 INTO v_usr_id FROM USER_TBL;
 SELECT MAX(Trip_id) + 1 INTO v_Trip_id FROM TRIP_DETAILS;
 SELECT MAX(Bill_no) + 1 INTO v_Bill_no FROM BILL_DETAILS;
 SELECT taxi_id, Driver_id INTO v_Taxi_id, v_Driver_id
 FROM TAXI
 WHERE Status = 'Available'
 AND Taxi_Model = Taxi_Model
 AND ROWNUM = 1; -- Added ROWNUM condition to ensure only one row is returned
 INSERT INTO USER_TBL VALUES(v_usr_id, SUBSTR(Name, 1, INSTR(Name, ' ', 1)),
SUBSTR(Name, INSTR(Name, ' ', 1) + 1, LENGTH(Name)), v_Contact, v_Gender, v_Address,
v_Taxi_id);
 INSERT INTO TRIP_DETAILS VALUES(v_Trip_id, sysdate, 50, v_Driver_id, v_usr_id, v_Taxi_id,
sysdate, null);
 INSERT INTO BILL_DETAILS VALUES(v_Bill_no, null, Advance, null, null, v_usr_id, v_Trip_id);
END;
/

2)	To store trip details after the trip ends:

CREATE OR REPLACE PROCEDURE TRIP_END(v_trip IN INT , v_discount IN
Decimal )
AS
 v_total_time INT := -1;
 v_bill_no INT :=-1;
BEGIN
 SELECT extract(day from (sysdate - Strt_time))*24 + extract(hour from (sysdate -
Strt_time)) INTO v_total_time FROM TRIP_DETAILS WHERE Trip_id = v_trip;
 UPDATE TRIP_DETAILS SET End_time = sysdate WHERE Trip_id = v_trip;
 UPDATE BILL_DETAILS SET Bill_date = sysdate , Discount_amt = v_discount ,
Total_amt = (v_total_time * 15) - v_discount WHERE Trip_id = v_trip;
END;
/
