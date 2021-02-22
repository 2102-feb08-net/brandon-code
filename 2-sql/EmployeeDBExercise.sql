

CREATE SCHEMA EmployeeDBExercise
GO




CREATE TABLE EmployeeDBExercise.Department (
	DepartmentId INT NOT NULL IDENTITY UNIQUE,
	Name NVARCHAR(100) NOT NULL,
	Location NVARCHAR(100),
	CONSTRAINT PK_DepartmentId PRIMARY KEY (DepartmentId)
)

CREATE TABLE EmployeeDBExercise.Employee (
	EmployeeId INT NOT NULL IDENTITY UNIQUE,
	FirstName NVARCHAR(100) NOT NULL,
	LastName NVARCHAR(100) NOT NULL,
	SSN CHAR(9) CHECK(LEN(SSN) = 9) UNIQUE,
	DepartmentId INT,
	CONSTRAINT PK_EmployeeId PRIMARY KEY (EmployeeId),
	CONSTRAINT FK_DepartmentId FOREIGN KEY (DepartmentId) REFERENCES EmployeeDBExercise.Department(DepartmentId)
)

CREATE TABLE EmployeeDBExercise.EmpDetails (
	EmpDetailsId INT NOT NULL IDENTITY UNIQUE,
	EmployeeId INT NOT NULL UNIQUE,
	Salary INT,
	Address1 NVARCHAR(100),
	Address2 NVARCHAR(100),
	City NVARCHAR(100),
	State NVARCHAR(100),
	Country NVARCHAR(100),
	CONSTRAINT PK_EmpDetailsId PRIMARY KEY (EmpDetailsId),
	CONSTRAINT FK_EmployeeId FOREIGN KEY (EmployeeId) REFERENCES EmployeeDBExercise.Employee(EmployeeId)
)
GO

--DROP TABLE EmployeeDBExercise.Department



INSERT INTO EmployeeDBExercise.Department(
