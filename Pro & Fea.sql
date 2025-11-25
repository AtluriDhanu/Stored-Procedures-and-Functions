CREATE DATABASE Procedure_db;
USE Procedure_db;

CREATE TABLE Employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary INT
);

INSERT INTO Employees (emp_name, salary) VALUES
('Arjun', 30000), ('Rocky', 54000),
('Meera', 45000), ('Sweety', 18000),
('Rahul', 25000), ('Honey', 41000);

DELIMITER $$
CREATE PROCEDURE GetHighSalary(IN min_salary INT)
BEGIN
    SELECT emp_name, salary
    FROM Employees
    WHERE salary > min_salary;
END $$
DELIMITER ;

CALL GetHighSalary(30000);

DELIMITER $$
CREATE FUNCTION TotalEmployees()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM Employees;
    RETURN total;
END $$
DELIMITER ;

SELECT TotalEmployees() AS total_employees;
