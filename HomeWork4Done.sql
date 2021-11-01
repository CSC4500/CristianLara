DROP DATABASE IF EXISTS HomeWork;
CREATE DATABASE HomeWork;

USE HomeWork;



CREATE TABLE Customer (
    CustID INT PRIMARY KEY,
    Lname VARCHAR(25) NOT NULL,
    Fname VARCHAR(25) NOT NULL,
    PhoneNumber VARCHAR(50) NOT NULL,
    Address1 VARCHAR(50) NOT NULL,
    Address2 VARCHAR(50),
    ZipCode VARCHAR(20) NOT NULL,
    State CHAR(2) NOT NULL
);
CREATE TABLE Crew (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Lname VARCHAR(25) NOT NULL,
    Fname VARCHAR(25) NOT NULL,
    AvailHours INT NOT NULL,
    PhoneNumb INT NOT NULL,
    Address1 VARCHAR(50) NOT NULL,
    Address2 VARCHAR(50),
    ZipCode VARCHAR(20) NOT NULL,
    State CHAR(2) NOT NULL,
    EmergencyContactname VARCHAR(50),
    EmergencyPhoneNumb INT NOT NULL,
    BenefitsDescription VARCHAR(100) NOT NULL,
    PositionHeld VARCHAR(50) NOT NULL,
    StoreId INT NOT NULL
);


CREATE TABLE Store_Information (
    StoreId INT PRIMARY KEY AUTO_INCREMENT,
    StoreName VARCHAR(50) NOT NULL,
    StoreAddress1 VARCHAR(50) NOT NULL,
    StoreAddress2 VARCHAR(50),
    ZipCode VARCHAR(20) NOT NULL,
    State CHAR(2) NOT NULL,
    EmployeeId INT NOT NULL,
    StoreHours INT NOT NULL,
    OwnerName VARCHAR(50) NOT NULL,
    ProdId INT NOT NULL,
    ShipmentID INT NOT NULL,
    ReceiptNumber INT NOT NULL
);
CREATE TABLE Shipment_Facts (
    ShipmentID INT PRIMARY KEY AUTO_INCREMENT,
    ProdId INT NOT NULL,
    ProdCount INT NOT NULL,
    ArrivalDate DATE NOT NULL,
    ExpirationDate DATE NOT NULL,
    StoreDirection INT NOT NULL
);
CREATE TABLE Soap_Bar_Inventory (
    ProdID INT PRIMARY KEY AUTO_INCREMENT,
    ShipmentID INT NOT NULL,
    BarName VARCHAR(25) NOT NULL,
    BarType VARCHAR(25) NOT NULL,
    CostToComp FLOAT NOT NULL,
    Inventory INT NOT NULL,
    ReceiptNumber INT NOT NULL,
    CostToBuyer FLOAT NOT NULL,
    CONSTRAINT Soap_Exp FOREIGN KEY (ShipmentID)
        REFERENCES Shipment_Facts (ShipmentID)
);
CREATE TABLE Sales (
    ReceiptNumber INT PRIMARY KEY,
    CustID INT NOT NULL,
    PurchaseDate DATE NOT NULL,
    TotalPrice DOUBLE NOT NULL,
    Product_ID INT NOT NULL,
    CONSTRAINT Customer_Matching_Info FOREIGN KEY (CustID)
        REFERENCES Customer (CustID),
    CONSTRAINT Product_Matching_Info FOREIGN KEY (Product_ID)
        REFERENCES Soap_Bar_Inventory (ProdID)
);
alter table Soap_Bar_Inventory add constraint ReceiptNumb foreign key (ReceiptNumber) references Sales(Product_ID);
alter table Shipment_Facts add constraint StoreDire foreign key (StoreDirection) references Store_Information(StoreId);
alter table Shipment_Facts add constraint ProdTaken foreign key (ProdId) references Soap_Bar_Inventory(ProdID);
alter table Store_Information add constraint Employees foreign key (EmployeeId) references Crew(EmployeeId);
alter table Store_Information add constraint ProdSoldCount foreign key (ProdId) references Soap_Bar_Inventory(ProdId);
alter table Store_Information add constraint ShipmentComing foreign key (ShipmentID) references Shipment_Facts(ShipmentID);
alter table Store_Information add constraint SalesCount foreign key (ReceiptNumber) references Sales(ReceiptNumber);
alter table Crew add constraint MatchStore foreign key (StoreId) references Store_Information(StoreId);


