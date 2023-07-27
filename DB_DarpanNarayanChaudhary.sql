USE DB_DARPAN_NARAYAN_CHAUDHARY;

GO


SELECT * FROM Product;
SELECT * FROM Customer;
SELECT * FROM Employee;
SELECT * FROM Invoice;
SELECT * FROM InvoiceDetail;
SELECT * FROM SalesTransaction;

DROP TABLE Product;
DROP TABLE Customer;
DROP TABLE Employee;
DROP TABLE Invoice;
DROP TABLE InvoiceDetail;
DROP TABLE SalesTransaction;

--#1

CREATE TABLE Product (
   ProductID INT PRIMARY KEY IDENTITY(1,1),
   ProductName VARCHAR(50) NOT NULL,
   Manufacturer VARCHAR(255),
   Manufacturer_Date DATE NOT NULL,
   Description TEXT,
   Price DECIMAL(10,2) NOT NULL DEFAULT 10,
   Quantity INT NOT NULL DEFAULT 1 CHECK (Quantity >= 1),
   TotalPrice AS (Quantity * Price * 1.0)
   UNIQUE(ProductName)
  
);

--#2


CREATE TABLE Customer (
    CustomerID int PRIMARY KEY IDENTITY(1,1),
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Email varchar(100) UNIQUE NOT NULL,
    Phone varchar(20) NOT NULL,
    Address varchar(200) NOT NULL,
    City varchar(50) NOT NULL,
    State varchar(50) NOT NULL,
    ZipCode varchar(20) NOT NULL,
    Country varchar(50) NOT NULL,
    Created_date DATETIME NOT NULL DEFAULT GETDATE(),
    Modified_date DATETIME NOT NULL DEFAULT GETDATE(),
   
);


--#3

CREATE TABLE Employee (
    EmployeeID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
	BirthDate DATE NOT NULL,
    HireDate DATE NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    
);

--#4

CREATE TABLE Invoice (
    InvoiceID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    InvoiceDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Discount DECIMAL(5, 2) NOT NULL,
    CONSTRAINT FK_Customer_Invoice FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT CHK_Discount_Invoice CHECK (Discount >=10 AND Discount <=20),
    CONSTRAINT CHK_TotalAmount_Invoice CHECK (TotalAmount >=1000)
);



SELECT * FROM Invoice;



--#5
CREATE TABLE InvoiceDetail (
    InvoiceDetailID INT PRIMARY KEY,
    InvoiceID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    CONSTRAINT FK_Invoice_InvoiceDetail FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID),
    CONSTRAINT FK_Product_InvoiceDetail FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    CONSTRAINT CHK_Quantity_InvoiceDetail CHECK (Quantity > 0)
);

SELECT * FROM InvoiceDetail;




--#6
CREATE TABLE SalesTransaction (
    TransactionID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    TransactionDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    Discount DECIMAL(5,2) NOT NULL,
    CONSTRAINT FK_SalesTransaction_Customer
        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  
    CONSTRAINT CHK_SalesTransaction_Discount
        CHECK (
            (TotalAmount < 1000 AND Discount = 5)
            OR (TotalAmount >= 1000 AND TotalAmount < 2000 AND Discount = 10)
            OR (TotalAmount >= 10000 AND Discount = 20))     
);


-- Inserting data into SalesTransaction table
INSERT INTO SalesTransaction (TransactionID, CustomerID, TransactionDate, TotalAmount, Discount)
VALUES
   (8, 8, '2023-01-01', 500.00, 5.00);

   INSERT INTO SalesTransaction (TransactionID, CustomerID, TransactionDate, TotalAmount, Discount)
VALUES
   (9, 1, '2023-01-01', 500.00, 5.00);

     INSERT INTO SalesTransaction (TransactionID, CustomerID, TransactionDate, TotalAmount, Discount)
VALUES

   (10, 12, '2023-01-02', 1500.00, 10.00);

   INSERT INTO SalesTransaction (TransactionID, CustomerID, TransactionDate, TotalAmount, Discount)
VALUES
   (11, 1, '2023-01-01', 500.00, 5.00),
   (12, 2, '2023-01-02', 1500.00, 10.00);

  

  INSERT INTO SalesTransaction (TransactionID, CustomerID, TransactionDate, TotalAmount, Discount)
VALUES
   (13, 1, '2023-01-01', 500.00, 5.00),
   (14, 2, '2023-01-02', 1500.00, 10.00),
   (15, 3, '2023-01-03', 800.00, 5.00);

  




 


SELECT * FROM Customer;
SELECT * FROM Employee;
Select * FROM Product;
Select * From Invoice;
Select * From InvoiceDetail;
SELECT * FROM SalesTransaction;






