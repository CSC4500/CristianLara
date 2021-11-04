DROP DATABASE IF EXISTS HomeWork;
CREATE DATABASE HomeWork;

USE HomeWork;

/*
I should drop from store information the foreign keys
Then put those in correspoding tables. One to many on many side it only needs it other side it shouldn't need it


*/

CREATE TABLE Customer (
    CustID INT PRIMARY KEY AUTO_INCREMENT,
    Lname VARCHAR(25) NOT NULL,
    Fname VARCHAR(25) NOT NULL,
    PhoneNumber VARCHAR(50) NOT NULL,
    Address1 VARCHAR(50) NOT NULL,
    Address2 VARCHAR(50),
    ZipCode VARCHAR(20) NOT NULL,
    State CHAR(2) NOT NULL
);



CREATE TABLE Store_Information (
    StoreId INT PRIMARY KEY AUTO_INCREMENT,
    StoreName VARCHAR(50) NOT NULL,
    StoreAddress1 VARCHAR(50) NOT NULL,
    StoreAddress2 VARCHAR(50),
    ZipCode VARCHAR(20) NOT NULL,
    State CHAR(2) NOT NULL,
    StoreHours INT NOT NULL,
    OwnerName VARCHAR(50) NOT NULL
);
CREATE TABLE Crew (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Lname VARCHAR(25) NOT NULL,
    Fname VARCHAR(25) NOT NULL,
    AvailHours INT NOT NULL,
    PhoneNumb VARCHAR(50) NOT NULL,
    Address1 VARCHAR(50) NOT NULL,
    Address2 VARCHAR(50),
    ZipCode VARCHAR(20) NOT NULL,
    State CHAR(2) NOT NULL,
    EmergencyContactname VARCHAR(50),
    EmergencyPhoneNumb VARCHAR(50) NOT NULL,
    BenefitsDescription VARCHAR(100) NOT NULL,
    PositionHeld VARCHAR(50) NOT NULL,
    StoreId INT NOT NULL,
    CONSTRAINT locationStore3 FOREIGN KEY (StoreID)
        REFERENCES Store_Information (StoreID)
);


CREATE TABLE Shipment_Facts (
    ShipmentID INT PRIMARY KEY AUTO_INCREMENT,
    ArrivalDate DATE NOT NULL,
    ExpirationDate DATE NOT NULL,
    StoreDirection INT NOT NULL
);
CREATE TABLE Soap_Bar_Inventory (
    ProdID INT PRIMARY KEY AUTO_INCREMENT,
    ShipmentID INT NOT NULL,
    BarName VARCHAR(25) NOT NULL,
    BarType VARCHAR(25) NOT NULL,
    CostToComp VARCHAR(50) NOT NULL,
    Inventory INT NOT NULL,
    CostToBuyer VARCHAR(50) NOT NULL,
    StoreID INT NOT NULL,
    CONSTRAINT Soap_Exp FOREIGN KEY (ShipmentID)
        REFERENCES Shipment_Facts (ShipmentID),
    CONSTRAINT locationStore FOREIGN KEY (StoreID)
        REFERENCES Store_Information (StoreID)
);
CREATE TABLE Sales (
    ReceiptNumber INT PRIMARY KEY AUTO_INCREMENT,
    CustID INT NOT NULL,
    PurchaseDate DATE NOT NULL,
    TotalPrice VARCHAR(50) NOT NULL,
    Product_ID INT NOT NULL,
    StoreID INT NOT NULL,
    CONSTRAINT Customer_Matching_Info FOREIGN KEY (CustID)
        REFERENCES Customer (CustID),
    CONSTRAINT Product_Matching_Info FOREIGN KEY (Product_ID)
        REFERENCES Soap_Bar_Inventory (ProdID),
    CONSTRAINT locationStores FOREIGN KEY (StoreID)
        REFERENCES Store_Information (StoreID)
);
alter table Shipment_Facts add constraint StoreDire foreign key (StoreDirection) references Store_Information(StoreId);
alter table Crew add constraint MatchStore foreign key (StoreId) references Store_Information(StoreId);

