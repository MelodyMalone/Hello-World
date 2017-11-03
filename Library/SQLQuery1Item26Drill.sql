/* First Stored Procedure */
USE AdventureWorks2014
GO

CREATE PROCEDURE dbo.uspGetAddress
AS
SELECT * FROM Person.Address
GO

EXEC uspGetAddress;

/* Stored Procedure with Parameter */
USE AdventureWorks2014
GO

CREATE PROCEDURE dbo.uspGetAddressCity @City nvarchar(30)
AS
SELECT *
FROM Person.Address
WHERE City = @City
GO

EXEC dbo.uspGetAddressCity @City = 'New York';

