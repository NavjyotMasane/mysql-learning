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

-- ============================================
-- CASE STATEMENT EXAMPLES - EMPLOYEE DATABASE
-- ============================================
-- The CASE statement lets you add conditional (if-else) logic
-- inside a SELECT, UPDATE, or WHERE clause in SQL.
-- Syntax:
--   CASE
--     WHEN condition THEN result
--     WHEN condition THEN result
--     ELSE result
--   END AS alias_name

USE EMPLOYEE;

-- CASE 1: Classify employees by AGE (Seniority)
SELECT EMPLOYEEID, FULLNAME,
   CASE
       WHEN AGE > 26 THEN 'SENIOR'
       ELSE 'JUNIOR'
   END AS SENIORITY
FROM EMPLOYEE;

-- CASE 2: Classify employees by SALARY (Pay Remarks)
SELECT EMPLOYEEID, FULLNAME, 
   CASE 
       WHEN SALARY <=60000 THEN 'UNDER PAID'
       ELSE 'HIGHLY PAID'
   END AS SALARY_REMARKS
FROM EMPLOYEE;
   
-- CASE 3: Increase Salary Department-Wise (UPDATE + CASE)
-- ------------------------------------------------
-- IT      -> +15% raise
-- HR      -> +10% raise
-- Others  -> +50% raise (careful: this looks like a typo,
--            usually should be a smaller % like 0.05)
UPDATE employee 
SET SALARY = CASE DEPARTMENT 
    WHEN 'IT' THEN SALARY + (SALARY*0.15)
    WHEN 'HR' THEN SALARY + (SALARY*0.10)
ELSE SALARY + (SALARY*0.5)
END;

-- CASE 4: Categorize employees by DEPARTMENT into broader groups
SELECT EMPLOYEEID, FULLNAME, DEPARTMENT,
   CASE DEPARTMENT
       WHEN 'IT' THEN 'TECHNICAL'
       WHEN 'HR' THEN 'ADMIN'
       WHEN 'FINANCE' THEN 'ADMIN'
       WHEN 'SALES' THEN 'BUSINESS'
       ELSE 'OTHER'
   END AS DEPT_GROUP
FROM EMPLOYEE;

-- CASE 5: Multi-condition CASE using AGE and SALARY together
SELECT EMPLOYEEID, FULLNAME, AGE, SALARY,
   CASE
       WHEN AGE > 26 AND SALARY > 60000 THEN 'SENIOR - HIGHLY PAID'
       WHEN AGE > 26 AND SALARY <= 60000 THEN 'SENIOR - UNDER PAID'
       WHEN AGE <= 26 AND SALARY > 60000 THEN 'JUNIOR - HIGHLY PAID'
       ELSE 'JUNIOR - UNDER PAID'
   END AS EMPLOYEE_PROFILE
FROM EMPLOYEE;

-- CASE 6: Salary bracket classification (multiple ranges instead of just 2)
SELECT EMPLOYEEID, FULLNAME, SALARY,
   CASE
       WHEN SALARY < 30000 THEN 'LOW'
       WHEN SALARY BETWEEN 30000 AND 60000 THEN 'MEDIUM'
       WHEN SALARY BETWEEN 60001 AND 100000 THEN 'HIGH'
       ELSE 'VERY HIGH'
   END AS SALARY_BRACKET
FROM EMPLOYEE;

-- CASE 7: Using CASE inside ORDER BY (custom sort order)
-- Puts IT department first, then HR, then everyone else
SELECT EMPLOYEEID, FULLNAME, DEPARTMENT
FROM EMPLOYEE
ORDER BY 
   CASE DEPARTMENT
       WHEN 'IT' THEN 1
       WHEN 'HR' THEN 2
       ELSE 3
   END;

-- CASE 8: CASE with NULL handling
-- Useful when a column might have missing/NULL values
SELECT EMPLOYEEID, FULLNAME, DEPARTMENT,
   CASE
       WHEN DEPARTMENT IS NULL THEN 'NOT ASSIGNED'
       ELSE DEPARTMENT
   END AS DEPARTMENT_STATUS
FROM EMPLOYEE;

-- CASE 9: Bonus calculation based on Seniority + Department (UPDATE + CASE)
UPDATE EMPLOYEE
SET SALARY = CASE 
    WHEN AGE > 26 AND DEPARTMENT = 'IT' THEN SALARY + (SALARY * 0.20)
    WHEN AGE > 26 THEN SALARY + (SALARY * 0.12)
    WHEN DEPARTMENT = 'IT' THEN SALARY + (SALARY * 0.08)
    ELSE SALARY + (SALARY * 0.05)
END;


























