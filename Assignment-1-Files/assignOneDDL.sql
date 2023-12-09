-- Assignment One DDL File
CREATE TABLE Employee
(
    EmpNo CHAR(4) NOT NULL,
    EmpFirstName VARCHAR(20) CONSTRAINT EmpFirstNameRequired NOT NULL,
    EmpLastName VARCHAR(30) CONSTRAINT EmpLastNameRequired NOT NULL,
    EmpPhone CHAR(15),
    EmpEMail VARCHAR2(50) CONSTRAINT EmpEmailRequired NOT NULL,

CONSTRAINT PK_EmpNo PRIMARY KEY (EmpNo),
CONSTRAINT UniqueEMail UNIQUE (EmpEMail)
);

-- Create Customer Table
CREATE TABLE Customer
( CustNo CHAR(8),
CustFirstName VARCHAR(20) CONSTRAINT CustFirstNameRequired NOT NULL,
CustLastName VARCHAR(30) CONSTRAINT CustLastNameRequired NOT NULL,
CustCity VARCHAR(30),
CustState CHAR(2),
CustZip CHAR(10),
CustBal DECIMAL(12,2)
CONSTRAINT PKCustomer PRIMARY KEY (CustNo) );

-- Create Order Table
CREATE TABLE OrderTbl(
    OrdNo CHAR(8),
    OrdDate DATE CONSTRAINT OrdDateRequired NOT NULL,
    CustNo CHAR(8) CONSTRAINT CustNoRequired NOT NULL,
    EmpNo CHAR(8),
CONSTRAINT PKOrderTbl PRIMARY KEY(OrdNo),
CONSTRAINT FKCustNo FOREIGN KEY (CustNo) REFERENCES Customer,
CONSTRAINT FKEmpNo FOREIGN KEY (EmpNo) REFERENCES Employee
);

-- Create EventPlanRequest Table
CREATE TABLE EventRequest
(
    EventNo CHAR(4) NOT NULL,
    DateHeld DATE,
    DateReq DATE NOT NULL,
    FacNo CHAR(4) NOT NULL,
    CustNo CHAR(4) NOT NULL,
    DateAuth DATE,
    Status VARCHAR(10) NOT NULL,
    EstCost DECIMAL(10,2) NOT NULL,
    EstAudience INTEGER NOT NULL CHECK(EstAudience>0),
    BudNo CHAR(5),


CONSTRAINT PK_EventNo PRIMARY KEY (EventNo),
CONSTRAINT FK_CustNo FOREIGN KEY (CustNo) REFERENCES Customer,
CONSTRAINT Check_Status CHECK(Status IN('Pending', 'Denied', 'Approved'))
);

-- Create Resource Table
CREATE TABLE ResourceTbl
(
    ResNo CHAR(4) NOT NULL,
    ResName VARCHAR(20) NOT NULL,
    Rate DECIMAL(10,2) NOT NULL,

CONSTRAINT PK_ResNo PRIMARY KEY (ResNo),
CONSTRAINT Check_Rate CHECK(Rate>0)
);

-- Create EventPlan Table
CREATE TABLE EventPlan
(
    PlanNo CHAR(4) NOT NULL,
    EventNo CHAR(4) NOT NULL,
    WorkDate DATE NOT NULL,
    Notes VARCHAR(50),
    Activity VARCHAR(10) NOT NULL,
    EmpNo CHAR(4),

CONSTRAINT PK_PlanNo PRIMARY KEY (PlanNo),
CONSTRAINT FK_EventNo FOREIGN KEY (EventNo) REFERENCES EventRequest,
CONSTRAINT FK_EmpNo FOREIGN KEY (EmpNo) REFERENCES Employee
);

-- Create EventPlanLine Table
CREATE TABLE EventPlanLine
(
    PlanNo CHAR(4) NOT NULL,
    LineNo CHAR(1) NOT NULL,
    TimeStart TIMESTAMP NOT NULL,
    TimeEnd TIMESTAMP NOT NULL,
    NumberFld CHAR(1) NOT NULL,
    LocNo CHAR(4) NOT NULL,
    ResNo CHAR(4) NOT NULL,

CONSTRAINT PK_PlanNo_LineNo PRIMARY KEY (PlanNo,LineNo),
CONSTRAINT FK_LocNo FOREIGN KEY (LocNo) REFERENCES Location,
CONSTRAINT FK_ResNo FOREIGN KEY (ResNo) REFERENCES ResourceTbl,
CONSTRAINT Check_TimeStart CHECK(TimeStart<TimeEnd),
CONSTRAINT Check_TimeStop CHECK(TimeEnd>TimeStart)
);
