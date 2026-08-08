create database BankingDB;
use BankingDB;
CREATE TABLE Customers
(
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

describe Customers;

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

Describe Accounts;
Describe Transactions;
describe Branches;
describe AccountBranches;
describe Loans;

ALTER TABLE Customers
ADD DateOfBirth DATE;

describe Customers;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

DROP TABLE AccountBranches;

ALTER TABLE Customers
ADD PRIMARY KEY (CustomerID);

ALTER TABLE Accounts
ADD CustomerID INT;
ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Customers
MODIFY FirstName VARCHAR(50) NOT NULL;

ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);


#########################################
-- Add Primary Keys
ALTER TABLE Accounts
ADD CONSTRAINT PK_Accounts
PRIMARY KEY (AccountID);

ALTER TABLE Transactions
ADD CONSTRAINT PK_Transactions
PRIMARY KEY (TransactionID);

ALTER TABLE Branches
ADD CONSTRAINT PK_Branches
PRIMARY KEY (BranchID);

ALTER TABLE Loans
ADD CONSTRAINT PK_Loans
PRIMARY KEY (LoanID);

-- Add Required Columns


ALTER TABLE Transactions
ADD AccountID INT;

ALTER TABLE Loans
ADD CustomerID INT;


ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

ALTER TABLE Loans
ADD CONSTRAINT FK_Loans_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Accounts
ADD BranchID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Branches
FOREIGN KEY (BranchID)
REFERENCES Branches(BranchID);

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);

SELECT * FROM ACCOUNTS;

UPDATE Customers
SET Phone='9999999999'
WHERE CustomerID=101;

select * from customers;

UPDATE Customers
SET Email='rahul.sharma@gmail.com'
WHERE CustomerID=101;

-- Insert 4 Records into Customers Table
INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(102, 'Priya', 'Patil', 'priya@gmail.com', '9988776655', '2000-09-20'),
(103, 'Amit', 'Patel', 'amit.patel@gmail.com', '9876500001', '1995-06-18'),
(104, 'Sneha', 'Joshi', 'sneha.joshi@gmail.com', '9876500002', '1997-09-12'),
(105, 'Rohan', 'Kulkarni', 'rohan.k@gmail.com', '9876500003', '1993-11-25');

-- Insert 4 Records into Accounts Table
INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(202, 102, 'Current', 40000),
(203, 103, 'Savings', 35000),
(204, 104, 'Current', 60000),
(205, 105, 'Savings', 45000);

-- Insert 5 Records into Transactions Table
INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-05-10', 5000, 'Deposit'),
(302, 202, '2025-05-11', 2500, 'Withdraw'),
(303, 203, '2025-05-12', 10000, 'Deposit'),
(304, 204, '2025-05-13', 3000, 'Withdraw'),
(305, 205, '2025-05-14', 7000, 'Deposit');

use bankingdb;
SELECT * FROM Branches;
TRUNCATE TABLE Branches;

SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM Branches;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(1, 'Mumbai Branch', 'Andheri, Mumbai', '0221111111'),
(2, 'Pune Branch', 'Shivaji Nagar, Pune', '0202222222'),
(3, 'Nashik Branch', 'College Road, Nashik', '0253222222'),
(4, 'Nagpur Branch', 'Sitabuldi, Nagpur', '0712333333'),
(5, 'Navi Mumbai Branch', 'Vashi, Navi Mumbai', '0224444444');

ALTER TABLE Loans
ADD CustomerID INT;


INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID)
VALUES
(301, 500000, 8.50, '2025-01-15', '2030-01-15', 101),
(302, 300000, 9.25, '2025-02-10', '2028-02-10', 102),
(303, 750000, 8.75, '2025-03-20', '2032-03-20', 103),
(304, 250000, 10.00, '2025-04-05', '2029-04-05', 104),
(305, 1000000, 7.95, '2025-05-12', '2035-05-12', 105);

SELECT * FROM Customers;
SELECT FirstName, LastName, Email, Phone
FROM Customers;
SELECT *
FROM Accounts
WHERE AccountType = 'Savings';
SELECT *
FROM Accounts
WHERE Balance > 25000;
SELECT *
FROM Transactions
WHERE Amount BETWEEN 5000 AND 20000;
SELECT *
FROM Customers
WHERE CustomerID IN (101,102,103);
SELECT *
FROM Customers
WHERE FirstName LIKE 'R%';

SELECT *
FROM Customers
ORDER BY FirstName ASC;

SELECT *
FROM Accounts
ORDER BY Balance DESC;

SELECT DISTINCT AccountType
FROM Accounts;

SELECT *
FROM Accounts
ORDER BY Balance DESC
LIMIT 3;

SELECT *
FROM Transactions
LIMIT 5 OFFSET 2;

SELECT *
FROM Customers
WHERE Phone IS NULL;

SELECT *
FROM Customers
WHERE Email IS NOT NULL;

SELECT AccountID,
       Balance,
       CASE
           WHEN Balance >= 50000 THEN 'Premium Account'
           WHEN Balance >= 25000 THEN 'Standard Account'
           ELSE 'Basic Account'
       END AS AccountCategory
FROM Accounts;

SELECT AccountID,
       Balance,
       RANK() OVER (ORDER BY Balance DESC) AS BalanceRank
FROM Accounts;

SELECT TransactionID,
       Amount,
       SUM(Amount) OVER (ORDER BY TransactionDate) AS RunningTotal
FROM Transactions;

SELECT TransactionID,
       Amount,
       AVG(Amount) OVER () AS AverageTransaction