/* Store_Information Table */
insert into Store_Information (StoreName,StoreAddress1,StoreAddress2,ZipCode,State,StoreHours,OwnerName) values('Soap4Days','262 Jefferson Ave','Building B','60018','IL','50','Cristian Lara');

/*Customer Table Data*/
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Rao', 'Terri-jo', '410-985-1123', '93 Pankratz Alley', '32152', '21216', 'MD');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Fahrenbacher', 'Wake', '409-416-6116', '94582 Coleman Junction', '24670', '77554', 'TX');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Huckfield', 'Aretha', '410-942-1408', '15 Clyde Gallagher Court', '3', '21405', 'MD');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Bewsy', 'Antone', '850-712-0523', '70627 Hoepker Place', '0', '32590', 'FL');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Fettiplace', 'Jessey', '916-514-4389', '7 Green Drive', null, '94291', 'CA');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Corinton', 'Carling', '512-471-8992', '0 Hauk Court', '4', '78732', 'TX');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Lagne', 'Reginald', '651-703-2490', '7338 Quincy Hill', null, '55146', 'MN');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Ivatts', 'Fidelity', '915-962-7440', '092 Brentwood Lane', '46', '79994', 'TX');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Clell', 'Collin', '913-288-3379', '664 Jay Point', '021', '66225', 'KS');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Libby', 'Jody', '414-852-2024', '80 Leroy Place', null, '53220', 'WI');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Bernardin', 'Neville', '360-129-7706', '32 Green Ridge Avenue', '347', '98682', 'WA');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Oram', 'Inez', '860-105-5895', '47324 Fuller Parkway', '5', '06160', 'CT');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Pawelski', 'Rhiamon', '951-527-0110', '805 Meadow Vale Drive', null, '92519', 'CA');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Pead', 'Ramona', '973-690-2291', '822 Nelson Drive', '8', '07505', 'NJ');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Colledge', 'Angela', '585-418-9797', '0534 Green Ridge Park', '60', '14624', 'NY');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Guerrero', 'Currey', '734-763-1608', '7437 Fallview Terrace', '51649', '48107', 'MI');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Semor', 'Sydney', '915-807-4729', '7527 Cottonwood Parkway', '1244', '88584', 'TX');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Nielson', 'Christyna', '803-157-1691', '8250 Holmberg Plaza', '06402', '29805', 'SC');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('MacParland', 'Sharyl', '281-373-5461', '7904 Brickson Park Alley', '809', '77085', 'TX');
insert into Customer (Lname, Fname, PhoneNumber, Address1, Address2, ZipCode, State) values ('Fontaine', 'Gerri', '513-493-3321', '177 Debs Terrace', '9', '45243', 'OH');

