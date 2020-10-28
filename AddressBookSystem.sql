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



