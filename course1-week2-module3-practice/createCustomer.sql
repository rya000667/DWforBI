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
)