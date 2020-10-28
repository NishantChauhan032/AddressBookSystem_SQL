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



