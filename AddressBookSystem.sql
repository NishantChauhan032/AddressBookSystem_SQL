# UC1 - To create Address Book Service Database
show databases;
create database AddressBookService;
use addressbookservice;
select database();

# UC2 - To create address book table with attributes
create table address_book
(
FirstName                   Varchar(150) NOT NULL,
LastName                   Varchar(150) NOT NULL,
Address                    Varchar(250) NOT NULL,
City                       Varchar(150) NOT NULL,
State                      Varchar(150) NOT NULL,
ZIP                        Varchar(150) NOT NULL,
PhoneNumber                Varchar(150) NOT NULL,
EmailID                    Varchar(150) NOT NULL,
PRIMARY KEY (PhoneNumber)
);

# UC3 - Ability to insert new contacts to address book
INSERT INTO address_book(FirstName,LastName,Address,City,State,ZIP,PhoneNumber,EmailID) VALUES
 ('Nishant','Chauhan','Chainpur','Vaishali','Bihar',844118,9876543210,'nishant@gmail.com'),
 ('Anshu','Singh','Goraul','Bhagwanpur','Jharkhand',831014,9988776655,'anshu@gmail.com'),
 ('Narendra','Modi','Center','Delhi','New Delhi',887766,9988775544,'modi@gmail.com');
 SELECT * FROM address_book;
 
 # UC4 - Ability to edit existing contact using name
 Update address_book
 set ZIP = 778899,PhoneNumber = 7788998877
 where FirstName = 'Narendra'; 
 SELECT * FROM address_book;
 
 # UC5 - Ability to delete a contact using person's name
 Delete from address_book
 where FirstName = 'Narendra';
 SELECT * FROM address_book;
 
 # UC6 - Ability to retrieve person belonging to a city or state
 Select * from address_book 
 where city = 'Vaishali';                                          # To retrieve contact using city
 Select * from address_book
 where state = 'Jharkhand';                                        # To retrieve contact using state
 
 #Adding more contacts
 INSERT INTO address_book(FirstName,LastName,Address,City,State,ZIP,PhoneNumber,EmailID) VALUES   
 ('Ritesh','Kumar','Chainpur','Vaishali','Bihar',844118,9875753739,'ritesh@gmail.com'),
 ('Adrija','Chauhan','Goraul','Vaishali','Bihar',844118,9835735768,'adrija@gmail.com'),
 ('Heera','Thakur','Goraul','Bhagwanpur','Jharkhand',875875,8786567898,'heera@gmail.com');
 
 # UC7 - Ability to understand the size of address book by City and State
 SELECT city,count(firstname)                                       #Count of address by city
 FROM address_book GROUP BY city;                                   
 
 SELECT state,count(firstname)                                      #Count of address by state
 FROM address_book GROUP BY state;
 
 # UC8 - Ability to retrieve entries sorted alphabetically by Person’s name for a given city
 select * from address_book 
 where city = 'Vaishali' group by FirstName ;
 
 # UC9 - Ability to identify each Address Book with name and Type
 Alter table address_book
 Add DiaryName Varchar(150) NOT NULL first;                          #Added Diary Name Column
 Alter table address_book
 Add ContactType Varchar(150) NOT NULL;                              #Added contact type column
 Describe address_book;                                
 
UPDATE address_book SET DiaryName = 'B', contacttype = 'Friend' WHERE firstname = 'Nishant';
UPDATE address_book SET DiaryName = 'A', contacttype = 'Family' WHERE firstname = 'Ritesh';
UPDATE address_book SET DiaryName = 'B', contacttype = 'Friend' WHERE firstname = 'Anshu';
UPDATE address_book SET DiaryName = 'A', contacttype = 'Family' WHERE firstname = 'Adrija';
UPDATE address_book SET DiaryName = 'C', contacttype = 'Business' WHERE firstname = 'Heera';
Select * from address_book;

# UC10 - Ability to get number of contact persons i.e. count by type
select ContactType,count(FirstName) 
from address_book  
group by contacttype;

