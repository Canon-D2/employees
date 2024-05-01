CREATE DATABASE EMPLOYEES;

USE EMPLOYEES;

CREATE TABLE Employee (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    FirstName NVARCHAR(150) NOT NULL,
	LastName NVARCHAR(50)
);

INSERT INTO Employee (FirstName, LastName) VALUES ('Nguyễn', 'Thị Mỹ Linh');
INSERT INTO Employee (FirstName, LastName) VALUES ('Trần', 'Hữu Đạt');
INSERT INTO Employee (FirstName, LastName) VALUES ('Lê', 'Thị Hương');
INSERT INTO Employee (FirstName, LastName) VALUES ('Phạm', 'Duy Hải');
INSERT INTO Employee (FirstName, LastName) VALUES ('Vũ', 'Thị Hạnh');
INSERT INTO Employee (FirstName, LastName) VALUES ('Đặng', 'Thị Hồng');
INSERT INTO Employee (FirstName, LastName) VALUES ('Hoàng', 'Thị Phương Anh');
INSERT INTO Employee (FirstName, LastName) VALUES ('Mai', 'Văn Đức');
INSERT INTO Employee (FirstName, LastName) VALUES ('Huỳnh', 'Thị Thanh Thảo');
INSERT INTO Employee (FirstName, LastName) VALUES ('Đỗ', 'Văn Nam');

SELECT * FROM Employee;
