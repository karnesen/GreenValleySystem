USE greenValleyDB

--Create Tables
CREATE TABLE CUSTOMER
(
	customerID int PRIMARY KEY IDENTITY,
	firstName varchar(255),
	lastName varchar(255),

	phoneNumber varchar(10),
	phoneType varchar(11),
	email varchar(255),
	streetAddress varchar(255),
	city varchar(255),
	state varchar(255),
	zipcode varchar(255),

	initialContactType varchar(255),
	hearAbout varchar(255),
	initialContactDate DateTime,

	lastUpdated DateTime
)

CREATE TABLE CUSTOMERAUTH
(
	customerID int PRIMARY KEY FOREIGN KEY REFERENCES CUSTOMER(customerID),
	passwordHash varchar(256)
)

CREATE TABLE SERVICE
(
	serviceID int PRIMARY KEY IDENTITY,
	serviceOpenDate dateTime,
	serviceStatus bit,
	serviceDeadlineStart datetime,
	serviceDeadlineEnd datetime,
	lookAtDate dateTime,
	serviceType char,
	customerID int FOREIGN KEY REFERENCES CUSTOMER(customerID) NOT NULL,
	lastUpdated DateTime
)

CREATE TABLE AUCTION
(
	serviceID int PRIMARY KEY FOREIGN KEY REFERENCES SERVICE(serviceID),
	lastUpdated DateTime
)

CREATE TABLE MOVE
(
	serviceID int PRIMARY KEY FOREIGN KEY REFERENCES SERVICE(serviceID),
	lastUpdated DateTime
)

CREATE TABLE ADDRESSES
(
	addressID int PRIMARY KEY IDENTITY,
	streetAddress varchar(255),
	city varchar(255),
	state varchar(255),
	zipcode varchar(255),
	addressType varchar(2),
	serviceID int FOREIGN KEY REFERENCES Service(serviceID)
)

CREATE TABLE dates
(
	dateID int PRIMARY KEY IDENTITY,
	d datetime,
	serviceID int FOREIGN KEY REFERENCES Service(serviceID),
	serviceType char(1),
	description varchar(255),
)

CREATE TABLE AUCTIONEVENT
(
	auctionEventID int PRIMARY KEY IDENTITY,
	streetAddress varchar(255),
	city varchar(255),
	state varchar(255),
	zipcode varchar(255),
	auctionStartDate datetime,
	auctionEndDate datetime,
	auctionType varchar(255)
)


CREATE TABLE atAUCTION
(
	auctionEventID int FOREIGN KEY REFERENCES AUCTIONEVENT(auctionEventID),
	serviceID int FOREIGN KEY REFERENCES Service(serviceID),
	PRIMARY KEY(auctionEventID, serviceID)
)

CREATE TABLE EQUIPMENT
(
	equipmentID int PRIMARY KEY IDENTITY,
	equipmentType varchar(255),
	datePurchased date,
	active bit
)

CREATE TABLE utilizeEquipment
(
	equipmentID int FOREIGN KEY REFERENCES EQUIPMENT(equipmentID),
	serviceID int FOREIGN KEY REFERENCES SERVICE(serviceID)
)

CREATE TABLE EMPLOYEE
(
	employeeID int PRIMARY KEY IDENTITY,
	firstName varchar(255),
	lastName varchar(255),
	position varchar(255),
	email varchar(255),
	currentEmployee bit,
	PasswordHash varchar(256),
)

CREATE TABLE serviceToDo
(
	toDoID int PRIMARY KEY IDENTITY,
	status bit,
	task varchar(255),
	dateCreated dateTime,
	priority int,
	employeeID int FOREIGN KEY REFERENCES EMPLOYEE(employeeID),
	serviceID int FOREIGN KEY REFERENCES SERVICE(serviceID)
)


CREATE TABLE ASSIGNMENT
(
	assignmentID int PRIMARY KEY IDENTITY,
	employeeID int FOREIGN KEY REFERENCES EMPLOYEE(employeeID),
	serviceID int FOREIGN KEY REFERENCES Service(serviceID),
	startDate date,
	employeeRole text
)

CREATE TABLE TICKETNOTE
(
	ticketID int PRIMARY KEY IDENTITY,
	creationDate datetime,
	customerID int FOREIGN KEY REFERENCES Customer(customerID), 
	serviceID int FOREIGN KEY REFERENCES Service(serviceID),
	noteCreator int FOREIGN KEY REFERENCES EMPLOYEE(employeeID),
	noteTitle varchar(255),
	noteText text
)

