
CREATE TABLE Pizza (
Id int Primary Key Identity NOT NULL,
Name nvarchar(20) NOT NULL,
Price int NOT NULL,
SizeId int NOT NULL,
OrderId int NOT NULL
)

CREATE TABLE [Order] (
Id int Primary Key Identity NOT NULL,
IsDelivered bit NOT NULL,
UserId int Foreign Key References [User](Id) NOT NULL

)
ALTER TABLE Pizza 
Add  Constraint fk_OrderId 
Foreign Key (OrderId)
References [Order] (Id);

CREATE TABLE Topping (
Id int Primary Key Identity NOT NULL,
[Name] nvarchar(20) NOT NULL,
Price int NOT NULL


);


CREATE TABLE Size (
Id int Primary Key Identity NOT NULL,
[Name] nvarchar(20)

);

ALTER TABLE Pizza
ADD CONSTRAINT fk_SizeId
Foreign key(SizeId)
References Size (Id);

GO
CREATE OR ALTER FUNCTION dbo.fn_MergeFirstNameAndLastName(@firstName nvarchar (20), @lastName nvarchar(20)) 
RETURNS nvarchar (2000)
AS
BEGIN
	DECLARE @ourFirstName nvarchar(20) = @firstName,
	@ourLastName nvarchar(20) = @lastName
	
	DECLARE @result nvarchar(2000) = @ourFirstName + ' ' + @ourLastName  

RETURN @result
END

SELECT dbo.fn_MergeFirstNameAndLastName('Darko','Nikolikj') as FullName;
--There should be a view to show all pizzas that are not delivered yet 
--and the full names of the users waiting for them

CREATE VIEW vw_MyView 
AS (
SELECT Pizza.Name , dbo.fn_MergeFirstNameAndLastName([User].FirstName,[User].LastName) as FullName, IsDelivered
FROM Pizza
INNER JOIN [Order] on OrderId = [Order].Id
INNER JOIN [User] on UserId = [User].Id
WHERE IsDelivered = 1 
GROUP BY Pizza.Name, [User].FirstName, [User].LastName, IsDelivered

);

SELECT * FROM
vw_MyView;
GO
CREATE or ALTER Procedure InsertValues
As

Begin
	INSERT INTO [User] 
	VALUES('Bob', 'Bobsky','unknown adress', '070-307-746')

	INSERT INTO Size 
	VALUES('Mala')

	INSERT INTO Topping 
	VALUES ('Chedar', 20)

	INSERT INTO [Order] 
	VALUES (1,1)
	
	INSERT INTO [Pizza] 
	VALUES('Capri', 270,1,1)

End

EXEC InsertValues;


--There should be a stored procedure that when provided an Order Id, 
--can return the full price of a whole order ( Delivery + All Pizza + All Toppings )
GO
CREATE or ALTER Procedure FullPrice(

@OrderId int, 
@delivery int
)

as 
Begin
SELECT  SUM(@delivery + Pizza.Price + Topping.Price) as  TotalPrice
FROM Pizza 
INNER JOIN PizzaTopings on PizzaId = Pizza.Id
INNER JOIN Topping on ToppingId = Topping.Id
WHERE Pizza.OrderId = @OrderId

End

CREATE TABLE PizzaTopings ( 
Id int Primary Key Identity NOT NULL,
ToppingId int Foreign Key References Topping(Id),
PizzaId int Foreign Key References Pizza(Id)
);

INSERT INTO PizzaTopings
VALUES(1,1);

EXEC FullPrice @OrderId = 1 , @delivery = 20 ;
