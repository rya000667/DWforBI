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