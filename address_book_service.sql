**************************************************
UC1= Ability to create a Address Book Service DB
***************************************************

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
7 rows in set (0.16 sec)

mysql> create database address_book_service;
Query OK, 1 row affected (0.83 sec)

mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| address_book_service |
| information_schema   |
| mysql                |
| payroll_service      |
| performance_schema   |
| sakila               |
| sys                  |
| world                |
+----------------------+
8 rows in set (0.00 sec)

mysql> use address_book_service;
Database changed
mysql> select database();
+----------------------+
| database()           |
+----------------------+
| address_book_service |
+----------------------+
1 row in set (0.00 sec)

**********************************************************************************************************************************************
UC2 = Ability to create a Address Book Table with first and last names, address, city, state, zip, phone number and email as its attributes
**********************************************************************************************************************************************

mysql> create table address_book(
    -> firstName VARCHAR(30) NOT NULL,
    -> lastName VARCHAR(30) NOT NULL,
    -> address VARCHAR(50) NOT NULL,
    -> city VARCHAR(20) NOT NULL,
    -> state VARCHAR(20) NOT NULL,
    -> zip VARCHAR(10) NOT NULL,
    -> phoneNo VARCHAR(15) NOT NULL,
    -> email VARCHAR(15) NOT NULL,
    -> PRIMARY KEY (firstName));
Query OK, 0 rows affected (1.64 sec)

mysql> describe address_book;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| firstName | varchar(30) | NO   | PRI | NULL    |       |
| lastName  | varchar(30) | NO   |     | NULL    |       |
| address   | varchar(50) | NO   |     | NULL    |       |
| city      | varchar(20) | NO   |     | NULL    |       |
| state     | varchar(20) | NO   |     | NULL    |       |
| zip       | varchar(10) | NO   |     | NULL    |       |
| phoneNo   | varchar(15) | NO   |     | NULL    |       |
| email     | varchar(15) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
8 rows in set (0.17 sec)

*******************************************************
UC3 = Ability to insert new Contacts to Address Book
*********************************************************

mysql> describe address_book_service;
ERROR 1146 (42S02): Table 'address_book_service.address_book_service' doesn't exist
mysql> insert into address_book(firstName,lastName,address,city,state,zip,phoneNo,email) values
    -> ("Rutuja", "Nandi", "Chiplun", "Ratnagiri", "Maharastra","416106", "1234567891", "abc@gmail.com"),
    -> ("Kundya", "Patil", "Veer", "Kolhapur", "Maharastra","415606", "9876308704", "pqr@gmail.com"),
    -> ("Rani", "Kadam", "Peth", "Goa", "Maharastra","416189", "9237867891", "xyz@gmail.com"),
    -> ("Rashmi", "Bharatdwaj", "Kothrud", "Pune", "Maharastra", "123455", "7894563697","mno@gmail.com");
