--
-- Database: `EcfDb`
--

-- --------------------------------------------------------
CREATE DATABASE EcfDb;



--
-- Table structure for table `Customers`
--

-- --------------------------------------------------------
Create TABLE  Customers
 (   CustomerID int identity(1,1) NOT NULL,
    name varchar(25) NOT NULL, 
	  email varchar(50) NOT NULL, 
		   PRIMARY KEY (CustomerID) );


		   
--
-- Table structure for table `Address`
--

-- --------------------------------------------------------
    CREATE TABLE Address (
    AddressID int identity(1,1) NOT NULL,
	CustomerID int NOT NULL,
    PersonID int,
	City nvarchar(25),
	Street nvarchar(50),
	Phone varchar(25),
    PRIMARY KEY (AddressID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

--
-- Stored procedure for insert in table `Customers`
--

-- --------------------------------------------------------

CREATE PROCEDURE sp_Customers_Insert (
 @CustomerID int output,
 @Name nvarchar(100),
 @Email varchar(100)
 )
 as
 insert into Customers(Name,Email)
 values(@Name,@Email)
 set @CustomerID = SCOPE_IDENTITY()

 --
-- Stored procedure for insert in table `Customers`
--

-- --------------------------------------------------------
CREATE PROCEDURE sp_Customers_Update (
 @CustomerID int output,
 @Name nvarchar(100),
 @Email varchar(100)
 )
 as