INSERT INTO Product (ProductName, Manufacturer, Manufacturer_Date, Description, Price, Quantity)
VALUES
    ('iPhone 12', 'Apple', '2021-01-01', 'The latest iPhone', 999.99, 10),
    ('Galaxy S21', 'Samsung', '2021-02-01', 'The latest Samsung Galaxy phone', 799.99, 5),
    ('MacBook Pro', 'Apple', '2021-03-01', 'The latest MacBook Pro', 1299.99, 7),
    ('Surface Laptop 4', 'Microsoft', '2021-04-01', 'The latest Surface Laptop', 999.99, 3),
    ('PlayStation 5', 'Sony', '2021-05-01', 'The latest PlayStation', 499.99, 8),
    ('Xbox Series X', 'Microsoft', '2021-06-01', 'The latest Xbox', 499.99, 6),
    ('AirPods Pro', 'Apple', '2021-07-01', 'The latest AirPods', 249.99, 12),
    ('Galaxy Buds Pro', 'Samsung', '2021-08-01', 'The latest Samsung earbuds', 199.99, 9),
    ('iPad Pro', 'Apple', '2021-09-01', 'The latest iPad', 799.99, 4),
    ('Kindle Paperwhite', 'Amazon', '2021-10-01', 'The latest Kindle e-reader', 129.99, 15),
    ('Pixel 6', 'Google', '2021-11-01', 'The latest Pixel phone', 899.99, 3),
    ('Echo Dot', 'Amazon', '2021-12-01', 'The latest Echo Dot smart speaker', 49.99, 20),
    ('Apple Watch Series 7', 'Apple', '2022-01-01', 'The latest Apple Watch', 399.99, 6),
    ('Galaxy Watch 4', 'Samsung', '2022-02-01', 'The latest Samsung smartwatch', 299.99, 8),
    ('Surface Pro 8', 'Microsoft', '2022-03-01', 'The latest Surface Pro', 1299.99, 5),
    ('Nintendo Switch OLED', 'Nintendo', '2022-04-01', 'The latest Nintendo Switch', 349.99, 9),
    ('Bose QuietComfort 35 II', 'Bose', '2022-05-01', 'The latest Bose noise-cancelling headphones', 299.99, 4),
    ('Sony WH-1000XM4', 'Sony', '2022-06-01', 'The latest Sony noise-cancelling headphones', 349.99, 3),
    ('Logitech MX Master 3', 'Logitech', '2022-07-01', 'The latest Logitech mouse', 99.99, 10),
    ('Razer DeathAdder V2', 'Razer', '2022-08-01', 'The latest Razer mouse', 69.99, 12),
    ('Samsung Odyssey G9', 'Samsung', '2022-09-01', 'The latest Samsung gaming monitor', 1999.99, 2);
   

   SELECT * FROM PRODUCT;


   INSERT INTO Product (ProductName, Manufacturer, Manufacturer_Date, Description, Price, Quantity)
VALUES


('MacBook Pro 16-inch', 'Apple Inc.', '2019-11-13', 'A powerful laptop with a stunning Retina display.', 2399.99, 10),
('ThinkPad X1 Carbon', 'Lenovo', '2021-01-01', 'A lightweight business laptop with a durable design.', 1399.99, 15),
('Surface Pro 7', 'Microsoft', '2019-10-22', 'A versatile tablet with a detachable keyboard and pen support.', 899.99, 30),
('Pixel 5', 'Google', '2020-10-15', 'A flagship Android smartphone with a 90Hz OLED display.', 699.99, 25),
('Galaxy Tab S7+', 'Samsung', '2020-08-05', 'A premium Android tablet with a 120Hz OLED display.', 849.99, 15);




INSERT INTO Customer (FirstName, LastName, Email, Phone, Address, City, State, ZipCode, Country)
VALUES
    ('John', 'Doe', 'john.doe@example.com', '555-1234', '123 Main St', 'Anytown', 'CA', '12345', 'USA'),
    ('Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Oak St', 'Othertown', 'NY', '67890', 'USA'),
    ('Bob', 'Johnson', 'bob.johnson@example.com', '555-9876', '789 Pine St', 'Smallville', 'TX', '54321', 'USA'),
    ('Alice', 'Williams', 'alice.williams@example.com', '555-4321', '321 Elm St', 'Bigtown', 'IL', '09876', 'USA'),
    ('Michael', 'Davis', 'michael.davis@example.com', '555-8765', '234 Cedar St', 'Anytown', 'CA', '12345', 'USA'),
    ('Emily', 'Taylor', 'emily.taylor@example.com', '555-2468', '567 Maple St', 'Othertown', 'NY', '67890', 'USA'),
    ('William', 'Jones', 'william.jones@example.com', '555-3698', '890 Birch St', 'Smallville', 'TX', '54321', 'USA'),
    ('Olivia', 'Brown', 'olivia.brown@example.com', '555-1357', '432 Oak St', 'Bigtown', 'IL', '09876', 'USA'),
    ('David', 'Garcia', 'david.garcia@example.com', '555-8642', '567 Pine St', 'Anytown', 'CA', '12345', 'USA'),
    ('Sophia', 'Martinez', 'sophia.martinez@example.com', '555-7913', '890 Cedar St', 'Othertown', 'NY', '67890', 'USA'),
    ('James', 'Rodriguez', 'james.rodriguez@example.com', '555-6421', '123 Elm St', 'Smallville', 'TX', '54321', 'USA'),
    ('Ava', 'Hernandez', 'ava.hernandez@example.com', '555-1235', '456 Maple St', 'Bigtown', 'IL', '09876', 'USA'),
    ('Jacob', 'Walker', 'jacob.walker@example.com', '555-8643', '789 Birch St', 'Anytown', 'CA', '12345', 'USA'),
    ('Isabella', 'Hall', 'isabella.hall@example.com', '555-3699', '234 Cedar St', 'Othertown', 'NY', '67890', 'USA'),
    ('Ethan', 'Allen', 'ethan.allen@example.com', '555-2469', '567 Oak St', 'Smallville', 'TX', '54321', 'USA'),
    ('Mia', 'Young', 'mia.young@example.com', '555-1358', '890 Pine St', 'Bigtown', 'IL', '09876', 'USA'),
    ('Noah', 'King', 'noah.king@example.com', '555-9877', '123 Elm St', 'Anytown', 'CA', '12345', 'USA');

	SELECT * FROM Customer;

	
