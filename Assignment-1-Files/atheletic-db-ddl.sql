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

CREATE TABLE customer(
    custno VARCHAR(8),
    custname VARCHAR(50) CONSTRAINT custnameNotNull NOT NULL,
    address VARCHAR(50) CONSTRAINT addressNotNull NOT NULL,
    city VARCHAR (30) CONSTRAINT cityNotNull NOT NULL,
    state CHAR(2) CONSTRAINT stateNotNull NOT NULL,
    zip VARCHAR(10) DEFAULT '80202' NOT NULL,
    phone VARCHAR(11) CONSTRAINT phoneNotNull NOT NULL,
    contact VARCHAR(35) CONSTRAINT contactNotNull NOT NULL,
    internal CHAR(1) DEFAULT 'Y' NOT NULL,
CONSTRAINT PKcustno PRIMARY KEY (custno)
);

DROP TABLE IF EXISTS facility;
CREATE TABLE facility
(
    facno CHAR(4) NOT NULL,
    facname VARCHAR(50) CONSTRAINT facnameNotNull NOT NULL,

CONSTRAINT PKfacno PRIMARY KEY (facno),
CONSTRAINT UNIQUEfacname UNIQUE (facname)
);

DROP TABLE IF EXISTS resourcetbl;
CREATE TABLE resourcetbl
(
    resno VARCHAR(8) NOT NULL,
    resname VARCHAR(30) CONSTRAINT resnameNotNull NOT NULL,
    rate DECIMAL(10,2) DEFAULT 1 NOT NULL,

CONSTRAINT PKresno PRIMARY KEY (resno),
CONSTRAINT UniqueResName UNIQUE (resname)
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee
(
    empno VARCHAR(8),
    empname VARCHAR(50) CONSTRAINT empNameNotNull NOT NULL,
    department VARCHAR(25) CONSTRAINT departmentNotNull NOT NULL,
    email VARCHAR(30) CONSTRAINT emailNotNull NOT NULL,
    phone VARCHAR(11)  CONSTRAINT phoneNotNull NOT NULL,
    mgrno VARCHAR(11),

CONSTRAINT PKempno PRIMARY KEY (empno),
CONSTRAINT UniqueEmail UNIQUE(email),
CONSTRAINT FKmgrno FOREIGN KEY (mgrno) REFERENCES employee(empno)
);

DROP TABLE IF EXISTS location;
CREATE TABLE location
(
    locno VARCHAR(8) NOT NULL,
    facno VARCHAR(8) CONSTRAINT facnoNotNull NOT NULL,
    locname VARCHAR(30) CONSTRAINT locnameNotNull NOT NULL,

CONSTRAINT PKlocno PRIMARY KEY (locno),
FOREIGN KEY (facno) REFERENCES facility
);


DROP TABLE IF EXISTS eventplanline;
CREATE TABLE eventplanline
(
    planno VARCHAR(8),
    lineno INTEGER NOT NULL,
    timestart TIMESTAMP with time zone CONSTRAINT timestartNotNull NOT NULL,
    timeend timestamp with time zone CONSTRAINT timeendNotNull NOT NULL,
    resourcecnt INTEGER CONSTRAINT resourcecntNotNull NOT NULL,
    locno CHAR(4) NOT NULL,
    resno CHAR(4) NOT NULL,

CONSTRAINT PKplannolineno PRIMARY KEY (planno, lineno),
CONSTRAINT fk_locno FOREIGN KEY (locno) REFERENCES location,
CONSTRAINT fk_resno FOREIGN KEY (resno) REFERENCES resourcetbl
);


DROP TABLE IF EXISTS eventRequest;
CREATE TABLE eventRequest
(
    eventno VARCHAR(8),
    dateheld DATE CONSTRAINT dateheldNotNull NOT NULL,
    datereq DATE DEFAULT CURRENT_DATE,
    facno VARCHAR(8) CONSTRAINT facnoNotNull NOT NULL,
    custno VARCHAR(8) CONSTRAINT custNoNotNull NOT NULL,
    dateauth DATE,
    status VARCHAR(10) DEFAULT 'PENDING' NOT NULL,
    estcost DECIMAL(10,2) CONSTRAINT estCostNotNull NOT NULL,
    estaudience INTEGER CONSTRAINT estAudienceNotNull NOT NULL,
    budno CHAR(5) NOT NULL,


CONSTRAINT PKeventno PRIMARY KEY (eventno),
FOREIGN KEY (custno) REFERENCES customer,
FOREIGN KEY (facno) REFERENCES facility,
CONSTRAINT Check_Status CHECK(status IN('PENDING', 'DENIED', 'APPROVED'))
);

DROP TABLE IF EXISTS eventplan;
CREATE TABLE eventplan
(
    planno VARCHAR(8),
    eventno VARCHAR(8) CONSTRAINT eventnoNotNull NOT NULL,
    workdate DATE CONSTRAINT workdateNotNull NOT NULL,
    notes VARCHAR(50) CONSTRAINT notesNotNull NOT NULL,
    activity VARCHAR(50) CONSTRAINT activityNotNull NOT NULL,
    empno VARCHAR(4),

CONSTRAINT PKplanno PRIMARY KEY (planno),
FOREIGN KEY (eventno) REFERENCES eventrequest ON DELETE CASCADE,
FOREIGN KEY (empno) REFERENCES employee
);


