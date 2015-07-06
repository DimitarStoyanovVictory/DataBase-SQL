CREATE TABLE Groups(
	GroupID int IDENTITY,
	Name nvarchar(100),
	CONSTRAINT Unique_Groups UNIQUE(Name),
	CONSTRAINT PK_Groups PRIMARY KEY(GroupID)
)