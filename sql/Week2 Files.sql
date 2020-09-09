CREATE DATABASE IF NOT EXISTS vs;

USE vs;

CREATE TABLE IF NOT EXISTS VS_Representative (
    Representative_ID CHAR(2),
    Last_Name         VARCHAR(20)  NOT NULL,
    First_Name        VARCHAR(20),
    Region            CHAR(2) CHECK(Region IN ('NE', 'NW', 'MW', 'SE', 'SW')),
    Hire_Date         DATE,
    Phone             VARCHAR(14),
    Primary Key (Representative_ID)
    ) ENGINE=INNODB;

CREATE TABLE VS_Inventory (
    Item_Number       CHAR(2),
    Description       VARCHAR(50),
    Quantity_On_Hand  NUMERIC(4)     NOT NULL,
    Primary Key (Item_Number)
    );

CREATE TABLE VS_Customer (
    Customer_Number   CHAR(2),
    Customer_Name     VARCHAR(20)  NOT NULL,
    City              VARCHAR(20),
    Representative_ID CHAR(2),
    Primary Key (Customer_Number),
	Foreign Key (Representative_ID) references VS_Representative (Representative_ID)
    );

CREATE TABLE VS_Invoice (
    Invoice_Number    CHAR(2),
    Customer_Number   CHAR(2)  NOT NULL,
    Invoice_date      DATE,
    Item_Number       CHAR(2),
    Quantity          NUMERIC(2),
    Primary Key (Invoice_Number),
	Foreign Key (Customer_Number) references VS_Customer (Customer_Number),
      Foreign Key (Item_Number) references VS_Inventory (Item_Number)
    );


-- Following commands insert values into table VS_Representative

INSERT INTO VS_Representative
   (Representative_ID, Last_Name, First_Name, Region, Hire_Date, Phone)
   VALUES
   ('11', 'Sharma', 'Viren', 'SW', STR_TO_DATE('05-JAN-2017', '%d-%b-%Y'), '(310) 123-4321');

INSERT INTO VS_Representative
   (Representative_ID, Last_Name, First_Name, Region, Hire_Date, Phone)
   VALUES
   ('22', 'Higgins', 'Heather', 'SE', STR_TO_DATE('16-Dec-2014', '%d-%b-%Y'), '(404) 524-8472');

INSERT INTO VS_Representative
   (Representative_ID, Last_Name, First_Name, Region, Hire_Date, Phone)
   VALUES
   ('33', 'Sullivan', 'Pat', 'NE', STR_TO_DATE('21-Feb-2010', '%d-%b-%Y'), '(305) 734-2987');

INSERT INTO VS_Representative
   (Representative_ID, Last_Name, First_Name, Region, Hire_Date, Phone)
   VALUES
   ('44', 'Speed', 'Kristen', 'MW', STR_TO_DATE('14-Jun-2008', '%d-%b-%Y'), '(708) 823-8222');

INSERT INTO VS_Representative
   (Representative_ID, Last_Name, First_Name, Region, Hire_Date, Phone)
   VALUES
   ('55', 'Sigafoos', 'Alex', 'NW', STR_TO_DATE('05-MAR-2012', '%d-%b-%Y'), '(310) 123-7890');


-- Following commands insert values into table VS_Inventory

INSERT INTO VS_Inventory
   (Item_Number, Description, Quantity_On_Hand)
   VALUES
   ('10', 'Hard drive 5 TB 15000 RPM', 191);

INSERT INTO VS_Inventory
   (Item_Number, Description, Quantity_On_Hand)
   VALUES
   ('20', 'Solid state drive 1 TB flash', 453);

INSERT INTO VS_Inventory
   (Item_Number, Description, Quantity_On_Hand)
   VALUES
   ('30', 'Solid state drive 500 GB DRAM with battery', 294);

INSERT INTO VS_Inventory
   (Item_Number, Description, Quantity_On_Hand)
   VALUES
   ('40', 'RAID level 5 system', 676);

INSERT INTO VS_Inventory
   (Item_Number, Description, Quantity_On_Hand)
   VALUES
   ('50', 'Optical drive Blu-Ray', 817);

INSERT INTO VS_Inventory
   (Item_Number, Description, Quantity_On_Hand)
   VALUES
   ('60', 'LED/LCD 4K color monitor 30-inch', 982);

INSERT INTO VS_Inventory
   (Item_Number, Description, Quantity_On_Hand)
   VALUES
   ('70', 'Dynamic RAM DDR', 0);

INSERT INTO VS_Inventory
   (Item_Number, Description, Quantity_On_Hand)
   VALUES
   ('80', '3D printer', 296);

INSERT INTO VS_Inventory
   (Item_Number, Description, Quantity_On_Hand)
   VALUES
   ('90', 'Sharma''s DSL modem', 152);


-- Following commands insert values into table VS_Customer 

INSERT INTO VS_Customer
   (Customer_Number, Customer_Name, City, Representative_ID)
   VALUES
   ('10', 'Ballard Computer', 'Seattle', '55');

INSERT INTO VS_Customer
   (Customer_Number, Customer_Name, City, Representative_ID)
   VALUES
   ('20', 'Computer City', 'Miami', '33');

INSERT INTO VS_Customer
   (Customer_Number, Customer_Name, City, Representative_ID)
   VALUES
   ('30', 'Under_Score, Inc.', 'Atlanta', '22');

INSERT INTO VS_Customer
   (Customer_Number, Customer_Name, City, Representative_ID)
   VALUES
   ('40', 'Varner User System', 'Naperville', NULL);

INSERT INTO VS_Customer
   (Customer_Number, Customer_Name, City, Representative_ID)
   VALUES
   ('50', '100% Jargon', 'Spokane', '55');

INSERT INTO VS_Customer
   (Customer_Number, Customer_Name, City, Representative_ID)
   VALUES
   ('60', 'Computing Solutions', 'Tucson', '11');


-- Following commands insert values into table VS_Invoice.  The year 1899 isn't a typo.

INSERT INTO VS_Invoice
   (Invoice_Number, Customer_Number, Invoice_date, Item_Number, Quantity)
   VALUES
   ('01', '20', STR_TO_DATE('12-MAY-1899', '%d-%b-%Y'), '70', 11);

--  The year in the above date is eighteen hundred and ninety nine.

INSERT INTO VS_Invoice
   (Invoice_Number, Customer_Number, Invoice_date, Item_Number, Quantity)
   VALUES
   ('02', '30', STR_TO_DATE('29-FEB-2000', '%d-%b-%Y'), '60', 15);

INSERT INTO VS_Invoice
   (Invoice_Number, Customer_Number, Invoice_date, Item_Number, Quantity)
   VALUES
   ('03', '30', STR_TO_DATE('13-SEP-2004', '%d-%b-%Y'), '20', 14);

INSERT INTO VS_Invoice
   (Invoice_Number, Customer_Number, Invoice_date, Item_Number, Quantity)
   VALUES
   ('04', '20', STR_TO_DATE('10-JUL-2012', '%d-%b-%Y'), '10', NULL);

INSERT INTO VS_Invoice
   (Invoice_Number, Customer_Number, Invoice_date, Item_Number, Quantity)
   VALUES
   ('05', '60', STR_TO_DATE('17-FEB-2015', '%d-%b-%Y'), '60', 20);


-- Display all values in all tables

SELECT * FROM VS_Invoice;
SELECT * FROM VS_Customer;
SELECT * FROM VS_Inventory;
SELECT * FROM VS_Representative;