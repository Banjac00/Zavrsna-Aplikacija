-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------
-- Creating table 'Genres'
CREATE TABLE Car (
    ID int IDENTITY(1,1) NOT NULL,
    Manufacturer nvarchar(50)  NULL,
	Model nvarchar(50)  NULL,
	LicensePlate nvarchar(50)  NULL,
	Year int NULL,
	Available  bit  NOT NULL,
    CONSTRAINT PK_Car PRIMARY KEY  (ID)



);


-- Creating table 'BookRentals'
CREATE TABLE Rental (
    RentalId int  NOT NULL,
    CarId int  NULL,
    CustomerId int  NULL,
    RentDate datetime  NULL,
    ReturnDate datetime  NULL,
    CONSTRAINT PK_Rental PRIMARY KEY  (RentalId)
);

-- Creating table 'Customers'
CREATE TABLE Customer (
    CustomerId int IDENTITY(1,1) NOT NULL,
    Name nvarchar(50)  NULL,
    DriverLicNo nvarchar(50)  NULL,
    CONSTRAINT PK_Customer PRIMARY KEY  (CustomerId)
);

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------
-- Creating non-clustered index for FOREIGN KEY 'FK_Book_Genre'
CREATE INDEX IX_FK_Customer_Rental ON Rental (CustomerId);
CREATE INDEX IX_FK_Car_Rental ON Rental (CarId);

-- Creating foreign key on BookGenre in table 'Book'
ALTER TABLE Rental
ADD CONSTRAINT FK_Rental_Customer
    FOREIGN KEY (CustomerId)
    REFERENCES Customer (CustomerId)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Rental
ADD CONSTRAINT FK_Rental_Car
    FOREIGN KEY (CarId)
    REFERENCES Car (ID)


    ON DELETE NO ACTION ON UPDATE NO ACTION;