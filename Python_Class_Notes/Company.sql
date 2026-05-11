-- SQLite
-- 1. Allows connection to another table
PRAGMA foreign_keys = ON;

-- 2. Create Employees
CREATE TABLE EMPLOYEES(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    First_name TEXT NOT NULL,
    Last_name TEXT NOT NULL,
    Age INTEGER,
    Email TEXT UNIQUE,
    Department_Id INTEGER,
    FOREIGN KEY(Department_Id) REFERENCES Department(Id)
);

-- 3. Then insert values
INSERT OR IGNORE INTO EMPLOYEES(First_name, Last_name, Age, Email, Department_Id)
VALUES
    ("John", "Chinaman", 50, "chinamanjohn@gmail.com", 1),
    ("Mark", "Bossman", 25, "bossmanmark@yahoo.com", 2),
    ("Mary", "Chaplin", 35, "chaplinmary@gmail.com", 3 ),
    ("Diana", "Nilote", 40, "nilotediana@yahoo.com", 1),
    ("Moses", "Darungo", 60, "darungomoses@yahoo.com", 1);

-- 4. Create Departments
CREATE TABLE DEPARTMENT(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL
);

-- 5. Then insert values
INSERT INTO DEPARTMENT(Name)
VALUES
('Data Science'),
('Software'),
('Project Management')

-- To delete table
DROP TABLE IF EXISTS EMPLOYEES;

DROP TABLE IF EXISTS DEPARTMENT;

-- To display table
SELECT * FROM DEPARTMENT;

SELECT * FROM EMPLOYEES

-- To update employees department
UPDATE EMPLOYEES
SET Department_Id = 3
WHERE Id = 5

-- To delete an employee
DELETE FROM EMPLOYEES
WHERE Id = 3 
Join EMPLOYEES to their DEPARTMENTS

SELECT EMPLOYEES.First_name, Employees. Last_name, DEPARTMENT.Name AS DEPARTMENT_Name
FROM EMPLOYEES 
JOIN DEPARTMENT
ON EMPLOYEES.Department_Id = Department.Id