INSERT INTO Customer (FirstName, LastName, Email, Phone, Address, City, State, ZipCode, Country)
VALUES
	('ADaKvidS', 'Garcia', 'davidaa.garcia@example.com', '555-8642', '567 Pine St', 'Anytown', 'CA', '12345', 'KATHMANDU'),
    ('ASoKphiaS', 'Martinez', 'sopahia.martinez@example.com', '555-7913', '890 Cedar St', 'Othertown', 'NY', '67890', 'NEPAL'),
    ('James', 'Rodriguez', 'jaames.rodriguez@example.com', '555-6421', '123 Elm St', 'Smallville', 'TX', '54321', 'KIRTIPUR'),
    ('AvKaS', 'Hernandez', 'avaa.hernandez@example.com', '555-1235', '456 Maple St', 'Bigtown', 'IL', '09876', 'UAE'),
    ('Jacob', 'Walker', 'jacxxob.walker@example.com', '555-8643', '789 Birch St', 'Anytown', 'CA', '12345', 'NEPAL'),
    ('AIsaKbellaS', 'Hall', 'isxxabella.hall@example.com', '555-3699', '234 Cedar St', 'Othertown', 'NY', '67890', 'INDIA'),
    ('Ethan', 'Allen', 'ethbban.allen@example.com', '555-2469', '567 Oak St', 'Smallville', 'TX', '54321', 'BD'),
    ('AMiaK', 'Young', 'miwwa.young@example.com', '555-1358', '890 Pine St', 'Bigtown', 'IL', '09876', 'UK'),
    ('AANoKahS', 'King', 'noaaah.king@example.com', '555-9877', '123 Elm St', 'Anytown', 'CA', '12345', 'LONDON');



	

INSERT INTO Employee (EmployeeID, FirstName, LastName, Email, PhoneNumber, BirthDate, HireDate, Salary)
VALUES 
    (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '1990-01-01', '2020-01-01', 50000.00),
    (2, 'Jane', 'Doe', 'jane.doe@example.com', '123-456-7890', '1991-02-02', '2020-01-01', 60000.00),
    (3, 'Bob', 'Smith', 'bob.smith@example.com', '123-456-7890', '1992-03-03', '2021-01-01', 70000.00),
    (4, 'Alice', 'Johnson', 'alice.johnson@example.com', '123-456-7890', '1993-04-04', '2021-01-01', 80000.00),
    (5, 'Tom', 'Wilson', 'tom.wilson@example.com', '123-456-7890', '1994-05-05', '2022-01-01', 90000.00),
    (6, 'Linda', 'Lee', 'linda.lee@example.com', '123-456-7890', '1995-06-06', '2022-01-01', 100000.00),
    (7, 'David', 'Brown', 'david.brown@example.com', '123-456-7890', '1996-07-07', '2023-01-01', 110000.00),
    (8, 'Mary', 'Davis', 'mary.davis@example.com', '123-456-7890', '1997-08-08', '2023-01-01', 120000.00),
    (9, 'Mike', 'Taylor', 'mike.taylor@example.com', '123-456-7890', '1998-09-09', '2024-01-01', 130000.00),
    (10, 'Samantha', 'Martin', 'samantha.martin@example.com', '123-456-7890', '1999-10-10', '2024-01-01', 140000.00),
    (11, 'Alex', 'Harris', 'alex.harris@example.com', '123-456-7890', '2000-11-11', '2025-01-01', 150000.00),
    (12, 'Emily', 'Allen', 'emily.allen@example.com', '123-456-7890', '2001-12-12', '2025-01-01', 160000.00),
    (13, 'Chris', 'Young', 'chris.young@example.com', '123-456-7890', '2002-01-01', '2026-01-01', 170000.00);
 

 Select * From Employee;




INSERT INTO Employee (EmployeeID, FirstName, LastName, Email, PhoneNumber, BirthDate, HireDate, Salary) VALUES
(14, 'John', 'Doe', 'johndoe11@example.com', '123-456-7890', '1990-01-01', '2020-01-01', 50000.00),
(15, 'Jane', 'Doe', 'janedoe33@example.com', '123-456-7891', '1992-05-10', '2021-05-10', 55000.00),
(16, 'David', 'Smith', 'davidsmith889@example.com', '123-456-7892', '1988-11-15', '2018-01-15', 60000.00),
(17, 'Emily', 'Jones', 'emilyjones334@example.com', '123-456-7893', '1995-02-20', '2021-02-20', 55000.00),
(18, 'Michael', 'Wilson', 'michaelwilson887@example.com', '123-456-7894', '1991-06-05', '2019-06-05', 65000.00),
(19, 'Amanda', 'Brown', 'amandabrown8890@example.com', '123-456-7895', '1993-09-25', '2020-09-25', 60000.00),
(20, 'Daniel', 'Davis', 'danieldavis@example.com', '123-456-7896', '1989-12-30', '2017-12-30', 70000.00),
(21, 'Jessica', 'Garcia', 'jessicagarcia3322@example.com', '123-456-7897', '1994-04-12', '2022-04-12', 50000.00),
(22, 'Kevin', 'Lee', 'kevinlee2234@example.com', '123-456-7898', '1990-07-18', '2018-07-18', 75000.00),
(23, 'Megan', 'Nguyen', 'megannguyen456@example.com', '123-456-7899', '1992-10-05', '2021-10-05', 55000.00),
(24, 'Adam', 'Taylor', 'adamtaylor33456@example.com', '123-456-7900', '1988-03-20', '2016-03-20', 80000.00),
(25, 'Samantha', 'Wilson', 'samanthawilson445567@example.com', '123-456-7901', '1993-08-15', '2019-08-15', 60000.00),
(26, 'Brandon', 'Thomas', 'brandonthomas11234@example.com', '123-456-7902', '1989-11-05', '2017-11-05', 70000.00);