# UC11 - Ability to add person to both Friend and Family
INSERT INTO address_book(DiaryName,FirstName,LastName,Address,City,State,ZIP,PhoneNumber,EmailID,ContactType) VALUES   
 ('A','Abhishek','Chauhan','Chainpur','Patna','Bihar',844201,7587878776,'abhishek@gmail.com','Family'),
 ('B','Raj','Priyadarshi','Nawada','Gaya','Bihar',878655,876576871,'priyadarshi@gmail.com','Friend');
 Select * from address_book;
 
 Drop table address_book;
 show tables;

 
 #UC-13 - Data Filled into new table structure and retrieval done as done in previous Use Cases
 
 create table address
 ( Address_ID      Varchar(10) NOT NULL,
   Address         Varchar(150) NOT NULL,
   City            Varchar(150) NOT NULL,
   State           Varchar(150) NOT NULL,
   ZIP             Varchar(10) NOT NULL,
   PRIMARY KEY (Address_ID)
   );
   
   CREATE TABLE Personal_Details (
  Person_ID        int unsigned NOT NULL auto_increment,
  FirstName        Varchar(150)  NOT NULL,
  LastName         Varchar(150)  NOT NULL,
  PhoneNumber      Varchar(12)  NOT NULL,
  EmailID          Varchar(150)  NOT NULL,
  Address_ID       Varchar(10)  NOT NULL,
  PRIMARY KEY (Person_ID),
  FOREIGN KEY(Address_ID) references Address(Address_ID)
);

CREATE TABLE Diary_Details (
  DiaryName        Varchar(6)  NOT NULL,
  ContactType      Varchar(100)  NOT NULL,
  PRIMARY KEY (DiaryName)
);

CREATE TABLE Person_Type (
  Person_ID int unsigned NOT NULL,
  DiaryName Varchar(6)  NOT NULL,
  FOREIGN KEY(Person_ID) references Personal_Details(Person_ID),
  FOREIGN KEY(DiaryName) references Diary_Details(DiaryName) 
);
show tables;

#Assigning Values into different tables

Insert Into Personal_Details(FirstName,LastName,PhoneNumber,EmailID,Address_ID) VALUES
('Nishant','Chauhan','9835386938','nishant@gmail.com','AD01'),
('Anshu','Singh','9878767587','anshu@gmail.com','AD02'),
('Ritesh','Kumar','9876545457','ritesh@gmail.com','AD01'),
('Adrija','Chauhan','8989787867','adrija@gmail.com','AD04'),
('Heera','Thakur','7867563567','heera@gmail.com','AD02'),
('Abhishek','Chauhan','8796736598','abhishek@gmail.com','AD05'),
('Raj','Priyadarshi','6758978798','priyadarshi@gmail.com','AD03');
Select * from Personal_Details;

Insert Into Address(Address_ID,Address,City,State,ZIP) Values
('AD01','Chainpur','Vaishali','Bihar','844118'),
('AD02','Goraul','Bhagwanpur','Jharkhand','887766'),
('AD03','Nawada','Gaya','Bihar','887788'),
('AD04','Goraul','Vaishali','Bihar','844114'),
('AD05','Chainpur','Patna','Bihar','876543');
Select * from Address;

Insert Into Person_Type(Person_ID,DiaryName) Values
(64,'D_Frd'),
(65,'D_Frd'),
(66,'D_Fam'),
(67,'D_Fam'),
(68,'D_Bus'),
(69,'D_Fam'),
(70,'D_Frd');
select * from Person_Type;

Insert Into Diary_Details(DiaryName,ContactType) Values
('D_Frd','Friend'),
('D_Fam','Family'),
('D_Bus','Business');
select * from Diary_Details;

# Now retrieving data from multiple tables:

SELECT * FROM Personal_Details                                                          #UC6-To retrieve person belonging to a state
Join Address ON Personal_Details.Address_ID = Address.Address_ID where State = 'Bihar';

SELECT * FROM Personal_Details                                                          #UC6-To retrieve person belonging to a city
Join Address ON Personal_Details.Address_ID = Address.Address_ID where City = 'Vaishali';

SELECT City,COUNT(*)                                                                    #UC7-To count contacts by city
FROM Personal_Details Join Address
ON Personal_details.Address_ID = Address.Address_ID
GROUP BY City;

SELECT State,COUNT(*)                                                                   #UC7-To count contacts by state
FROM Personal_Details Join Address
ON Personal_details.Address_ID = Address.Address_ID
GROUP BY State;

SELECT City,FirstName                                                                  #UC8-To retrieve entries sorted alphabetically
FROM Personal_Details Join Address                                                     #    by Person's name for a given city
ON Personal_Details.Address_ID = Address.Address_ID
Where city = 'Vaishali'
ORDER BY FirstName;


SELECT ContactType, count(*)                                              #UC10-Ability to get numberof contact persons i.e. count by type
FROM Diary_Details JOIN Person_Type
ON Diary_Details.DiaryName = Person_Type.DiaryName
GROUP BY ContactType;