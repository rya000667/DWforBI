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