INSERT INTO Invoice (InvoiceID, CustomerID, InvoiceDate, TotalAmount, Discount) VALUES
(1, 1, '2023-01-01', 1500.00, 15.00),
(2, 2, '2023-01-02', 1200.00, 10.00),
(3, 3, '2023-01-03', 2000.00, 12.50),
(4, 4, '2023-01-04', 1800.00, 18.00);

INSERT INTO Invoice (InvoiceID, CustomerID, InvoiceDate, TotalAmount, Discount) VALUES

(5, 5, '2023-01-05', 2500.00, 20.00),
(6, 6, '2023-01-06', 1100.00, 11.50),
(7, 7, '2023-01-07', 1300.00, 13.00),
(8, 8, '2023-01-08', 1700.00, 17.50),
(9, 9, '2023-01-09', 2200.00, 19.00),
(10, 10, '2023-01-10', 1900.00, 15.50),
(11, 11, '2023-01-11', 2100.00, 12.00),
(12, 12, '2023-01-12', 1400.00, 10.50),
(13, 13, '2023-01-13', 1600.00, 11.00),
(14, 14, '2023-01-14', 2300.00, 14.00),
(15, 15, '2023-01-15', 2700.00, 16.00),
(16, 16, '2023-01-16', 2900.00, 18.50),
(17, 17, '2023-01-17', 1500.00, 15.00),
(20, 20, '2023-01-20', 1800.00, 12.00);

SELECT * FROM Invoice;


INSERT INTO InvoiceDetail (InvoiceDetailID, InvoiceID, ProductID, Quantity) VALUES
(1, 1, 1, 5),
(2, 1, 2, 3),
(3, 2, 3, 2),
(4, 3, 4, 4),
(5, 3, 5, 1),
(6, 4, 6, 2),
(7, 5, 7, 3),
(8, 5, 8, 2),
(9, 6, 9, 5),
(10, 6, 10, 2),
(11, 7, 11, 3),
(12, 8, 12, 4),
(13, 8, 13, 1),
(14, 9, 14, 2),
(15, 10, 15, 3),
(16, 10, 16, 2),
(17, 11, 17, 5),
(18, 12, 18, 2),
(19, 12, 19, 3),
(20, 13, 20, 4);

SELECT * FROM InvoiceDetail;



INSERT INTO SalesTransaction (TransactionID, CustomerID, TransactionDate, TotalAmount, Discount)
VALUES 
    (1, 1, '2023-05-01', 500.00, 5.00);

	INSERT INTO SalesTransaction (TransactionID, CustomerID, TransactionDate, TotalAmount, Discount)
VALUES 

    (2, 2, '2023-05-02', 1200.00, 10.00),
    (3, 3, '2023-05-03', 15000.00, 20.00),
    (4, 4, '2023-05-04', 800.00, 5.00),
    (5, 5, '2023-05-05', 900.00, 5.00);

		INSERT INTO SalesTransaction (TransactionID, CustomerID, TransactionDate, TotalAmount, Discount)
VALUES 

    (6, 6, '2023-05-06', 1100.00, 10.00),
    (7, 7, '2023-05-07', 1200.00, 10.00);



SELECT * FROM SalesTransaction;


SELECT *
FROM Customer
WHERE (FirstName LIKE 'A%K%S');

SELECT * FROM Customer;
SELECT * FROM Invoice;

SELECT *
FROM Customer
LEFT JOIN Invoice  ON Customer.CustomerID = Invoice.InvoiceID
WHERE Invoice.InvoiceID IS NULL;

SELECT *
FROM Customer
LEFT JOIN Invoice  ON Customer.CustomerID = Invoice.InvoiceID
WHERE Invoice.InvoiceID IS NOT NULL;


SELECT TOP 1 C.FirstName, C.LastName, C.Phone
FROM Customer C
JOIN Invoice I ON C.CustomerID = I.CustomerID
WHERE I.InvoiceDate BETWEEN '2023-01-07' AND '2023-01-20'
ORDER BY I.TotalAmount DESC;


SELECT TOP 1 C.FirstName, I.TotalAmount, I.InvoiceDate
FROM Customer C
JOIN Invoice I ON C.CustomerID = I.CustomerID
WHERE I.InvoiceDate BETWEEN '2023-01-07' AND '2023-01-20'
ORDER BY I.TotalAmount DESC;



SELECT * FROM Product;
SELECT * FROM InvoiceDetail;

DELETE FROM Product
WHERE ProductID NOT IN (
    SELECT DISTINCT ProductID
    FROM InvoiceDetail
    JOIN Invoice ON InvoiceDetail.InvoiceID = Invoice.InvoiceID
    WHERE YEAR(Invoice.InvoiceDate) = YEAR(GETDATE())
);

SELECT *
FROM Product
WHERE Quantity <4;


SELECT TOP 1 P.ProductName
FROM Product P
JOIN InvoiceDetail ID ON P.ProductID = ID.ProductID
JOIN Invoice I ON ID.InvoiceID = I.InvoiceID
WHERE YEAR(I.InvoiceDate) = YEAR(GETDATE())
GROUP BY P.ProductName
ORDER BY COUNT(DISTINCT I.CustomerID) DESC;





