-- Assignment One DDL File
CREATE TABLE Employee
(
    EmpNo CHAR(4) NOT NULL,
    EmpName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Phone VARCHAR(10) NOT NULL,

CONSTRAINT PK_EmpNo PRIMARY KEY (EmpNo)
);