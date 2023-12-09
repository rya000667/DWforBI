/******
Localhost Intercollegiate Athletics Database
*******/
DROP TABLE IF EXISTS eventplan;
DROP TABLE IF EXISTS eventRequest;
DROP TABLE IF EXISTS eventplanline;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS resourcetbl;
DROP TABLE IF EXISTS facility;
DROP TABLE IF EXISTS customer;
CREATE TABLE customer
(
    custno CHAR(4) NOT NULL,
    custname VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    internal bool NOT NULL,
    contact VARCHAR(50) NOT NULL,
    phone VARCHAR(7) NOT NULL,
    city VARCHAR (50) NOT NULL,
    state CHAR(2) NOT NULL,
    zip CHAR(5) NOT NULL,
    
CONSTRAINT PKcustno PRIMARY KEY (custno)
);

DROP TABLE IF EXISTS facility;
CREATE TABLE facility
(
    facno CHAR(4) NOT NULL,
    facname VARCHAR(50) NOT NULL,

CONSTRAINT PKfacno PRIMARY KEY (facno),
CONSTRAINT UNIQUEfacname UNIQUE (facname)
);

DROP TABLE IF EXISTS resourcetbl;
CREATE TABLE resourcetbl
(
    resno CHAR(4) NOT NULL,
    resname VARCHAR(20) NOT NULL,
    rate DECIMAL(10,2) NOT NULL,

CONSTRAINT PKresno PRIMARY KEY (resno)
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee
(
    empno CHAR(4) NOT NULL,
    empname VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(10) NOT NULL,

CONSTRAINT PKempno PRIMARY KEY (empno)
);

DROP TABLE IF EXISTS location;
CREATE TABLE location
(
    locno CHAR(4) NOT NULL,
    facno CHAR(4) NOT NULL,
    locname VARCHAR(2) NOT NULL,

CONSTRAINT PKlocno PRIMARY KEY (locno),
FOREIGN KEY (facno) REFERENCES facility
);


DROP TABLE IF EXISTS eventplanline;
CREATE TABLE eventplanline
(
    planno CHAR(4) NOT NULL,
    lineno CHAR(1) NOT NULL,
    timestart TIMESTAMP with time zone NOT NULL,
    timeend timestamp with time zone NOT NULL,
    numberfld CHAR(1) NOT NULL,
    locno CHAR(4) NOT NULL,
    resno CHAR(4) NOT NULL,

CONSTRAINT PKplannoline PRIMARY KEY (planno),
CONSTRAINT fk_locno FOREIGN KEY (locno) REFERENCES location,
CONSTRAINT fk_resno FOREIGN KEY (resno) REFERENCES resourcetbl
);


DROP TABLE IF EXISTS eventRequest;
CREATE TABLE eventRequest
(
    eventno CHAR(4) NOT NULL,
    dateheld DATE,
    datereq DATE NOT NULL,
    facno CHAR(4) NOT NULL,
    custno CHAR(4) NOT NULL,
    dateauth DATE,
    status VARCHAR(10),
    estcost DECIMAL(10,2) NOT NULL,
    estaudience INTEGER NOT NULL,
    budno CHAR(5) NOT NULL,


CONSTRAINT PKeventno PRIMARY KEY (eventno),
FOREIGN KEY (custno) REFERENCES customer,
FOREIGN KEY (facno) REFERENCES facility 
);

DROP TABLE IF EXISTS eventplan;
CREATE TABLE eventplan
(
    planno CHAR(4) NOT NULL,
    eventno CHAR(4) NOT NULL,
    workdate DATE NOT NULL,
    notes VARCHAR(50) NOT NULL,
    activity VARCHAR(10) NOT NULL,
    empno CHAR(4) NOT NULL,

CONSTRAINT PKplanno PRIMARY KEY (planno),
FOREIGN KEY (eventno) REFERENCES eventrequest,
FOREIGN KEY (empno) REFERENCES employee
);