SELECT C.FirstName
FROM Customer C
JOIN Invoice I ON C.CustomerID = I.CustomerID
JOIN InvoiceDetail ID ON I.InvoiceID = ID.InvoiceID
GROUP BY C.FirstName
HAVING COUNT(ID.ProductID) > 1;

SELECT C.FirstName
FROM Customer C
JOIN Invoice I ON C.CustomerID = I.CustomerID
JOIN InvoiceDetail ID ON I.InvoiceID = ID.InvoiceID
GROUP BY C.FirstName
HAVING COUNT(ID.ProductID) > 10;




--CRUD 



DROP PROCEDURE IF EXISTS CreateProduct;
DROP PROCEDURE IF EXISTS GetProductByID;

DROP PROCEDURE IF EXISTS UpdateProduct;
DROP PROCEDURE IF EXISTS DeleteProduct;


--#1 Product

CREATE PROCEDURE CreateProduct
(
   @ProductName VARCHAR(50),
   @Manufacturer VARCHAR(255),
   @Manufacturer_Date DATE,
   @Description TEXT,
   @Price DECIMAL(10,2),
   @Quantity INT
)
AS
BEGIN
   SET NOCOUNT ON;

   BEGIN TRY
      BEGIN TRANSACTION;

      INSERT INTO Product (ProductName, Manufacturer, Manufacturer_Date, Description, Price, Quantity)
      VALUES (@ProductName, @Manufacturer, @Manufacturer_Date, @Description, @Price, @Quantity);

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      ROLLBACK TRANSACTION;
      THROW;
   END CATCH;
END;


CREATE PROCEDURE GetProductByID
(
   @ProductID INT
)
AS
BEGIN
   SET NOCOUNT ON;

   SELECT *
   FROM Product
   WHERE ProductID = @ProductID;
END;

CREATE PROCEDURE UpdateProduct
(
   @ProductID INT,
   @ProductName VARCHAR(50),
   @Manufacturer VARCHAR(255),
   @Manufacturer_Date DATE,
   @Description TEXT,
   @Price DECIMAL(10,2),
   @Quantity INT
)
AS
BEGIN
   SET NOCOUNT ON;

   BEGIN TRY
      BEGIN TRANSACTION;

      UPDATE Product
      SET ProductName = @ProductName,
          Manufacturer = @Manufacturer,
          Manufacturer_Date = @Manufacturer_Date,
          Description = @Description,
          Price = @Price,
          Quantity = @Quantity
      WHERE ProductID = @ProductID;

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      ROLLBACK TRANSACTION;
      THROW;
   END CATCH;
END;


CREATE PROCEDURE DeleteProduct
(
   @ProductID INT
)
AS
BEGIN
   SET NOCOUNT ON;

   BEGIN TRY
      BEGIN TRANSACTION;

      DELETE FROM Product
      WHERE ProductID = @ProductID;

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      ROLLBACK TRANSACTION;
      THROW;
   END CATCH;
END;



--#2 Customer

CREATE PROCEDURE CreateCustomer
(
   @CustomerDetails NVARCHAR(MAX)
)
AS
BEGIN
   BEGIN TRY
      BEGIN TRANSACTION;
      DECLARE @FirstName VARCHAR(50);
      DECLARE @LastName VARCHAR(50);
      DECLARE @Email VARCHAR(100);
      DECLARE @Phone VARCHAR(20);
      DECLARE @Address VARCHAR(200);
      DECLARE @City VARCHAR(50);
      DECLARE @State VARCHAR(50);
      DECLARE @ZipCode VARCHAR(20);
      DECLARE @Country VARCHAR(50);
      DECLARE @CreatedDate DATETIME;
      DECLARE @ModifiedDate DATETIME;
      
      SELECT 
         @FirstName = JSON_VALUE(@CustomerDetails, '$.FirstName'),
         @LastName = JSON_VALUE(@CustomerDetails, '$.LastName'),
         @Email = JSON_VALUE(@CustomerDetails, '$.Email'),
         @Phone = JSON_VALUE(@CustomerDetails, '$.Phone'),
         @Address = JSON_VALUE(@CustomerDetails, '$.Address'),
         @City = JSON_VALUE(@CustomerDetails, '$.City'),
         @State = JSON_VALUE(@CustomerDetails, '$.State'),
         @ZipCode = JSON_VALUE(@CustomerDetails, '$.ZipCode'),
         @Country = JSON_VALUE(@CustomerDetails, '$.Country'),
         @CreatedDate = GETDATE(),
         @ModifiedDate = GETDATE();

      INSERT INTO Customer (FirstName, LastName, Email, Phone, Address, City, State, ZipCode, Country, Created_date, Modified_date)
      VALUES (@FirstName, @LastName, @Email, @Phone, @Address, @City, @State, @ZipCode, @Country, @CreatedDate, @ModifiedDate);

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      IF @@TRANCOUNT > 0
         ROLLBACK TRANSACTION;
      THROW;
   END CATCH;
END;


CREATE PROCEDURE GetCustomerByID
(
   @CustomerID INT
)
AS
BEGIN
   SELECT *
   FROM Customer
   WHERE CustomerID = @CustomerID;
END;