FROM Transactions;
  
  
use employee;
select distinct department, gender from employee;
select distinct gender from employee;
select distinct age from employee;
select * from employee where age not in (23,28);
select * from employee where salary between 40000 AND 60000;
SELECT * FROM EMPLOYEE WHERE AGE BETWEEN 25 AND 45;
SELECT * FROM EMPLOYEE WHERE EMPLOYEEID IN (1004,1007,1003,1010);

-- show me all the records of emp

select * from employee where employeeid not in (1004,1007,1003,1010);
select * from employee
where fullname like "A%";

select * from employee
where fullname like "Y%";

select * from employee
where fullname like "%I%";

select * from employee 
where fullname like "%L__%";

select * from employee
where fullname not like "P%";

select * from projects;

select * from projects
where Employeeid is null;

select * from projects 
where employeeid is not null; 

select department, count(*) from employee group by department;
select department, count(*) from employee group by department having count(*)>2;

select state, count(*) from address group by state having state;

use bankingdb; 

SELECT *
FROM Customers
WHERE FirstName LIKE 'A%';

SELECT *
FROM Customers
WHERE Email LIKE '%gmail%';

SELECT *
FROM Customers
WHERE LastName LIKE '%kar';

SELECT *
FROM Accounts
WHERE AccountType IN ('Savings', 'Current');

SELECT *
FROM Transactions
WHERE TransactionType IN ('Deposit', 'Withdrawal');


SELECT *
FROM Customers
WHERE CustomerID IN (101,102,105);

SELECT *
FROM Customers
ORDER BY LastName ASC;

SELECT *
FROM Accounts
ORDER BY Balance DESC;

SELECT *
FROM Transactions
ORDER BY TransactionDate DESC;

SELECT *
FROM Accounts
ORDER BY Balance DESC
LIMIT 5;

SELECT *
FROM Customers
LIMIT 3;

SELECT *
FROM Transactions
LIMIT 5 OFFSET 3;


SELECT *
FROM Accounts
WHERE AccountType = 'Savings'
ORDER BY Balance DESC;

SELECT *
FROM Customers
WHERE FirstName LIKE 'S%'
LIMIT 5;

SELECT *
FROM Transactions
WHERE TransactionType IN ('Deposit','Withdrawal')
ORDER BY TransactionDate DESC;



USE bankingdb;
CREATE TABLE Voter_list
(Voter_ID int ,
Names varchar(30),
Age int check(Age>=18) );
desc Voter_list;
select*from Voter_list;
insert into Voter_list values
(20067, "Anuja patil",18);

use employee;
use employee;
show tables;

select *, concat(fullname, "-",employeeid) as specific_code from employee;
select concat("Good","Morning") as Remarks;

select fullname, lower(fullnmae) from employee;
select fullname, upper(fullname) from employee;

select fullname, replace(fullname, "Mohanty", "Kulakarni" ) as New_Name from employee;
select * from employee;
update employee set fullname = "Sambit Kulkarni" where employeeid = 1008;
update employee set fullname = "Anurag Kulkarni" where employeeid = 1006;

select length("Good Morning");
select substring("Mary Smith",2,3);

select fullname, substring(fullname, 2,3) as partial,
length(substring(fullname, 2,3)) as length from employee;

USE bankingdb;
SELECT * FROM Customers;

use employee;
select fullname, lower(fullname) from employee;

SELECT
FirstName,
UPPER(FirstName) 
FROM customers;

SELECT
FirstName,
LOWER(FirstName) 
FROM customers;

SELECT FIRSTNAME, length(FIRSTNAME) FROM CUSTOMERS;
SELECT FIRSTNAME, left(FIRSTNAME,3) FROM CUSTOMERS;
SELECT concat(FIRSTNAME,LASTNAME) FROM CUSTOMERS;
SELECT round(1256.75);
SELECT CEIL(1256.75);
SELECT floor(1256.75);
SELECT abs(-2500);
SELECT mod(25,4);
SELECT * FROM CUSTOMERS;
SELECT curdate();
SELECT now();
SELECT CUSTOMERID, year(DATEOFBIRTH), now() FROM CUSTOMERS;
SELECT CUSTOMERID, month(dateofbirth) from customers;
SELECT CUSTOMERID, datediff(CURDATE(), DATEOFBIRTH) FROM CUSTOMERS;
SELECT CUSTOMERID, if(year(DATEOFBIRTH) <=1995,'ADULT', 'YOUNG') FROM CUSTOMERS;
SELECT FIRSTNAME, DATEOFBIRTH, IF(YEAR(DATEOFBIRTH) <=1995, 'ADULT', 'YOUNG') FROM CUSTOMERS;
SELECT FIRSTNAME, PHONE FROM CUSTOMERS;
SELECT greatest( 
'2000-09-20', 
'1995-06-18',
'1997-09-12',
'1993-11-25') AS LATESTBIRTHDATE;

SELECT least(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-09-12') AS LEASTBIRTHDATE;

SELECT FIRSTNAME, nullif(FIRSTNAME, 'PRIYA') AS RESULT FROM CUSTOMERS;


SELECT * FROM ACCOUNTS;
SELECT SUM(BALANCE) AS TOTAL_BALANCE FROM ACCOUNTS;
SELECT MAX(BALANCE) AS MAX_BALANCE FROM ACCOUNTS;
select AVG(BALANCE) AS AVG_BALANCE FROM ACCOUNTS;
SELECT MIN(BALANCE) AS MIN_BALANCE FROM ACCOUNTS;
SELECT COUNT(*) AS TOTAL_ACCOUNTS FROM ACCOUNTS;
SELECT AccountType, SUM(Balance) AS TotalBalance FROM ACCOUNTS group by AccountType;
SELECT AccountType, sum(Balance) as TotalBalance FROM ACCOUNTS group by AccountType  HAVING sum(Balance) >25000;