--Fill Tables
--Employees
INSERT INTO EMPLOYEE VALUES ('Brad', 'Campbell', 'leader', 'jamesJ@gmail.com', 1, '1000:0t7km6zSzsP+DOwv9tJoFUztOs2xrZyt:8hzRYmrcVjc1K2IVqot3QyO3ZPk=')
INSERT INTO EMPLOYEE VALUES ('Sabastion', 'Sells', 'sales lead', 'sellsL@gmail.com', 1, '1000:0t7km6zSzsP+DOwv9tJoFUztOs2xrZyt:8hzRYmrcVjc1K2IVqot3QyO3ZPk=')
INSERT INTO EMPLOYEE VALUES ('Zach', 'Collins', 'customer coordinator', 'collinsG@gmail.com',1, '1000:0t7km6zSzsP+DOwv9tJoFUztOs2xrZyt:8hzRYmrcVjc1K2IVqot3QyO3ZPk=')
INSERT INTO EMPLOYEE VALUES ('Greg', 'Matthew', 'mover', 'matthewJ@gmail.com',1, '1000:0t7km6zSzsP+DOwv9tJoFUztOs2xrZyt:8hzRYmrcVjc1K2IVqot3QyO3ZPk=')
INSERT INTO EMPLOYEE VALUES ('Sam', 'Martin', 'auction lead', 'martinC@gmail.com',1, '1000:0t7km6zSzsP+DOwv9tJoFUztOs2xrZyt:8hzRYmrcVjc1K2IVqot3QyO3ZPk=')
INSERT INTO EMPLOYEE VALUES ('Scotty', 'Martin', 'auction lead', 'martinC@gmail.com',1, '1000:0t7km6zSzsP+DOwv9tJoFUztOs2xrZyt:8hzRYmrcVjc1K2IVqot3QyO3ZPk=')
--Equipment
INSERT INTO EQUIPMENT VALUES ('2015 Truck', '2015-1-4', 1)
INSERT INTO EQUIPMENT VALUES ('2011 Truck', '2020-3-5', 1)
INSERT INTO EQUIPMENT VALUES ('Cube', '2019-11-4', 1)
INSERT INTO EQUIPMENT VALUES ('GMC', '2018-2-20', 1)
INSERT INTO EQUIPMENT VALUES ('Green Truck', '2017-5-23', 1)
INSERT INTO EQUIPMENT VALUES ('Van', '2015-8-1', 1)
INSERT INTO EQUIPMENT VALUES ('Trailer', '2015-8-1', 1)
--Customer
INSERT INTO CUSTOMER VALUES ('Kirsi', 'Arnesen', '3216842834', 'Home', 'arnesekg@dukes.jmu.edu', '825 Dukes Way', 'Harrisonburg', 'VA', '22801', 'Phone', 'Friends', '2021-1-4 02:20:21', '2021-1-4 02:20:21')
INSERT INTO CUSTOMER VALUES ('John', 'Smith', '4568732019', 'Work', 'smithj@gmail.com', '735 Showker Court', 'Harrisonburg', 'VA', '22801', 'Text', 'Family', '2020-1-4 03:20:00', '2021-1-4 02:20:21')
INSERT INTO CUSTOMER VALUES ('Josh', 'Coleman', '1273489827', 'Cell', 'colemaje@dukes.jmu.edu', '928 Madison Street', 'Harrisonburg', 'VA', '22801', 'In Person', 'Facebook', '2021-2-4 02:40:00', '2021-1-4 02:20:21')
INSERT INTO CUSTOMER VALUES ('Greg', 'Brown', '9874738237', 'Home', 'gregbrown@yahoo.come', '893 Blue Ridge Way', 'Harrisonburg', 'VA', '22801', 'Email', 'Website', '2020-12-4 04:30:00', '2021-1-4 02:20:21')
INSERT INTO CUSTOMER VALUES ('Lisa', 'Max', '6745869238', 'Cell', 'lisaRmax@gmail.com', '231 Alger Street', 'Harrisonburg', 'VA', '22801', 'Phone', 'Family', '2021-2-6 05:50:00', '2021-1-4 02:20:21')
INSERT INTO CUSTOMER VALUES ('Nicole', 'Ryan', '2934959238', 'Work', 'NicoleRyan@gmail.com', '777 Jimmy Street', 'Harrisonburg', 'VA', '22801', 'Text', 'Friends', '2021-11-14 07:30:31', '2021-1-4 02:20:21')
--Service
INSERT INTO SERVICE VALUES ('2021-2-7 4:30:00', 1, '2021-3-7 4:30:00', '2021-3-7 4:30:00', '2021-2-17 4:30:00', 'A', 1, '2021-1-4 02:20:21')
INSERT INTO SERVICE VALUES ('2021-2-7 4:30:00', 1, '2021-3-7 4:30:00', '2021-3-7 4:30:00', '2021-3-17 4:30:00', 'A', 2, '2021-1-4 02:20:21')
INSERT INTO SERVICE VALUES ('2021-2-7 4:30:00', 1, '2021-3-7 4:30:00', '2021-3-7 4:30:00', '2021-2-17 4:30:00','A', 3, '2021-1-4 02:20:21')
INSERT INTO SERVICE VALUES ('2021-2-7 4:30:00', 1, '2021-3-7 4:30:00', '2021-3-7 4:30:00', '2021-2-17 4:30:00','M', 4, '2021-1-4 02:20:21')
INSERT INTO SERVICE VALUES ('2021-2-7 4:30:00', 1, '2021-3-7 4:30:00', '2021-3-7 4:30:00', '2021-2-17 4:30:00','M', 4, '2021-1-4 02:20:21')
INSERT INTO SERVICE VALUES ('2021-2-7 4:30:00', 1, '2021-3-7 4:30:00', '2021-3-7 4:30:00', '2021-2-17 4:30:00','M', 5, '2021-1-4 02:20:21')
--Auction
INSERT INTO AUCTION VALUES (1, '2021-1-4 02:20:21')
INSERT INTO AUCTION VALUES (2, '2021-1-4 02:20:21')
INSERT INTO AUCTION VALUES (3,'2021-1-4 02:20:21')
--Move
INSERT INTO MOVE VALUES (4, '2021-1-4 02:20:21')
INSERT INTO MOVE VALUES (5, '2021-1-4 02:20:21')
INSERT INTO MOVE VALUES (6, '2021-1-4 02:20:21')
--Addresses
INSERT INTO ADDRESSES VALUES('2432 Gold Way', 'Harrisonburg', 'VA', '22801', 'P', 1)
INSERT INTO ADDRESSES VALUES('2432 Gold Way', 'Harrisonburg', 'VA', '22801', 'P', 2)
INSERT INTO ADDRESSES VALUES('2432 Gold Way', 'Harrisonburg', 'VA', '22801', 'P', 3)
INSERT INTO ADDRESSES VALUES('2432 Gold Way', 'Harrisonburg', 'VA', '22801', 'P', 4)
INSERT INTO ADDRESSES VALUES('24 Gold Way', 'Harrisonburg', 'VA', '22801', 'D', 4)
INSERT INTO ADDRESSES VALUES('2432 Gold Way', 'Harrisonburg', 'VA', '22801', 'P', 5)
INSERT INTO ADDRESSES VALUES('24 Gold Way', 'Harrisonburg', 'VA', '22801', 'D', 5)
INSERT INTO ADDRESSES VALUES('2432 Gold Way', 'Harrisonburg', 'VA', '22801', 'P', 6)
INSERT INTO ADDRESSES VALUES('24 Gold Way', 'Harrisonburg', 'VA', '22801', 'D', 6)
--Auction Event
INSERT INTO AUCTIONEVENT VALUES ('2432 Sales Lane', 'Harrisonburg', 'VA', '22801', '2021-3-7 4:30:00', '2021-3-7 6:30:00', 'Lawn Equipment')
INSERT INTO AUCTIONEVENT VALUES ('2432 Sales Lane', 'Harrisonburg', 'VA', '22801', '2021-3-7 4:30:00', '2021-3-7 6:30:00', 'Home Furniture')
INSERT INTO AUCTIONEVENT VALUES ('2432 Sales Lane', 'Harrisonburg', 'VA', '22801', '2021-3-7 4:30:00', '2021-3-7 6:30:00', 'Jewelry and Fashion')
INSERT INTO AUCTIONEVENT VALUES ('2432 Sales Lane', 'Harrisonburg', 'VA', '22801', '2021-3-7 4:30:00', '2021-3-7 6:30:00', 'Kitchenware')
--AtAuction
INSERT INTO atAUCTION VALUES(4, 1)
INSERT INTO atAUCTION VALUES(2, 2)
INSERT INTO atAUCTION VALUES(2, 3)
INSERT INTO atAUCTION VALUES(3, 1)
INSERT INTO atAUCTION VALUES(1, 2)
--ASSIGNMENT
INSERT INTO ASSIGNMENT VALUES (1, 1, '2021-2-5', 'Lead Auctioner')
INSERT INTO ASSIGNMENT VALUES (3, 3, '2021-2-28', 'Lead Auctioner')
INSERT INTO ASSIGNMENT VALUES (5, 4, '2021-2-10', 'Lead Auctioner')
--TICKETNOTE
INSERT INTO TICKETNOTE VALUES('2021-1-7 3:30:00', 1, 1, 1, 'High Value', 'This will be a high value auction request. Many antique pieces')
INSERT INTO TICKETNOTE VALUES('2021-1-17 12:30:00', 2, 2, 2, 'Process Begun', 'Visited House. Items would be good for auction.')
INSERT INTO TICKETNOTE VALUES('2021-1-23 2:00:00', 3, 3, 3, 'Call', 'Customer called. Unhappy with service so far!')
INSERT INTO TICKETNOTE VALUES('2021-2-5 4:25:00', 4, 4, 1, 'House Check', 'Lots of corners in house. Will make move difficult.')
INSERT INTO TICKETNOTE VALUES('2021-2-9 4:10:00', 4, 5, 2, 'House Check.', 'Four flights of stairs. Will need extra workers.')
INSERT INTO TICKETNOTE VALUES('2021-2-17 5:30:00', 5, 6, 3, 'Customer Call', 'Customer called, they have several pets. Will need to be alert when moving items!')