Query OK, 4 rows affected (0.14 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> describe address_book_service;
ERROR 1146 (42S02): Table 'address_book_service.address_book_service' doesn't exist
mysql> describe address_book;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| firstName | varchar(30) | NO   | PRI | NULL    |       |
| lastName  | varchar(30) | NO   |     | NULL    |       |
| address   | varchar(50) | NO   |     | NULL    |       |
| city      | varchar(20) | NO   |     | NULL    |       |
| state     | varchar(20) | NO   |     | NULL    |       |
| zip       | varchar(10) | NO   |     | NULL    |       |
| phoneNo   | varchar(15) | NO   |     | NULL    |       |
| email     | varchar(15) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
8 rows in set (0.46 sec)

mysql> select * from address_book;
+-----------+------------+---------+-----------+------------+--------+------------+---------------+
| firstName | lastName   | address | city      | state      | zip    | phoneNo    | email         |
+-----------+------------+---------+-----------+------------+--------+------------+---------------+
| Kundya    | Patil      | Veer    | Kolhapur  | Maharastra | 415606 | 9876308704 | pqr@gmail.com |
| Rani      | Kadam      | Peth    | Goa       | Maharastra | 416189 | 9237867891 | xyz@gmail.com |
| Rashmi    | Bharatdwaj | Kothrud | Pune      | Maharastra | 123455 | 7894563697 | mno@gmail.com |
| Rutuja    | Nandi      | Chiplun | Ratnagiri | Maharastra | 416106 | 1234567891 | abc@gmail.com |
+-----------+------------+---------+-----------+------------+--------+------------+---------------+
4 rows in set (0.00 sec)

***************************************************************
UC4= Ability to edit existing contact person using their name
**************************************************************

mysql> update address_book set phoneNo="7264920645" where firstName="Rutuja";
Query OK, 1 row affected (0.13 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from address_book;
+-----------+------------+---------+-----------+------------+--------+------------+---------------+
| firstName | lastName   | address | city      | state      | zip    | phoneNo    | email         |
+-----------+------------+---------+-----------+------------+--------+------------+---------------+
| Kundya    | Patil      | Veer    | Kolhapur  | Maharastra | 415606 | 9876308704 | pqr@gmail.com |
| Rani      | Kadam      | Peth    | Goa       | Maharastra | 416189 | 9237867891 | xyz@gmail.com |
| Rashmi    | Bharatdwaj | Kothrud | Pune      | Maharastra | 123455 | 7894563697 | mno@gmail.com |
| Rutuja    | Nandi      | Chiplun | Ratnagiri | Maharastra | 416106 | 7264920645 | abc@gmail.com |
+-----------+------------+---------+-----------+------------+--------+------------+---------------+
4 rows in set (0.29 sec)

mysql> update address_book set city="Sangli" where firstName="Rani";
Query OK, 1 row affected (0.27 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from address_book;
+-----------+------------+---------+-----------+------------+--------+------------+---------------+
| firstName | lastName   | address | city      | state      | zip    | phoneNo    | email         |
+-----------+------------+---------+-----------+------------+--------+------------+---------------+
| Kundya    | Patil      | Veer    | Kolhapur  | Maharastra | 415606 | 9876308704 | pqr@gmail.com |
| Rani      | Kadam      | Peth    | Sangli    | Maharastra | 416189 | 9237867891 | xyz@gmail.com |
| Rashmi    | Bharatdwaj | Kothrud | Pune      | Maharastra | 123455 | 7894563697 | mno@gmail.com |
| Rutuja    | Nandi      | Chiplun | Ratnagiri | Maharastra | 416106 | 7264920645 | abc@gmail.com |
+-----------+------------+---------+-----------+------------+--------+------------+---------------+
4 rows in set (0.00 sec)

mysql> update address_book set zip="415696" where firstName="Kundya";
Query OK, 1 row affected (1.31 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from address_book;
+-----------+------------+---------+-----------+------------+--------+------------+---------------+
| firstName | lastName   | address | city      | state      | zip    | phoneNo    | email         |
+-----------+------------+---------+-----------+------------+--------+------------+---------------+
| Kundya    | Patil      | Veer    | Kolhapur  | Maharastra | 415696 | 9876308704 | pqr@gmail.com |
| Rani      | Kadam      | Peth    | Sangli    | Maharastra | 416189 | 9237867891 | xyz@gmail.com |
| Rashmi    | Bharatdwaj | Kothrud | Pune      | Maharastra | 123455 | 7894563697 | mno@gmail.com |
| Rutuja    | Nandi      | Chiplun | Ratnagiri | Maharastra | 416106 | 7264920645 | abc@gmail.com |
+-----------+------------+---------+-----------+------------+--------+------------+---------------+
4 rows in set (0.11 sec)

*********************************************************
UC5 = Ability to delete a person using person's name
*********************************************************

mysql> delete from address_book where firstName="Rani";
Query OK, 1 row affected (1.06 sec)

mysql> select * from address_book;
+-----------+------------+---------+-----------+------------+--------+------------+---------------+
| firstName | lastName   | address | city      | state      | zip    | phoneNo    | email         |
+-----------+------------+---------+-----------+------------+--------+------------+---------------+
| Kundya    | Patil      | Veer    | Kolhapur  | Maharastra | 415696 | 9876308704 | pqr@gmail.com |
| Rashmi    | Bharatdwaj | Kothrud | Pune      | Maharastra | 123455 | 7894563697 | mno@gmail.com |
| Rutuja    | Nandi      | Chiplun | Ratnagiri | Maharastra | 416106 | 7264920645 | abc@gmail.com |
+-----------+------------+---------+-----------+------------+--------+------------+---------------+
3 rows in set (0.14 sec)

mysql> update address_book set city="Kolhapur" where firstName="Rutuja";
Query OK, 1 row affected (0.17 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from address_book;
+-----------+------------+---------+----------+------------+--------+------------+---------------+
| firstName | lastName   | address | city     | state      | zip    | phoneNo    | email         |
+-----------+------------+---------+----------+------------+--------+------------+---------------+
| Kundya    | Patil      | Veer    | Kolhapur | Maharastra | 415696 | 9876308704 | pqr@gmail.com |
| Rashmi    | Bharatdwaj | Kothrud | Pune     | Maharastra | 123455 | 7894563697 | mno@gmail.com |
| Rutuja    | Nandi      | Chiplun | Kolhapur | Maharastra | 416106 | 7264920645 | abc@gmail.com |
+-----------+------------+---------+----------+------------+--------+------------+---------------+
3 rows in set (0.00 sec)

************************************************************************************
UC6 = Ability to Retrieve Person belonging to a City or State from the Address Book
**********************************************************************************

mysql> select * from address_book where city="Kolhapur";
+-----------+----------+---------+----------+------------+--------+------------+---------------+
| firstName | lastName | address | city     | state      | zip    | phoneNo    | email         |
+-----------+----------+---------+----------+------------+--------+------------+---------------+
| Kundya    | Patil    | Veer    | Kolhapur | Maharastra | 415696 | 9876308704 | pqr@gmail.com |
| Rutuja    | Nandi    | Chiplun | Kolhapur | Maharastra | 416106 | 7264920645 | abc@gmail.com |
+-----------+----------+---------+----------+------------+--------+------------+---------------+
2 rows in set (0.00 sec)

mysql> select * from address_book where  state="Maharastra";
+-----------+------------+---------+----------+------------+--------+------------+---------------+
| firstName | lastName   | address | city     | state      | zip    | phoneNo    | email         |
+-----------+------------+---------+----------+------------+--------+------------+---------------+
| Kundya    | Patil      | Veer    | Kolhapur | Maharastra | 415696 | 9876308704 | pqr@gmail.com |
| Rashmi    | Bharatdwaj | Kothrud | Pune     | Maharastra | 123455 | 7894563697 | mno@gmail.com |
| Rutuja    | Nandi      | Chiplun | Kolhapur | Maharastra | 416106 | 7264920645 | abc@gmail.com |
+-----------+------------+---------+----------+------------+--------+------------+---------------+
3 rows in set (0.00 sec)

*****************************************************************************
UC7 = Ability to understand the size of address book by City and State
*****************************************************************************

mysql> select count(city) from address_book;
+-------------+
| count(city) |
+-------------+
|           3 |
+-------------+
1 row in set (0.01 sec)

mysql> select count(state) from address_book;
+--------------+
| count(state) |
+--------------+
|            3 |
+--------------+
1 row in set (0.00 sec)

******************************************************************************************
UC8 = Ability to retrieve entries sorted alphabetically by Person’s name for a given city
*****************************************************************************************

mysql> select firstName,city from address_book order by firstName;
+-----------+----------+
| firstName | city     |
+-----------+----------+
| Kundya    | Kolhapur |
| Rashmi    | Pune     |
| Rutuja    | Kolhapur |
+-----------+----------+
3 rows in set (0.00 sec)

*****************************************************************
UC9 = Ability to identify each Address Book with name and Type. 
*****************************************************************

mysql> alter table address_book add type varchar(15) after lastName;
Query OK, 0 rows affected (3.47 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update address_book set type="Family" where firstName="Kundya";
Query OK, 1 row affected (0.17 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update address_book set type="Friends" where firstName="Rutuja";
Query OK, 1 row affected (0.36 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update address_book set type="Friends" where firstName="Rani";
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select * from address_book;
+-----------+------------+---------+---------+----------+------------+--------+------------+---------------+
| firstName | lastName   | type    | address | city     | state      | zip    | phoneNo    | email         |
+-----------+------------+---------+---------+----------+------------+--------+------------+---------------+
| Kundya    | Patil      | Family  | Veer    | Kolhapur | Maharastra | 415696 | 9876308704 | pqr@gmail.com |
| Rashmi    | Bharatdwaj | NULL    | Kothrud | Pune     | Maharastra | 123455 | 7894563697 | mno@gmail.com |
| Rutuja    | Nandi      | Friends | Chiplun | Kolhapur | Maharastra | 416106 | 7264920645 | abc@gmail.com |
+-----------+------------+---------+---------+----------+------------+--------+------------+---------------+
3 rows in set (0.00 sec)

mysql> update address_book set type="Friends" where firstName="Rashmi";
Query OK, 1 row affected (0.67 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from address_book;
+-----------+------------+---------+---------+----------+------------+--------+------------+---------------+
| firstName | lastName   | type    | address | city     | state      | zip    | phoneNo    | email         |
+-----------+------------+---------+---------+----------+------------+--------+------------+---------------+
| Kundya    | Patil      | Family  | Veer    | Kolhapur | Maharastra | 415696 | 9876308704 | pqr@gmail.com |
| Rashmi    | Bharatdwaj | Friends | Kothrud | Pune     | Maharastra | 123455 | 7894563697 | mno@gmail.com |
| Rutuja    | Nandi      | Friends | Chiplun | Kolhapur | Maharastra | 416106 | 7264920645 | abc@gmail.com |
+-----------+------------+---------+---------+----------+------------+--------+------------+---------------+
3 rows in set (0.00 sec)

mysql> update address_book set type="Professional" where firstName="Rashmi";
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from address_book;
+-----------+------------+--------------+---------+----------+------------+--------+------------+---------------+
| firstName | lastName   | type         | address | city     | state      | zip    | phoneNo    | email         |
+-----------+------------+--------------+---------+----------+------------+--------+------------+---------------+
| Kundya    | Patil      | Family       | Veer    | Kolhapur | Maharastra | 415696 | 9876308704 | pqr@gmail.com |
| Rashmi    | Bharatdwaj | Professional | Kothrud | Pune     | Maharastra | 123455 | 7894563697 | mno@gmail.com |
| Rutuja    | Nandi      | Friends      | Chiplun | Kolhapur | Maharastra | 416106 | 7264920645 | abc@gmail.com |
+-----------+------------+--------------+---------+----------+------------+--------+------------+---------------+
3 rows in set (0.01 sec)

******************************************************************
UC10 = Ability to get number of contact persons i.e. count by type
********************************************************************
mysql> select count(type) from address_book;
+-------------+
| count(type) |
+-------------+
|           3 |
+-------------+
1 row in set (0.17 sec)