CREATE PROCEDURE UpdateCustomer
(
   @CustomerID INT,
   @CustomerDetails NVARCHAR(MAX)
)
AS
BEGIN
   BEGIN TRY
      BEGIN TRANSACTION;
      DECLARE @FirstName VARCHAR(50);
      DECLARE @LastName VARCHAR(50);
      DECLARE @Email VARCHAR(100);
      DECLARE @Phone VARCHAR(20);
      DECLARE @Address VARCHAR(200);
      DECLARE @City VARCHAR(50);
      DECLARE @State VARCHAR(50);
      DECLARE @ZipCode VARCHAR(20);
      DECLARE @Country VARCHAR(50);
      DECLARE @ModifiedDate DATETIME;

      SELECT 
         @FirstName = JSON_VALUE(@CustomerDetails, '$.FirstName'),
         @LastName = JSON_VALUE(@CustomerDetails, '$.LastName'),
         @Email = JSON_VALUE(@CustomerDetails, '$.Email'),
         @Phone = JSON_VALUE(@CustomerDetails, '$.Phone'),
         @Address = JSON_VALUE(@CustomerDetails, '$.Address'),
         @City = JSON_VALUE(@CustomerDetails, '$.City'),
         @State = JSON_VALUE(@CustomerDetails, '$.State'),
         @ZipCode = JSON_VALUE(@CustomerDetails, '$.ZipCode'),
         @Country = JSON_VALUE(@CustomerDetails, '$.Country'),
         @ModifiedDate = GETDATE();

      UPDATE Customer
      SET FirstName = @FirstName,
          LastName = @LastName,
          Email = @Email,
          Phone = @Phone,
          Address = @Address,
          City = @City,
          State = @State,
          ZipCode = @ZipCode,
          Country = @Country,
          Modified_date = @ModifiedDate
      WHERE CustomerID = @CustomerID;

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      IF @@TRANCOUNT > 0
         ROLLBACK TRANSACTION;
      THROW;
   END CATCH;
END;

CREATE PROCEDURE DeleteCustomer
(
   @CustomerID INT
)
AS
BEGIN
   SET NOCOUNT ON;

   BEGIN TRY
      BEGIN TRANSACTION;

      DELETE FROM Customer
      WHERE CustomerID = @CustomerID;

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      ROLLBACK TRANSACTION;
      THROW;
   END CATCH
END;



---#3 Employee

CREATE PROCEDURE CreateEmployee
(
   @EmployeeID INT,
   @FirstName VARCHAR(50),
   @LastName VARCHAR(50),
   @Email VARCHAR(100),
   @PhoneNumber VARCHAR(20),
   @BirthDate DATE,
   @HireDate DATE,
   @Salary DECIMAL(10,2)
)
AS
BEGIN
   SET NOCOUNT ON;

   BEGIN TRY
      BEGIN TRANSACTION;

      INSERT INTO Employee (EmployeeID, FirstName, LastName, Email, PhoneNumber, BirthDate, HireDate, Salary)
      VALUES (@EmployeeID, @FirstName, @LastName, @Email, @PhoneNumber, @BirthDate, @HireDate, @Salary);

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      ROLLBACK TRANSACTION;
      THROW;
   END CATCH;
END;


CREATE PROCEDURE GetEmployeeByID
(
   @EmployeeID INT
)
AS
BEGIN
   SET NOCOUNT ON;

   SELECT *
   FROM Employee
   WHERE EmployeeID = @EmployeeID;
END;


CREATE PROCEDURE UpdateEmployee
(
   @EmployeeID INT,
   @FirstName VARCHAR(50),
   @LastName VARCHAR(50),
   @Email VARCHAR(100),
   @PhoneNumber VARCHAR(20),
   @BirthDate DATE,
   @HireDate DATE,
   @Salary DECIMAL(10,2)
)
AS
BEGIN
   SET NOCOUNT ON;

   BEGIN TRY
      BEGIN TRANSACTION;

      UPDATE Employee
      SET FirstName = @FirstName,
          LastName = @LastName,
          Email = @Email,
          PhoneNumber = @PhoneNumber,
          BirthDate = @BirthDate,
          HireDate = @HireDate,
          Salary = @Salary
      WHERE EmployeeID = @EmployeeID;

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      ROLLBACK TRANSACTION;
      THROW;
   END CATCH;
END;


CREATE PROCEDURE DeleteEmployee
(
   @EmployeeID INT
)
AS
BEGIN
   SET NOCOUNT ON;

   BEGIN TRY
      BEGIN TRANSACTION;

      DELETE FROM Employee
      WHERE EmployeeID = @EmployeeID;

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      ROLLBACK TRANSACTION;
      THROW;
   END CATCH;
END;




---#4 Invoice

CREATE PROCEDURE CreateInvoice
(
   @InvoiceID INT,
   @CustomerID INT,
   @InvoiceDate DATE,
   @TotalAmount DECIMAL(10, 2)
)
AS
BEGIN
   SET NOCOUNT ON;

   BEGIN TRY
      BEGIN TRANSACTION;

      -- Calculate discount based on total amount
      DECLARE @Discount DECIMAL(5, 2);
      IF @TotalAmount <= 1000
         SET @Discount = 0.05;  -- 5% discount
      ELSE
         SET @Discount = 0.10;  -- 10% discount

      -- Insert invoice record
      INSERT INTO Invoice (InvoiceID, CustomerID, InvoiceDate, TotalAmount, Discount)
      VALUES (@InvoiceID, @CustomerID, @InvoiceDate, @TotalAmount, @Discount);

      -- Tag the sales transactions with the correct invoice
      UPDATE Product
      SET @InvoiceID = @InvoiceID
      WHERE @CustomerID = @CustomerID;

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      ROLLBACK TRANSACTION;
      THROW;
   END CATCH;
END;


CREATE PROCEDURE GetInvoiceByID
(
   @InvoiceID INT
)
AS
BEGIN
   SET NOCOUNT ON;

   SELECT *
   FROM Invoice
   WHERE InvoiceID = @InvoiceID;
