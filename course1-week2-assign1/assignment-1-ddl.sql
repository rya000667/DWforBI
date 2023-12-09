-- Create Customer Table

CREATE TABLE Customer 
(CustNo VARCHAR(8), 
 CustName VARCHAR(30) CONSTRAINT CustNameNotNull NOT NULL, 
 Address VARCHAR(50) CONSTRAINT AddressNotNull NOT NULL, 
 Internal CHAR(1) CONSTRAINT InternalNotNull NOT NULL, 
 Contact VARCHAR(35) CONSTRAINT ContractNotNull NOT NULL, 
 Phone VARCHAR(11) CONSTRAINT CPhoneNotNull NOT NULL, 
 City VARCHAR(30) CONSTRAINT CityNotNull NOT NULL,
 State VARCHAR(2) CONSTRAINT StateNotNull NOT NULL, 
 Zip VARCHAR(10) CONSTRAINT zipNotNull NOT NULL,
  CONSTRAINT PK_CUSTOMER PRIMARY KEY (CustNo) ) ;

-- Create Facility Table
CREATE TABLE Facility(
    facno VARCHAR(4) CONSTRAINT facnoNotNull NOT NULL,
    facname VARCHAR(30) CONSTRAINT facnameNotNull NOT NULL,
        CONSTRAINT PK_FACILITY PRIMARY KEY (facno),
        CONSTRAINT Unique_FacName UNIQUE(facname)
);

-- Create Location Table
CREATE TABLE Location(
    locno VARCHAR(4) CONSTRAINT locnoNotNull NOT NULL,
    facno VARCHAR(4) CONSTRAINT facnoNotNull NOT NULL,
    locname VARCHAR(30) CONSTRAINT locnameNotNull NOT NULL,
        CONSTRAINT PK_LOCATION PRIMARY KEY (locno),
        CONSTRAINT FK_FACNO FOREIGN KEY (facno) REFERENCES Facility(facno)
);

-- Alternative Customer Table
CREATE TABLE CustomerBalance(
    custno VARCHAR(30) CONSTRAINT custnoNotNull NOT NULL,
    custFirstName VARCHAR(20) CONSTRAINT custFirstNameNotNull NOT NULL,
    custLastName VARCHAR(30) CONSTRAINT custLastNameNotNull NOT NULL,
    custCity VARCHAR(30) CONSTRAINT custCityNotNull NOT NULL,
    custState VARCHAR(2) CONSTRAINT custStateNotnull NOT NULL,
    custZip VARCHAR(8) CONSTRAINT custZipNotNull NOT NULL,
    custBal DECIMAL(12,2),
        CONSTRAINT PKCustomer PRIMARY KEY (custno)
);


-- Employee Table
CREATE TABLE Employee
  ( EmpNo 	 CHAR(8),
     EmpFirstName VARCHAR2(20) CONSTRAINT EmpFirstNameRequired NOT NULL,
     EmpLastName VARCHAR2(30) CONSTRAINT EmpLastNameRequired NOT NULL,
     EmpPhone		 CHAR(15),
     EmpEMail		 VARCHAR(50) CONSTRAINT EmpEmailRequired NOT NULL,
CONSTRAINT PKEmployee PRIMARY KEY (EmpNo),
CONSTRAINT UniqueEMail UNIQUE (EmpEMail) );



-- Order Table
CREATE TABLE OrderTbl
 ( OrdNo 	CHAR(8),
    OrdDate	DATE CONSTRAINT OrdDateRequired NOT NULL,
    CustNo		CHAR(8),
    EmpNo	CHAR(8),
CONSTRAINT PKOrderTbl PRIMARY KEY (OrdNo) ,
CONSTRAINT FKCustNo FOREIGN KEY (CustNo) REFERENCES Customer,
CONSTRAINT FKEmpNo FOREIGN KEY (EmpNo) REFERENCES Employee 
 );




