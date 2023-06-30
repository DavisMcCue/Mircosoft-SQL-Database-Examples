Create Database AnimalHealth

Create Table Owner(
	OwnerID Int PRIMARY KEY,
	LastName varchar(15),
	FirstName varchar(15),
	PhoneNbr varchar(10),
	Email varchar(20)
);

Create Table Vets(
	VetID Int PRIMARY KEY,
	LastName varchar(15),
	FirstName varchar(15),
	PhoneNbr varchar(10),
);

Create Table Pets(
	PetID Int PRIMARY KEY,
	PetName varchar(15) NOT NULL,
	DateOfBirth DATE,
	OwnerID INT FOREIGN KEY REFERENCES Owner(OwnerID)
);

Create Table Visits(
	VisitID Int PRIMARY KEY,
	DateAndTime DATETIME,
	ReasonForVisit varchar(100) DEFAULT 'Yearly Checkup',
	PetID INT FOREIGN KEY REFERENCES Pets(PetID),
	VetID INT FOREIGN KEY REFERENCES Vets(VetID)
);

Alter Table Pets
ADD Breed varchar(30);

ALTER TABLE Owner 
ALTER COLUMN PhoneNbr varchar(10) NOT NULL


SELECT CONVERT (varchar(256), DATABASEPROPERTYEX('AnimalHealth','collation')); 