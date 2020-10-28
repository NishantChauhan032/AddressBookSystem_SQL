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