END;


CREATE PROCEDURE UpdateInvoice
(
   @InvoiceID INT,
   @CustomerID INT,
   @InvoiceDate DATE,
   @TotalAmount DECIMAL(10, 2)
)
AS
BEGIN
   SET NOCOUNT ON;

   BEGIN TRY
      BEGIN TRANSACTION;

      -- Calculate discount based on total amount
      DECLARE @Discount DECIMAL(5, 2);
      IF @TotalAmount <= 1000
         SET @Discount = 0.05;  -- 5% discount
      ELSE
         SET @Discount = 0.10;  -- 10% discount

      -- Update invoice record
      UPDATE Invoice
      SET CustomerID = @CustomerID,
          InvoiceDate = @InvoiceDate,
          TotalAmount = @TotalAmount,
          Discount = @Discount
      WHERE InvoiceID = @InvoiceID;

      -- Update the tagged sales transactions with the correct invoice
      UPDATE Product
      SET @InvoiceID = @InvoiceID
      WHERE @CustomerID = @CustomerID;

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      ROLLBACK TRANSACTION;
      THROW;
   END CATCH;
END;


CREATE PROCEDURE DeleteInvoice
(
   @InvoiceID INT
)
AS
BEGIN
   SET NOCOUNT ON;

   BEGIN TRY
      BEGIN TRANSACTION;

      -- Remove the tag from the related sales transactions
      UPDATE Product
      SET @InvoiceID = NULL
      WHERE @InvoiceID = @InvoiceID;

      -- Delete the invoice record
      DELETE FROM Invoice
      WHERE InvoiceID = @InvoiceID;

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      ROLLBACK TRANSACTION;
      THROW;
   END CATCH;
END;


---#5 InvoiceDetails

Drop PROCEDURE CreateInvoiceDetail;


CREATE PROCEDURE CreateInvoiceDetail
(
   @InvoiceDetailID INT,
   @InvoiceID INT,
   @ProductID INT,
   @Quantity INT
)
AS
BEGIN
   SET NOCOUNT ON;

   BEGIN TRY
      BEGIN TRANSACTION;

      -- Insert invoice detail record
      INSERT INTO InvoiceDetail (InvoiceDetailID, InvoiceID, ProductID, Quantity)
      VALUES (@InvoiceDetailID, @InvoiceID, @ProductID, @Quantity);

      -- Tag the sales transaction with the correct invoice
      UPDATE Product
      SET @InvoiceID = @InvoiceID
      WHERE ProductID = @ProductID;

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      ROLLBACK TRANSACTION;
      THROW;
   END CATCH;
END;


CREATE PROCEDURE GetInvoiceDetailByID
(
   @InvoiceDetailID INT
)
AS
BEGIN
   SET NOCOUNT ON;

   SELECT *
   FROM InvoiceDetail
   WHERE InvoiceDetailID = @InvoiceDetailID;
END;



CREATE PROCEDURE UpdateInvoiceDetail
(
   @InvoiceDetailID INT,
   @InvoiceID INT,
   @ProductID INT,
   @Quantity INT
)
AS
BEGIN
   SET NOCOUNT ON;

   BEGIN TRY
      BEGIN TRANSACTION;

      -- Update invoice detail record
      UPDATE InvoiceDetail
      SET InvoiceID = @InvoiceID,
          ProductID = @ProductID,
          Quantity = @Quantity
      WHERE InvoiceDetailID = @InvoiceDetailID;

      -- Update the tagged sales transaction with the correct invoice
      UPDATE Product
      SET @InvoiceID = @InvoiceID
      WHERE ProductID = @ProductID;

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      ROLLBACK TRANSACTION;
      THROW;
   END CATCH;
END;


CREATE PROCEDURE DeleteInvoiceDetail
(
   @InvoiceDetailID INT
)
AS
BEGIN
   SET NOCOUNT ON;

   BEGIN TRY
      BEGIN TRANSACTION;

      -- Remove the tag from the related sales transaction
      UPDATE Product
      SET @InvoiceDetailID = NULL
      WHERE ProductID IN (SELECT ProductID FROM InvoiceDetail WHERE InvoiceDetailID = @InvoiceDetailID);

      -- Delete the invoice detail record
      DELETE FROM InvoiceDetail
      WHERE InvoiceDetailID = @InvoiceDetailID;

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      ROLLBACK TRANSACTION;
      THROW;
   END CATCH;
END;


---#6 SalesTrnsaction

CREATE PROCEDURE CreateSalesTransaction
(
   @TransactionID INT,
   @CustomerID INT,
   @TransactionDate DATE,
   @TotalAmount DECIMAL(10,2),
   @Discount DECIMAL(5,2)
)
AS
BEGIN
   SET NOCOUNT ON;

   BEGIN TRY
      BEGIN TRANSACTION;

      -- Insert sales transaction record
      INSERT INTO SalesTransaction (TransactionID, CustomerID, TransactionDate, TotalAmount, Discount)
      VALUES (@TransactionID, @CustomerID, @TransactionDate, @TotalAmount, @Discount);

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      ROLLBACK TRANSACTION;
      THROW;
   END CATCH;
END;


CREATE PROCEDURE GetSalesTransactionByID
(
   @TransactionID INT
)
AS
BEGIN
   SET NOCOUNT ON;

   SELECT *
   FROM SalesTransaction
   WHERE TransactionID = @TransactionID;
END;


