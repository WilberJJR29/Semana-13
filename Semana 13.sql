USE [Northwind]

--obtener los clientes 
CREATE PROCEDURE getCustomerbyID 
@IDCUSTOMER NCHAR(5) = 'FISSA' --parametro de filtro 
AS 
   SELECT CustomerID, ContactName FROM Customers
   WHERE CustomerID=@IDCUSTOMER 

  --ejecutar procedimiento 
  EXEC getCustomerbyID 'FISSA'
  EXEC getCustomerbyID @IDCUSTOMER= 'FISSA' 

-- llamado con parametro con valor por defecto 
EXEC getCustomerbyID @IDCUSTOMER= 'ALFKI'

--crear procedimiento con parametros de salida 
CREATE PROCEDURE getTotalProducts 
@TOTALP INT OUTPUT 
AS
SELECT * FROM Products 
SELECT @TOTALP=@@ROWCOUNT 
RETURN (0) 

DECLARE @products INT --variable para almacenar el parametro de salida 
EXEC getTotalProducts @TOTALP = @products OUTPUT 
SELECT [total] = @products 

--BORAR UN PROCEDIMIENTO 

DROP PROCEDURE getTotalProducts 

--procedimiento para insertar registro en una tabla 
CREATE PROCEDURE insertRegion 
    @ID INT, 
    @DESC VARCHAR(20)
AS 
    IF(SELECT COUNT(*) FROM Region WHERE RegionID=@ID OR RegionDescription=@DESC)=0 
	INSERT INTO Region(RegionID, RegionDescription) VALUES (@ID, @DESC)
	ELSE 
	    PRINT 'La region ya existe, intente con otro nombre'

SELECT * FROM Region;
EXEC insertRegion 5, 'Eastern'
EXEC insertRegion 1, 'New Region'
EXEC insertRegion 5, 'New Region'

--select CASE/verificar si existe empleado en un pais determinado 
CREATE PROCEDURE employeeExistbyCountry 
@COUNTRY VARCHAR (20)
AS 
  SELECT 
    CASE(SELECT COUNT (*) FROM Employees WHERE Country=@COUNTRY) 
	WHEN 0 THEN 'No tenemos empleados en el pais ' + @COUNTRY
	ELSE 'Si tenemos empleados del pais' + @COUNTRY 
END 

EXEC employeeExistbyCountry 'MEXICO'

--mostrar el total por orden 
CREATE PROCEDURE totalbyOrder 
AS 
   SELECT OrderID, SUM(Quantity*UnitPrice) AS total FROM [Order Details] 
   GROUP BY OrderID 
   EXEC totalbyOrder 

--1 modificar el procedimiento anterior de tal manera que reciba como parametro
--el codigo de la orden 

CREATE PROCEDURE ejercicio1
AS 
   SELECT OrderID, SUM(Quantity*UnitPrice) AS total FROM [Order Details] 
   GROUP BY OrderID 
   EXEC ejercicio1

   DECLARE @products INT 
EXEC getTotalProducts @TOTALP = @products OUTPUT 
SELECT [total] = @products  

--2 Cree un procedimiento que reciba el año como parametro y muestre nombre y fecha de contacto 
--de los empleados contratados durante ese año 

CREATE PROCEDURE YEAR
@TOTALP INT OUTPUT 
AS 
SELECT * FROM YEAR 


--3 modificar el procedimiento anterior para qur tambien reciba 
--un parametro de salida en el cual debera mostrar el total de empleados 
--contratados ese año 










  



