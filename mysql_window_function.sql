CREATE DATABASE mysql_window_functions;
USE mysql_window_functions;
DROP TABLE EMPLOYEE;

CREATE TABLE EMPLOYEE (
EMPLOYEEID INT PRIMARY KEY,
FULLNAME VARCHAR (45) NOT NULL,
DEPARTMENT VARCHAR (45) NOT NULL, 
SALARY FLOAT NOT NULL,
GENDER varchar(45) NOT NULL,
AGE INT NOT NULL
);

INSERT INTO Employee values
(1001,"John Doe","IT",35000,"Male",25), 
(1002, 'Mary Smith', 'HR', 45000, 'Female', 27), 
(1003, 'James Brown', 'Finance', 50000, 'Male', 28), 
(1004, 'Mike Walker', 'Finance', 50000, 'Male', 28),
(1005, 'Linda Jones', 'HR', 75000, 'Female', 26), 
(1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25), 
(1007, 'Priyanka Dewangan', 'HR', 45000, 'Female', 27), 
(1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28), 
(1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28), 
(1010, 'Hina Sharma', 'HR', 75000, 'Female', 26);

SELECT * FROM EMPLOYEE;

# Aggregate Window Functions
-- This query displays each employee's details along with the total salary
-- of all employees in the same department using a window function.
SELECT 
EMPLOYEEID, FULLNAME, DEPARTMENT, GENDER, SALARY,
SUM(SALARY) OVER (PARTITION BY DEPARTMENT) AS 
DEPARTMENT_WISE_TOTALSALARY
FROM EMPLOYEE;

-- This query displays each employee along with the total salary
-- of all employees in their respective department using a window function.
SELECT 
EMPLOYEEID, FULLNAME, DEPARTMENT, SALARY, 
SUM(SALARY) OVER (PARTITION BY DEPARTMENT) AS DEPARTMENTTOTALSALARY
FROM EMPLOYEE;

-- This query displays each employee's salary along with the average salary
-- of all employees in the same department without grouping the rows.
SELECT 
EMPLOYEEID, FULLNAME, DEPARTMENT, SALARY,
AVG(SALARY) OVER (PARTITION BY DEPARTMENT) AS DEPARTMENTAVERAGESALARY
FROM EMPLOYEE;

-- This query displays each employee along with the total number of employees
-- working in the same department using the COUNT window function.
SELECT 
FULLNAME, DEPARTMENT,
COUNT(*) OVER (PARTITION BY DEPARTMENT) AS DEPARTMENTCOUNT
FROM EMPLOYEE;

-- This query assigns a unique row number to each employee within their department.
-- Employees are numbered based on their salary from highest to lowest within each department.
SELECT 
EMPLOYEEID, FULLNAME, DEPARTMENT, GENDER, SALARY,
ROW_NUMBER() OVER (PARTITION BY DEPARTMENT ORDER BY SALARY DESC ) AS RANKINDEPARTMENT 
FROM EMPLOYEE;

-- This query ranks all employees based on their salary from highest to lowest.
-- Employees with the same salary receive the same rank, and the next rank number is skipped.
SELECT 
EMPLOYEEID,
FULLNAME, 
DEPARTMENT,
SALARY,
RANK() OVER (ORDER BY SALARY DESC) AS OVERALLSALARYRANK
FROM EMPLOYEE;

-- This query ranks all employees based on their salary from highest to lowest.
-- Employees with the same salary receive the same rank, but no rank numbers are skipped.
SELECT 
EMPLOYEEID, 
FULLNAME, 
DEPARTMENT, 
SALARY,
DENSE_RANK() OVER (ORDER BY SALARY DESC) AS OVERALLSALARYDENSERANK
FROM EMPLOYEE;

-- This query displays each employee's salary along with the salary of the previous employee.
-- The previous employee is determined by the EmployeeId in ascending order.
SELECT 
EMPLOYEEID, 
FULLNAME,
DEPARTMENT,
AGE,
SALARY,
LAG(SALARY,1) OVER (ORDER BY EMPLOYEEID) AS PREVIOUSEMPLOYEESALARY
FROM EMPLOYEE;

-- This query displays each employee's salary along with the salary of the next employee.
-- The next employee is determined by the EmployeeId in ascending order.
SELECT 
EMPLOYEEID, 
FULLNAME,
DEPARTMENT,
SALARY,
LEAD(SALARY,1) OVER (ORDER BY EMPLOYEEID) AS NEXTEMPLOYEESALARY
FROM EMPLOYEE;






























































