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