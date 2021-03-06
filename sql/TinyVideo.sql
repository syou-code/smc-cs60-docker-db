CREATE DATABASE IF NOT EXISTS tiny_video;

USE tiny_video;

CREATE TABLE IF NOT EXISTS PRICE (
PRICE_CODE			    NUMERIC(2,0) PRIMARY KEY,
PRICE_DESCRIPTION	  VARCHAR(20)  NOT NULL  ,
PRICE_RENTFEE		    NUMERIC(5,2) CHECK (PRICE_RENTFEE >= 0),
PRICE_DAILYLATEFEE	NUMERIC(5,2) CHECK (PRICE_DAILYLATEFEE >= 0)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS MOVIE (
MOVIE_NUM	  NUMERIC(8,0)  PRIMARY KEY,
MOVIE_TITLE	VARCHAR(75) NOT NULL,
MOVIE_YEAR	NUMERIC(4,0)  CHECK (MOVIE_YEAR > 1900),
MOIVE_COST	NUMERIC(5,2),
MOVIE_GENRE	VARCHAR(50),
PRICE_CODE	NUMERIC(2,0),
FOREIGN KEY (PRICE_CODE) REFERENCES PRICE(PRICE_CODE)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS VIDEO (
VID_NUM		  NUMERIC(8,0) PRIMARY KEY,
VID_INDATE	TIMESTAMP,
MOVIE_NUM	  NUMERIC(8,0),
FOREIGN KEY (MOVIE_NUM) REFERENCES MOVIE(MOVIE_NUM)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS MEMBERSHIP (
MEM_NUM		  NUMERIC(8,0) PRIMARY KEY,
MEM_FNAME	  VARCHAR(30) NOT NULL,
MEM_LNAME	  VARCHAR(30) NOT NULL,
MEM_STREET	VARCHAR(120),
MEM_CITY	  VARCHAR(50),
MEM_STATE	  CHAR(2),
MEM_ZIP		  CHAR(5),
MEM_BALANCE	NUMERIC(10,2)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS RENTAL (
RENT_NUM	  NUMERIC(8,0) PRIMARY KEY,
RENT_DATE	  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
MEM_NUM	    NUMERIC(8,0),
FOREIGN KEY (MEM_NUM) REFERENCES MEMBERSHIP(MEM_NUM)
) ENGINE=INNODB;
 
CREATE TABLE IF NOT EXISTS DETAILRENTAL (
RENT_NUM			      NUMERIC(8,0),
VID_NUM				      NUMERIC(8,0),
DETAIL_FEE			    NUMERIC(5,2),
DETAIL_DUEDATE		  DATE,
DETAIL_RETURNDATE	  DATE,
DETAIL_DAILYLATEFEE	NUMERIC(5,2),
PRIMARY KEY (RENT_NUM, VID_NUM),
FOREIGN KEY (RENT_NUM) REFERENCES RENTAL(RENT_NUM),
FOREIGN KEY (VID_NUM) REFERENCES VIDEO(VID_NUM)
) ENGINE=INNODB;

-- PRICE:
INSERT INTO PRICE VALUES (1, 'Standard', 2, 1);
INSERT INTO PRICE VALUES (2, 'New Release', 3.5, 3);
INSERT INTO PRICE VALUES (3, 'Discount', 1.5, 1);
INSERT INTO PRICE VALUES (4, 'Weekly Special', 1, .5);

-- MOVIE:
INSERT INTO MOVIE VALUES (1234, 'The Cesar Family Christmas', 2014, 39.95, 'FAMILY', 2);
INSERT INTO MOVIE VALUES (1235, 'Smokey Mountain Wildlife', 2011, 59.95, 'ACTION', 1);
INSERT INTO MOVIE VALUES (1236, 'Richard Goodhope', 2015, 59.95, 'DRAMA', 2);
INSERT INTO MOVIE VALUES (1237, 'Beatnik Fever', 2014, 29.95, 'COMEDY', 2);
INSERT INTO MOVIE VALUES (1238, 'Constant Companion', 2015, 89.95, 'DRAMA', NULL);
INSERT INTO MOVIE VALUES (1239, 'Where Hope Dies', 2005, 25.49, 'DRAMA', 3);
INSERT INTO MOVIE VALUES (1245, 'Time to Burn', 2012, 45.49, 'ACTION', 1);
INSERT INTO MOVIE VALUES (1246, 'What He Doesnt Know', 2013, 58.29, 'COMEDY', 1);

-- VIDEO:
INSERT INTO VIDEO VALUES (54321, STR_TO_DATE('18-JUN-15', '%d-%b-%Y'), 1234);
INSERT INTO VIDEO VALUES (54324, STR_TO_DATE('18-JUN-15', '%d-%b-%Y'), 1234);
INSERT INTO VIDEO VALUES (54325, STR_TO_DATE('18-JUN-15', '%d-%b-%Y'), 1234);
INSERT INTO VIDEO VALUES (34341, STR_TO_DATE('22-JAN-14', '%d-%b-%Y'), 1235);
INSERT INTO VIDEO VALUES (34342, STR_TO_DATE('22-JAN-14', '%d-%b-%Y'), 1235);
INSERT INTO VIDEO VALUES (34366, STR_TO_DATE('02-MAR-16', '%d-%b-%Y'), 1236);
INSERT INTO VIDEO VALUES (34367, STR_TO_DATE('02-MAR-16', '%d-%b-%Y'), 1236);
INSERT INTO VIDEO VALUES (34368, STR_TO_DATE('02-MAR-16', '%d-%b-%Y'), 1236);
INSERT INTO VIDEO VALUES (34369, STR_TO_DATE('02-MAR-16', '%d-%b-%Y'), 1236);
INSERT INTO VIDEO VALUES (44392, STR_TO_DATE('21-OCT-15', '%d-%b-%Y'), 1237);
INSERT INTO VIDEO VALUES (44397, STR_TO_DATE('21-OCT-15', '%d-%b-%Y'), 1237);
INSERT INTO VIDEO VALUES (59237, STR_TO_DATE('14-FEB-16', '%d-%b-%Y'), 1237);
INSERT INTO VIDEO VALUES (61388, STR_TO_DATE('25-JAN-14', '%d-%b-%Y'), 1239);
INSERT INTO VIDEO VALUES (61353, STR_TO_DATE('28-JAN-13', '%d-%b-%Y'), 1245);
INSERT INTO VIDEO VALUES (61354, STR_TO_DATE('28-JAN-13', '%d-%b-%Y'), 1245);
INSERT INTO VIDEO VALUES (61367, STR_TO_DATE('30-JUL-15', '%d-%b-%Y'), 1246);
INSERT INTO VIDEO VALUES (61369, STR_TO_DATE('30-JUL-15', '%d-%b-%Y'), 1246);

 
-- MEMBERSHIP:
INSERT INTO MEMBERSHIP VALUES (102, 'TAMI', 'DAWSON', '2632 TAKLI CIRCLE', 'NORENE', 'TN', '37136', 11);
INSERT INTO MEMBERSHIP VALUES (103, 'CURT', 'KNIGHT', '4025 CORNELL COURT', 'FLATGAP', 'KY', '41219', 6);
INSERT INTO MEMBERSHIP VALUES (104, 'JAMAL', 'MELENDEZ', '788 EAST 145TH AVENUE', 'QUEBECK', 'TN', '38579', 0);
INSERT INTO MEMBERSHIP VALUES (105, 'IVA', 'MCCLAIN', '6045 MUSKET BALL CIRCLE', 'SUMMIT', 'KY', '42783', 15);
INSERT INTO MEMBERSHIP VALUES (106, 'MIRANDA', 'PARKS', '4469 MAXWELL PLACE', 'GERMANTOWN', 'TN', '38183', 0);
INSERT INTO MEMBERSHIP VALUES (107, 'ROSARIO', 'ELLIOTT', '7578 DANNER AVENUE', 'COLUMBIA', 'TN', '38402', 5);
INSERT INTO MEMBERSHIP VALUES (108, 'MATTIE', 'GUY', '4390 EVERGREEN STREET', 'LILY', 'KY', '40740', 0);
INSERT INTO MEMBERSHIP VALUES (109, 'CLINT', 'OCHOA', '1711 ELM STREET', 'GREENEVILLE', 'TN', '37745', 10);
INSERT INTO MEMBERSHIP VALUES (110, 'LEWIS', 'ROSALES', '4524 SOUTHWIND CIRCLE', 'COUNCE', 'TN', '38326', 0);
INSERT INTO MEMBERSHIP VALUES (111, 'STACY', 'MANN', '2789 EAST COOK AVENUE', 'MURFREESBORO', 'TN', '37132', 8);
INSERT INTO MEMBERSHIP VALUES (112, 'LUIS', 'TRUJILLO', '7267 MELVIN AVENUE', 'HEISKELL', 'TN', '37754', 3);
INSERT INTO MEMBERSHIP VALUES (113, 'MINNIE', 'GONZALES', '6430 VASILI DRIVE', 'WILLISTON', 'TN', '38076', 0);

-- RENTAL:
INSERT INTO RENTAL VALUES (1001, STR_TO_DATE('01-MAR-16', '%d-%b-%Y'), 103);
INSERT INTO RENTAL VALUES (1002, STR_TO_DATE('01-MAR-16', '%d-%b-%Y'), 105);
INSERT INTO RENTAL VALUES (1003, STR_TO_DATE('02-MAR-16', '%d-%b-%Y'), 102);
INSERT INTO RENTAL VALUES (1004, STR_TO_DATE('02-MAR-16', '%d-%b-%Y'), 110);
INSERT INTO RENTAL VALUES (1005, STR_TO_DATE('02-MAR-16', '%d-%b-%Y'), 111);
INSERT INTO RENTAL VALUES (1006, STR_TO_DATE('02-MAR-16', '%d-%b-%Y'), 107);
INSERT INTO RENTAL VALUES (1007, STR_TO_DATE('02-MAR-16', '%d-%b-%Y'), 104);
INSERT INTO RENTAL VALUES (1008, STR_TO_DATE('03-MAR-16', '%d-%b-%Y'), 105);
INSERT INTO RENTAL VALUES (1009, STR_TO_DATE('03-MAR-16', '%d-%b-%Y'), 111);

 
-- DETAILRENTAL:
INSERT INTO DETAILRENTAL VALUES (1001, 34342, 2, STR_TO_DATE('04-MAR-16', '%d-%b-%Y'), STR_TO_DATE('02-MAR-16', '%d-%b-%Y'), NULL);
INSERT INTO DETAILRENTAL VALUES (1001, 34366, 3.5, STR_TO_DATE('04-MAR-16', '%d-%b-%Y'), STR_TO_DATE('02-MAR-16', '%d-%b-%Y'), 3);
INSERT INTO DETAILRENTAL VALUES (1001, 61353, 2, STR_TO_DATE('04-MAR-16', '%d-%b-%Y'), STR_TO_DATE('03-MAR-16', '%d-%b-%Y'), 1);
INSERT INTO DETAILRENTAL VALUES (1002, 59237, 3.5, STR_TO_DATE('04-MAR-16', '%d-%b-%Y'), STR_TO_DATE('04-MAR-16', '%d-%b-%Y'), 3);
INSERT INTO DETAILRENTAL VALUES (1003, 54325, 3.5, STR_TO_DATE('04-MAR-16', '%d-%b-%Y'), STR_TO_DATE('09-MAR-16', '%d-%b-%Y'), 3);
INSERT INTO DETAILRENTAL VALUES (1003, 61369, 2, STR_TO_DATE('06-MAR-16', '%d-%b-%Y'), STR_TO_DATE('09-MAR-16', '%d-%b-%Y'), 1);
INSERT INTO DETAILRENTAL VALUES (1003, 61388, 0, STR_TO_DATE('06-MAR-16', '%d-%b-%Y'), STR_TO_DATE('09-MAR-16', '%d-%b-%Y'), 1);
INSERT INTO DETAILRENTAL VALUES (1004, 34341, 2, STR_TO_DATE('07-MAR-16', '%d-%b-%Y'), STR_TO_DATE('07-MAR-16', '%d-%b-%Y'), 1);
INSERT INTO DETAILRENTAL VALUES (1004, 34367, 3.5, STR_TO_DATE('05-MAR-16', '%d-%b-%Y'), STR_TO_DATE('07-MAR-16', '%d-%b-%Y'), 3);
INSERT INTO DETAILRENTAL VALUES (1004, 44392, 3.5, STR_TO_DATE('05-MAR-16', '%d-%b-%Y'), STR_TO_DATE('07-MAR-16', '%d-%b-%Y'), 3);
INSERT INTO DETAILRENTAL VALUES (1005, 34342, 2, STR_TO_DATE('07-MAR-16', '%d-%b-%Y'), STR_TO_DATE('05-MAR-16', '%d-%b-%Y'), 1);
INSERT INTO DETAILRENTAL VALUES (1005, 44397, 3.5, STR_TO_DATE('05-MAR-16', '%d-%b-%Y'), STR_TO_DATE('05-MAR-16', '%d-%b-%Y'), 3);
INSERT INTO DETAILRENTAL VALUES (1006, 34366, 3.5, STR_TO_DATE('05-MAR-16', '%d-%b-%Y'), STR_TO_DATE('04-MAR-16', '%d-%b-%Y'), 3);
INSERT INTO DETAILRENTAL VALUES (1006, 61367, 2, STR_TO_DATE('07-MAR-16', '%d-%b-%Y'), NULL, 1);
INSERT INTO DETAILRENTAL VALUES (1007, 34368, 3.5, STR_TO_DATE('05-MAR-16', '%d-%b-%Y'), NULL, 3);
INSERT INTO DETAILRENTAL VALUES (1008, 34369, 3.5, STR_TO_DATE('05-MAR-16', '%d-%b-%Y'), STR_TO_DATE('05-MAR-16', '%d-%b-%Y'), 3);
INSERT INTO DETAILRENTAL VALUES (1009, 54324, 3.5, STR_TO_DATE('05-MAR-16', '%d-%b-%Y'), NULL, 3);

