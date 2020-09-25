CREATE DATABASE IF NOT EXISTS sample_database;

USE sample_database;

CREATE TABLE VS_Representative (
    Representative_ID char(2),
    Last_Name         varchar(20)  NOT NULL,
    First_Name        varchar(20),
    Region            char(2) CHECK(Region IN ('NE', 'NW', 'MW', 'SE', 'SW')),
    Hire_Date         date,
    Phone             varchar(14),
    Primary Key (Representative_ID)
    );
    
    
    
INSERT INTO VS_Representative
   (Representative_ID, Last_Name, First_Name, Region, Hire_Date, Phone)
   VALUES
   ('11', 'Ann', 'Lee', 'SW', STR_TO_DATE('05-JAN-2017', '%d-%b-%Y'), '(310) 123-4321');

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