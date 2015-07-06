CREATE TABLE Persons(
	PersonID int IDENTITY,
	FirstName nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	SSN int NOT NULL,
	CONSTRAINT PK_Persosns PRIMARY KEY(PersonID)
)

CREATE TABLE Accounts(
	AccountID int IDENTITY,
	Balanace money NOT NULL,
	PersonID int ,
	CONSTRAINT PK_Accounts PRIMARY KEY(AccountID),
)

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Persons
FOREIGN KEY(PersonID)
REFERENCES Persons(PersonID)

INSERT INTO Persons(FirstName, LastName, SSN)
VALUES ('Petur', 'Stoyanov', 123987456), ('Georgy', 'Parvanov', 456987123), ('Ivan', 'Rusinov', 123789456)

INSERT INTO Accounts(Balanace, PersonID)
VALUES (10125.24, 1), (20524.50, 2), (30100.2, 3), (24300.50, 4), (40500.25, 5)

SELECT 
	FirstName + ' ' + LastName AS [Full name] 
FROM Persons