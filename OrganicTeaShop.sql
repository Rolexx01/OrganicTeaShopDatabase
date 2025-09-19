-- Create database
CREATE DATABASE OrganicTeaShop;

USE OrganicTeaShop;

-- Create Customer table
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Contact_Info VARCHAR(255),
    Preferences VARCHAR(255)
);

-- Create Tea table
CREATE TABLE Tea (
    Tea_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Type VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Create Supplier table
CREATE TABLE Supplier (
    Supplier_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Contact_Info VARCHAR(255)
);

-- Create Employee table
CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Create Inventory table
CREATE TABLE Inventory (
    Inventory_ID INT PRIMARY KEY,
    Tea_ID INT,
    Quantity INT,
    Date_Received DATE,
    FOREIGN KEY (Tea_ID) REFERENCES Tea(Tea_ID)
);

-- Create Order table
CREATE TABLE `Order` (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Total_Price DECIMAL(10, 2),
    Customer_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- Create Order_Tea table for M:N relationship
CREATE TABLE Order_Tea (
    Order_ID INT,
    Tea_ID INT,
    Quantity INT,
    PRIMARY KEY (Order_ID, Tea_ID),
    FOREIGN KEY (Order_ID) REFERENCES `Order`(Order_ID),
    FOREIGN KEY (Tea_ID) REFERENCES Tea(Tea_ID)
);

-- Create relationship between Supplier and Tea (1:N)
CREATE TABLE Supplier_Tea (
    Supplier_ID INT,
    Tea_ID INT,
    PRIMARY KEY (Supplier_ID, Tea_ID),
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID),
    FOREIGN KEY (Tea_ID) REFERENCES Tea(Tea_ID)
);

-- Create relationship between Employee and Inventory (1:N)
CREATE TABLE Employee_Inventory (
    Employee_ID INT,
    Inventory_ID INT,
    PRIMARY KEY (Employee_ID, Inventory_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
    FOREIGN KEY (Inventory_ID) REFERENCES Inventory(Inventory_ID)
);
