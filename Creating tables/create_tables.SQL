RELATIONAL MODEL IMPLEMENTATION:
1)	TAXI
CREATE TABLE TAXI (
	Taxi_id integer NOT NULL,
	Registration_no VARCHAR(20),
	Taxi_Model VARCHAR(20),
	Taxi_Year DATE,
	Taxi_type VARCHAR(20),
	Status VARCHAR(20),
	Driver_id integer,
	Constraint PK_Taxi PRIMARY KEY (Taxi_id),
	Constraint Unq_Reg UNIQUE (Registration_no)
);
2)	USER_TBL
CREATE TABLE  USER_TBL (
	Usr_id integer NOT NULL,
	F_name VARCHAR(20),
	L_name VARCHAR(20),
	Contat_no integer,
	Gender VARCHAR(10),
	Address VARCHAR(50),
	Taxi_id integer,
	Constraint PK_User PRIMARY KEY (Usr_id)
);
3)	DRIVER
CREATE TABLE   DRIVER (
	Driver_id integer NOT NULL,
	F_name VARCHAR(10),
	L_name VARCHAR(20),
	Gender VARCHAR(10),
	Conatct_no VARCHAR(20),
	Rating integer,
	Age integer,
	Constraint PK_Driver PRIMARY KEY (Driver_id)
);
4)	TRIP_DETAILS
CREATE TABLE  TRIP_DETAILS (
	Trip_id integer NOT NULL,
	Trip_date DATE,
	Trip_amt decimal(10,2),
	Driver_id integer,
	Usr_id integer,
	Taxi_id integer,
	Strt_time TIMESTAMP,
	End_time TIMESTAMP,
	Constraint PK_Trip PRIMARY KEY (Trip_id)
);


5)	BILL DETAILS
CREATE TABLE BILL_DETAILS (
	Bill_no integer NOT NULL,
	Bill_date DATE,
	Advance_amt decimal(10,2),
	Discount_amt decimal(10,2),
	Total_amt decimal(10,2),
	Usr_id integer,
	Trip_id integer,
	Constraint PK_Bill PRIMARY KEY (Bill_no),
	Constraint Unq_Trip UNIQUE (Trip_id)
);
6)	CUSTOMER SERVICE
CREATE TABLE  CUSTOMER_SERVICE (
	Emp_id integer NOT NULL,
	F_name VARCHAR(20),
	L_name VARCHAR(20),
	Constraint PK_Emp PRIMARY KEY (Emp_id)
);
7)	FEEDBACK
CREATE TABLE  FEEDBACK (
	Fbk_id integer NOT NULL,
	Message VARCHAR(140),
	Email VARCHAR(50),
	Emp_id integer,
	Usr_id integer,
	Trip_id integer,
	Constraint PK_Fbk PRIMARY KEY (Fbk_id),
	Constraint Unq_emp UNIQUE (Emp_id)
);