CREATE PROCEDURE UpdateSalesTransaction
(
   @TransactionID INT,
   @CustomerID INT,
   @TransactionDate DATE,
   @TotalAmount DECIMAL(10,2),
   @Discount DECIMAL(5,2)
)
AS
BEGIN
   SET NOCOUNT ON;

   BEGIN TRY
      BEGIN TRANSACTION;

      -- Update sales transaction record
      UPDATE SalesTransaction
      SET CustomerID = @CustomerID,
          TransactionDate = @TransactionDate,
          TotalAmount = @TotalAmount,
          Discount = @Discount
      WHERE TransactionID = @TransactionID;

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      ROLLBACK TRANSACTION;
      THROW;
   END CATCH;
END;


CREATE PROCEDURE DeleteSalesTransaction
(
   @TransactionID INT
)
AS
BEGIN
   SET NOCOUNT ON;

   BEGIN TRY
      BEGIN TRANSACTION;

      -- Delete sales transaction record
      DELETE FROM SalesTransaction
      WHERE TransactionID = @TransactionID;

      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
      ROLLBACK TRANSACTION;
      THROW;
   END CATCH;
END;









--Stored Procedure

CREATE FUNCTION GetTotalBillAmount
(
   @CustomerIds NVARCHAR(MAX),
   @StartDate DATE,
   @EndDate DATE
)
RETURNS DECIMAL(10,2)
AS
BEGIN
   DECLARE @TotalBillAmount DECIMAL(10,2);

   -- Calculate the total bill amount for the given customer IDs and date range
   SELECT @TotalBillAmount = SUM(P.Quantity * P.Price) * 1.0
   FROM Product AS P
   JOIN Customer AS C ON C.CustomerID = P.ProductID
   WHERE CONVERT(NVARCHAR(MAX), C.CustomerID) IN (SELECT value FROM OPENJSON(@CustomerIds))
   AND P.Manufacturer_Date BETWEEN @StartDate AND @EndDate;

   -- Return the total bill amount
   RETURN @TotalBillAmount;
END;


CREATE PROCEDURE GetCustomerInformation
(
   @StartDate DATE,
   @EndDate DATE,
   @CustomerIds NVARCHAR(MAX) = NULL
)
AS
BEGIN
   -- Return all customers' information within the date range
   IF @CustomerIds IS NULL
   BEGIN
      SELECT C.*, SUM(P.Quantity * P.Price) AS TotalInvoiceAmount
      FROM Customer AS C
      LEFT JOIN Product AS P ON C.CustomerID = P.ProductID
      WHERE P.Manufacturer_Date BETWEEN @StartDate AND @EndDate
      GROUP BY C.CustomerID, C.FirstName, C.LastName, C.Email, C.Phone, C.Address, C.City, C.State, C.ZipCode, C.Country, C.Created_date, C.Modified_date;
   END
   -- Return the given customer's information within the date range
   ELSE
   BEGIN
      SELECT C.*, SUM(P.Quantity * P.Price) AS TotalInvoiceAmount
      FROM Customer AS C
      LEFT JOIN Product AS P ON C.CustomerID = P.ProductID
      WHERE CONVERT(NVARCHAR(MAX), C.CustomerID) IN (SELECT value FROM OPENJSON(@CustomerIds))
      AND P.Manufacturer_Date BETWEEN @StartDate AND @EndDate
      GROUP BY C.CustomerID, C.FirstName, C.LastName, C.Email, C.Phone, C.Address, C.City, C.State, C.ZipCode, C.Country, C.Created_date, C.Modified_date;
   END;
END;




DROP FUNCTION IF EXISTS GetTotalBillAmount;

DROP PROCEDURE IF EXISTS GetCustomerInformation;


SELECT
   C.CustomerID,
   C.FirstName,
   C.LastName,
   dbo.GetTotalBillAmount(N'103,904', '2023-01-01', '2023-12-31') AS TotalBillAmount
FROM Customer AS C
WHERE C.CustomerID IN (1, 2);



-- Inserting data into Customer table
INSERT INTO Customer (FirstName, LastName, Email, Phone, Address, City, State, ZipCode, Country)
VALUES
   ('John', 'Doe', 'johndoe@example.com', '1234567890', '123 Main St', 'City', 'State', '12345', 'Country'),
   ('Jane', 'Smith', 'janesmith@example.com', '9876543210', '456 Elm St', 'City', 'State', '54321', 'Country'),
   ('Michael', 'Johnson', 'michaeljohnson@example.com', '1112223333', '789 Oak St', 'City', 'State', '98765', 'Country'),
   ('Sarah', 'Davis', 'sarahdavis@example.com', '4445556666', '321 Pine St', 'City', 'State', '56789', 'Country'),
   ('Robert', 'Wilson', 'robertwilson@example.com', '7778889999', '654 Maple St', 'City', 'State', '34567', 'Country');

-- Inserting data into Product table
INSERT INTO Product (ProductName, Manufacturer, Manufacturer_Date, Description, Price, Quantity)
VALUES
   ('Product A', 'Manufacturer A', '2023-01-01', 'Description for Product A', 10.99, 5),
   ('Product B', 'Manufacturer B', '2023-01-01', 'Description for Product B', 15.99, 3),
   ('Product C', 'Manufacturer C', '2023-01-02', 'Description for Product C', 8.99, 2),
   ('Product D', 'Manufacturer D', '2023-01-02', 'Description for Product D', 12.99, 4),
   ('Product E', 'Manufacturer E', '2023-01-03', 'Description for Product E', 9.99, 1);




   SELECT * FROM Customer;

   SELECT * FROM Product;










