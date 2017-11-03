USE db_zoo;
GO

SELECT * FROM tbl_species;

CREATE PROCEDURE dbo.uspGetNameID @species_name nvarchar(30) = NULL, @species_id nvarchar(30) =NULL
AS
SELECT * FROM tbl_species
INNER JOIN tbl_nutrition on nutrition_id = species_nutrition
INNER JOIN tbl_care on care_id = species_care
WHERE species_name = @species_name
or species_id = @species_id

EXEC dbo.uspGetNameID @species_id = '19';