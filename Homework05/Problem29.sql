CREATE TABLE WorkHours(
	WorkHoursID int IDENTITY,
	[Date] datetime,
	Task nvarchar(100),
	Comments nvarchar(100),
	CONSTRAINT PK_WorkHours PRIMARY KEY(WorkHoursID))

ALTER TABLE Employees 
ADD WorkHoursID int
FOREIGN KEY(WorkHoursID)
REFERENCES WorkHours(WorkHoursID)
		
