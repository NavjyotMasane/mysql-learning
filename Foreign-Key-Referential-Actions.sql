-- ==========================================
-- FOREIGN KEY CONSTRAINTS
-- CASCADE, SET NULL AND RESTRICT
-- ==========================================


-- ==========================================
-- 1. CASCADE
-- ==========================================

DROP DATABASE IF EXISTS DB_FK;

CREATE DATABASE DB_FK;

USE DB_FK;

CREATE TABLE Employee_Cascade (
    ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT
);

CREATE TABLE Projects_Cascade (
Project_ID INT PRIMARY KEY,
Project_Name VARCHAR(100) NOT NULL,
Employee_ID INT,
-- Defining Foreign Key and Cascading Behavior 
-- Defining Foreign Key and Cascading Behavior 
FOREIGN KEY (Employee_ID) 
REFERENCES Employee_Cascade(ID) 
ON UPDATE CASCADE 
ON DELETE CASCADE
 );


-- ==========================================
-- 2. SET NULL
-- ==========================================


USE DB_FK;

CREATE TABLE Employee_SetNull (
    ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT
);

CREATE TABLE projects_SetNull (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100) NOT NULL,
    Employee_ID INT NULL,

    FOREIGN KEY (Employee_ID)
    REFERENCES Employee_SetNull(ID)
    ON UPDATE SET NULL
    ON DELETE SET NULL
);


-- ==========================================
-- 3. RESTRICT
-- ==========================================


USE DB_FK;

CREATE TABLE Employee_Restrict (
    ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT
);

CREATE TABLE projects_Restrict (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100) NOT NULL,
    Employee_ID INT,

    FOREIGN KEY (Employee_ID)
    REFERENCES Employee_Restrict(ID)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
);