/*Crew Data*/
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('LeEstut', 'Gerek', '40', '530-759-9106', '5 Hanson Place', '2706', '95833', 'CA', 'Gerek LeEstut', '240-350-6390', 'Bryant Ranch Prepack', 'Manager', 1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Ricca', 'Sari', '40', '804-755-5509', '2315 Mccormick Lane', '2', '23260', 'VA', 'Sari Ricca', '253-356-2214', 'Cadila Healthcare Limited', 'Manager',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Beeckx', 'Justina', '40', '805-945-2926', '32792 West Park', '1', '93111', 'CA', 'Justina Beeckx', '714-167-7061', 'The Procter & Gamble Manufacturing Company', 'Manager',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Wermerling', 'Bone', '40', '713-568-8660', '34 Stone Corner Court', null, '77085', 'TX', 'Bone Wermerling', '949-496-5813', 'WALGREEN CO.', 'Manager',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Deschlein', 'Maritsa', '20', '860-869-9483', '5017 Sunnyside Center', '92407', '06127', 'CT', 'Maritsa Deschlein', '512-883-0896', 'Tarte Inc', 'Cashier',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Templeman', 'Richmond', '20', '937-475-7196', '3817 Thierer Terrace', '449', '45505', 'OH', 'Richmond Templeman', '619-301-9687', 'MedVantx, Inc.', 'Cashier',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Hanhard', 'Vittoria', '20', '540-898-0554', '472 Norway Maple Way', '12', '24029', 'VA', 'Vittoria Hanhard', '406-320-6825', 'Be Better Networks', 'Cashier',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Henrys', 'Charo', '40', '203-260-0632', '655 Steensland Court', '2', '06538', 'CT', 'Charo Henrys', '915-934-8151', 'Sion Biotext Medical Ltd', 'Cashier',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Colcomb', 'Carmine', '40', '513-289-7425', '975 Straubel Place', '82', '45218', 'OH', 'Carmine Colcomb', '505-544-3676', 'Amerisource Bergen', 'Cashier',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Stirman', 'Jabez', '40', '318-542-8486', '0229 Dennis Drive', '37304', '71115', 'LA', 'Jabez Stirman', '317-905-6538', 'General Injectables & Vaccines, Inc', 'Stocker',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Aimer', 'Brion', '20', '858-398-9715', '198 Kipling Point', '9605', '92145', 'CA', 'Brion Aimer', '816-153-9787', 'NONE', 'Stocker',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Kedwell', 'Vivian', '20', '801-632-0999', '4 Donald Lane', '8550', '84140', 'UT', 'Vivian Kedwell', '727-623-7532', 'CVS Pharmacy', 'Stocker',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Deavin', 'Tanny', '40', '786-128-8339', '9832 Victoria Alley', null, '33233', 'FL', 'Tanny Deavin', '202-453-2548', 'Bristol-Myers Squibb de Mexico, S. de R.L. de C.V.', 'Stocker',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Laroux', 'Ozzy', '20', '209-122-3988', '47721 Maywood Place', '210', '95219', 'CA', 'Ozzy Laroux', '214-886-3642', 'McKesson', 'Stocker',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Champion', 'Andras', '40', '215-855-3395', '97 Carey Avenue', null, '19191', 'PA', 'Andras Champion', '682-640-1487', 'A-S Medication Solutions LLC', 'Float',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Muccino', 'Gerardo', '20', '404-638-5726', '62 Bobwhite Parkway', '67456', '30336', 'GA', 'Gerardo Muccino', '336-243-0119', 'NONE', 'Float',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('March', 'Joline', '40', '408-176-9573', '899 Warrior Court', null, '95150', 'CA', 'Joline March', '850-415-9358', 'Apotex Corp.', 'Float',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Durning', 'Meggi', '20', '602-267-5712', '986 Stuart Avenue', null, '85383', 'AZ', 'Meggi Durning', '336-632-1048', 'Walgreens Company', 'Float',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Francais', 'Yancey', '40', '202-101-8520', '079 Weeping Birch Park', null, '20508', 'DC', 'Yancey Francais', '386-903-2993', 'Wal-Mart Stores Inc', 'Float',1);
insert into Crew (Lname, Fname, AvailHours, PhoneNumb, Address1, Address2, ZipCode, State, EmergencyContactname, EmergencyPhoneNumb, BenefitsDescription, PositionHeld, StoreID) values ('Bernardon', 'Tanny', '20', '602-438-8529', '7118 Crescent Oaks Terrace', '954', '85099', 'AZ', 'Tanny Bernardon', '813-106-3575', 'Ranbaxy Pharmaceuticals Inc.', 'Stocker',1);

/*Shipment Facts*/
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ('2021-10-01', '2021-10-17', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ('2021-04-15', '2021-03-04', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ('2020-11-08', '2021-08-20', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ('2020-12-19', '2021-01-16', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ('2020-11-06', '2021-07-15', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ('2021-02-08', '2021-05-02', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ('2021-07-26', '2021-02-13', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ( '2021-03-27', '2021-04-25', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ( '2021-09-30', '2021-07-16', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ( '2020-11-13', '2021-07-20', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ( '2021-03-17', '2021-04-04', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ( '2021-05-30', '2020-11-28', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ( '2021-05-24', '2021-08-28', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ( '2021-03-26', '2021-02-03', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ( '2021-10-29', '2021-07-18', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ( '2021-01-01', '2021-10-04', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ( '2020-12-20', '2021-01-20', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ('2021-10-17', '2021-02-03', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ( '2021-09-13', '2021-10-12', 1);
insert into Shipment_Facts ( ArrivalDate, ExpirationDate, StoreDirection) values ( '2020-11-21', '2020-11-09', 1);

insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (1, 'Calming ', 'Oily Skin', '$4.89', 235, '$6.59', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (2, 'Cucumber ', 'Oily Skin','$8.71', 53, '$9.00', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (3, 'Almond Butter ', 'Oily Skin', '$1.70', 513, '$0.85', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (4, 'Shea Butter ', 'Oily Skin', '$7.72', 124, '$5.37', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (5, 'Calming ', 'Oily Skin', '$4.78', 125, '$7.47', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (6, 'Cucumber ', 'Oily Skin', '$9.07', 236, '$7.98', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (7, 'Almond Butter ', 'Oily Skin', '$5.63', 37, '$2.02', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (8, 'Shea Butter ', 'Dry Skin', '$5.29', 68, '$0.90', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (9, 'Deep clean', 'Dry Skin', '$1.01', 912, '$3.02', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (10, 'Calming ', 'Dry Skin', '$5.97', 140, '$5.54', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (11, 'Cucumber', 'Dry Skin', '$2.32', 131, '$9.33', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (12, 'Almond Butter ', 'Dry Skin', '$8.61', 112, '$6.94', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (13, 'Shea Butter ', 'Dry Skin', '$2.77', 123, '$1.09', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (14, 'Deep clean', 'Dry Skin', '$3.29', 124, '$8.74', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (15, 'Calming ', 'Sensitive Skin', '$5.95', 1325, '$7.73', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (16, 'Cucumber ', 'Sensitive Skin', '$3.24', 1622, '$2.18', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (17, 'Almond Butter ', 'Sensitive Skin', '$9.94', 157, '$3.28', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (18, 'Shea Butter ', 'Sensitive Skin', '$1.71', 138, '$7.20', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (19, 'Deep clean', 'Sensitive Skin', '$4.35', 129, '$8.78', 1);
insert into Soap_Bar_Inventory (ShipmentID, BarName, BarType, CostToComp, Inventory, CostToBuyer, StoreID) values (20, 'no smell ', 'Sensitive Skin', '$6.57', 240, '$8.34', 1);

/*Sales Data*/
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (1, '2021-08-20', '$46.49', 1, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (2, '2021-02-08', '$10.98', 2, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (3, '2021-05-26', '$99.74', 3, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (4, '2021-08-06', '$20.00', 4, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (5, '2021-05-08', '$20.01', 5, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (6, '2020-12-13', '$24.22', 6, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (7, '2021-03-25', '$94.91', 7, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (8, '2020-12-18', '$12.64', 8, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (9, '2021-01-21', '$16.28', 9, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (10, '2021-06-02', '$70.72', 10, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (11, '2021-02-01', '$26.23', 11, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (12, '2021-04-22', '$98.24', 12, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (13, '2020-12-08', '$93.08', 13, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (14, '2021-10-07', '$60.57', 14, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (15, '2021-04-04', '$85.05', 15, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (16, '2021-10-06', '$77.09', 16, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (17, '2021-03-11', '$83.03', 17, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (18, '2021-06-22', '$69.53', 18, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (19, '2021-09-30', '$96.88', 19, 1);
insert into Sales (CustID, PurchaseDate, TotalPrice, Product_ID, StoreID) values (20, '2021-09-20', '$51.05', 20, 1);