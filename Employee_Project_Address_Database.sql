create database employee;
show databases;
use employee;
CREATE TABLE Employee (  
EmployeeId INT PRIMARY KEY,  
FullName VARCHAR(45) NOT NULL,  
Department VARCHAR(45) NOT NULL,  
Salary float NOT NULL,  
Gender VARCHAR(45) NOT NULL,  
Age INT NOT NULL  
);  

INSERT INTO Employee values  
(1001,"John Doe","IT",35000,"Male",25),   
(1002, 'Mary Smith', 'HR', 45000, 'Female', 27),  (1003, 
'James Brown', 'Finance', 50000, 'Male', 28),  (1004, 
'Mike Walker', 'Finance', 50000, 'Male', 28), (1005, 
'Linda Jones', 'HR', 75000, 'Female', 26),  (1006, 'Anurag 
Mohanty', 'IT', 35000, 'Male', 25),  (1007, 'Priyanka 
Dewangan', 'HR', 45000, 'Female', 27),  (1008, 'Sambit 
Mohanty', 'IT', 50000, 'Male', 28),  (1009, 'Pranaya 
Kumar', 'IT', 50000, 'Male', 28),  (1010, 'Hina Sharma', 
'HR', 75000, 'Female', 26); 

CREATE TABLE Projects (  
ProjectId INT PRIMARY KEY AUTO_INCREMENT,  
ProjectName VARCHAR(200) NOT NULL, 
EmployeeId INT,  
StartDate DATETIME,  
EndDate DATETIME  
); 

INSERT INTO Projects VALUES   
(1,'Develop Ecommerse Website from scratch', 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)), 
(2,'WordPress Website for our company', 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)), 
(3,'Manage our Company Servers', 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)), (4,'Hosting 
account is not working', 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)), (5,'MySQL database from 
my desktop application', 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),  
(6,'Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(),  
INTERVAL 10 DAY)),  
(7,'Migrate web application and database to new server', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5  
DAY)),  
(8,'Android Application development', 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)), 
(9,'Hosting account is not working', 1001, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),  
(10,'MySQL database from my desktop application', 1008, NOW(), DATE_ADD(NOW(), INTERVAL 15  
DAY)),  
(11,'Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(),  
INTERVAL 10 DAY));

CREATE TABLE Address  
(  
AddressId INT PRIMARY KEY AUTO_INCREMENT,  
EmployeeId INT,  
Country VARCHAR(50),  
State VARCHAR(50),  
City VARCHAR(50)  
); 

INSERT INTO Address (EmployeeId, Country, State, City) Values (1001, 'India', 'Odisha', 'BBSR');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1002, 'India', 'Maharashtra', 'Mumbai');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1003, 'India', 'Maharashtra', 'Pune');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1004, 'India', 'Odisha', 'Cuttack'); 
INSERT INTO Address (EmployeeId, Country, State, City) Values (1005, 'India', 'Maharashtra', 'Nagpur');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1006, 'India', 'Odisha', 'Cuttack'); 

select * from Employee;  
select * from Projects;  
select * from Address;  
desc Employee;  
desc Projects;  
desc Address;