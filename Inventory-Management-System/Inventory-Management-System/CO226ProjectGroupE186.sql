
CREATE DATABASE INVENTORY_PROJECT;

USE INVENTORY_PROJECT;

CREATE TABLE Supplied_Products_1
(ProductID INT PRIMARY KEY ,
SupplierUnitPrice DECIMAL(10,2),
Product_Category VARCHAR(150),
Quantity INT,
Supplier_ID INT REFERENCES Supplied_Products_2(Supplier_ID));


CREATE TABLE Supplied_Products_2
(Supplier_ID INT PRIMARY KEY,
Supplier_Name VARCHAR(150));



CREATE TABLE Products_Supplied_to_Warehouse
(WAREHOUSE_ID INT REFERENCES WAREHOUSE_ADDRESS_DETAILS(WAREHOUSE_ID),
ProductID INT REFERENCES Supplied_Products_1(ProductID),
SuppliedDate DATE);



CREATE TABLE WAREHOUSE_ADDRESS_DETAILS
(WAREHOUSE_ID INT PRIMARY KEY,
COUNTRY VARCHAR(150),
STATE VARCHAR(150),
ADDRESS1 VARCHAR(150),
ADDRESS2 VARCHAR(150),
MANAGERID INT REFERENCES EMP_DETAILS(EMP_ID));

 

CREATE TABLE STORED_PRODUCTS
(PRODUCT_ID INT PRIMARY KEY AUTO_INCREMENT,
PRODUCT_CATEGORY VARCHAR(150),
SELLING_UNIT_PRICE DECIMAL(10,2),
QUANTITY INT,
WAREHOUSEID INT REFERENCES WAREHOUSE_ADDRESS_DETAILS(WAREHOUSE_ID));

CREATE TABLE ORDER_Price (
  TOTAL_PRICE  DECIMAL (10,2), 
  ORDER_ID INT PRIMARY KEY,
  SHIPPING_price DECIMAL (10,2)
);



CREATE TABLE ORDER_Product (
  ORDER_ID  INT , 
  PRODUCT_ID INT ,
  Quantity INT,
  FOREIGN KEY ( ORDER_ID ) REFERENCES ORDER_Price( ORDER_ID ),
FOREIGN KEY ( PRODUCT_ID ) REFERENCES  Stored_Products(PRODUCT_ID )
);


CREATE TABLE ORDER_FullfilimentDate (
  ORDER_ID  INT , 
  PRODUCT_ID INT,
  FULFILS_DATE DATE,
  FOREIGN KEY ( ORDER_ID ) REFERENCES ORDER_Price( ORDER_ID ),
FOREIGN KEY ( PRODUCT_ID ) REFERENCES  Stored_Products(PRODUCT_ID )
);


CREATE TABLE Customer_PlacementDate (
  CuSTOMER_ID INT, 
  ORDER_ID INT PRIMARY KEY,
  PLACE_DATE DATE,
  FOREIGN KEY ( CuSTOMER_ID ) REFERENCES Customer_UserDetails( CuSTOMER_ID ),
  FOREIGN KEY ( ORDER_ID ) REFERENCES ORDER_Price( ORDER_ID )
);


CREATE TABLE Customer_Email (
  CuSTOMER_ID INT  , 
  EMAIL_ADDRESS VARCHAR(150) ,
  FOREIGN KEY ( CuSTOMER_ID ) REFERENCES Customer_UserDetails( CuSTOMER_ID )
);


CREATE TABLE Customer_Address (
  CuSTOMER_ID INT PRIMARY KEY , 
  ADDRESS VARCHAR(150) ,
  FOREIGN KEY ( CuSTOMER_ID ) REFERENCES Customer_UserDetails( CuSTOMER_ID )
 
);



CREATE TABLE EMPLOYEE_DEPENDANCIES
(EMP_ID INT,
NAME VARCHAR(100),
RELATIONSHIP VARCHAR(50),
BIRTHDAY DATE,
SEX VARCHAR(20),
PRIMARY KEY  (EMP_ID,NAME),
FOREIGN KEY (EMP_ID) REFERENCES EMP_DETAILS(EMP_ID));

CREATE TABLE EMP_DETAILS
(EMP_ID INT ,
SALARY DECIMAL(10,2),
NAME VARCHAR(100),
WAREHOUSE_ID INT,
PRIMARY KEY (EMP_ID),
FOREIGN KEY (WAREHOUSE_ID) REFERENCES  WAREHOUSE_ADDRESS_DETAILS(WAREHOUSE_ID));


CREATE TABLE ADDRESS_EMP 
(EMP_ID INT,
ADDRESS_1 VARCHAR(100),
ADDRESS_2 VARCHAR(100),
FOREIGN KEY (EMP_ID) REFERENCES EMP_DETAILS(EMP_ID));


CREATE TABLE MANAGES
(EMP_ID INT,
BONUS DECIMAL(10,2),
FOREIGN KEY (EMP_ID) REFERENCES EMP_DETAILS(EMP_ID));

CREATE TABLE NON_MANAGERS
(EMP_ID INT,
PERKS DECIMAL(10,2),
FOREIGN KEY (EMP_ID) REFERENCES EMP_DETAILS(EMP_ID));


CREATE TABLE Customer_UserDetails (
    CuSTOMER_ID INT PRIMARY KEY , 
    USER_NAME VARCHAR(150) ,
    c_PASSWORD  VARCHAR(150)  
);


INSERT INTO WAREHOUSE_ADDRESS_DETAILS
VALUES (1,'USA','CALIFORNIA','310','345',NULL),
(2,'USA','NEW YORK','334','787',NULL),
(3,'USA','NEW JERSY','310','345',NULL),
(4,'USA','CALIFORNIA','310','345',NULL),
(5,'USA','MIAMI','310','345',NULL),
(6,'USA','NEW JERSY','310','345',NULL),
(7,'USA','CALIFORNIA','310','345',NULL),
(8,'USA','ALASKA','900','103',NULL),
(9,'USA','FLORIDA','310','345',NULL),
(10,'USA','FLORIDA','310','345',NULL),
(11,'USA','NEW YORK','389','345',NULL),
(12,'USA','LOS ANGELES','310','345',NULL),
(13,'USA','CALIFORNIA','500','745',NULL),
(14,'USA','CALIFORNIA','378','345',NULL),
(15,'USA','MIAMI','400','345',NULL),
(16,'USA','MIAMI','700','300',NULL),
(17,'USA','ALASKA','700','345',NULL),
(18,'USA','FLORIDA','789','345',NULL),
(19,'USA','INDIANA','567','456',NULL),
(20,'USA','NEW JERSY','890','123',NULL);


INSERT INTO SUPPLIED_PRODUCTS_2
VALUES (1,'SAMSUNG'),
(2,'APPLE'),
(3,'MOTAROLA'),
(4,'HUAWEI'),
(5,'NOKIA'),
(6,'INTEL'),
(7,'AMD'),
(8,'REALME'),
(9,'ONE PLUS'),
(10,'TOYOTA'),
(11,'KIA'),
(12,'BENS'),
(13,'CASIO'),
(14,'ATLAS'),
(15,'LAYS'),
(16,'HARSHLEY'),
(17,'DELL'),
(18,'HP'),
(19,'EXE'),
(20,'INNOVEX');

INSERT INTO SUPPLIED_PRODUCTS_1
VALUES (1,120.50,'Electronics',102,2),
(2,34.00,'Electronics',23,13),
(3,30000.00,'Others',5,11),
(4,234.67,'Electronics',50,18),
(5,50000.00,'Others',5,12),
(6,35000.00,'Others',5,11),
(7,3000.00,'Furniture',10,20),
(8,670.00,'Electronics',5,1),
(9,5.00,'Others',500,16),
(10,78.50,'Garments',400,19),
(11,35.00,'Electronics',100,5),
(12,35.00,'Electronics',100,6),
(13,350.00,'Electronics',100,3),
(14,500.00,'Kitchen Items',200,20),
(15,400.00,'Beauty Items',100,19),
(16,60000.00,'Others',20,11),
(17,550.00,'Electronics',80,11),
(18,500.00,'Electronics',80,6),
(19,200.00,'Electronics',80,3),
(20,33.00,'Others',700,14);

INSERT INTO PRODUCTS_SUPPLIED_TO_WAREHOUSE
VALUES (1,12,'2020-01-05'),
(2,5,'2021-06-16'),
(8,6,'2021-07-16'),
(9,10,'2021-07-16'),
(11,5,'2022-04-07'),
(4,7,'2021-08-07'),
(2,5,'2021-06-30'),
(7,5,'2021-01-16'),
(9,5,'2021-06-16'),
(8,7,'2021-06-16'),
(2,5,'2021-06-16'),
(2,5,'2021-06-16'),
(9,5,'2021-06-16'),
(10,5,'2021-06-16'),
(2,5,'2021-06-16'),
(10,5,'2020-06-16'),
(2,5,'2021-06-17'),
(17,5,'2020-06-16'),
(20,10,'2021-06-16'),
(9,7,'2021-06-16'),
(2,5,'2021-06-16');


INSERT INTO EMP_DETAILS
VALUES (0,1000.00,'CHIRAN',1),
(1,1010.00,'LEX',1),
(2,1020.00,'SIN',1),
(3,1030.00,'CHI',2),
(4,1040.00,'VHI',2),
(5,1050.00,'RAN',2),
(6,1060.00,'IRAN',3),
(7,1070.00,'CHRAN',3),
(8,1080.00,'KUMUDU',3),
(9,1090.00,'MUDU',4),
(10,1100.00,'VIDU',4),
(11,1110.00,'VIRAT',4),
(12,1100.00,'MIN',5),
(13,1010.00,'YOO',5),
(14,1100.00,'HAA',5),
(15,1100.00,'YIN',6),
(16,1100.00,'YAN',6),
(17,1100.00,'TAN',6),
(18,1100.00,'ZU',7),
(19,1100.00,'MAO',7),
(20,1200.00,'XI',7),
(21,1000.00,'JIN',8),
(22,1000.00,'PIN',8),
(23,1000.00,'DOA',8),
(24,1000.00,'YUAN',9),
(25,1000.00,'SUAN',9),
(26,1000.00,'MIA',9),
(27,1000.00,'ZIA',10),
(28,1000.00,'WUO',10),
(29,1000.00,'WIZIN',10);

INSERT INTO ADDRESS_EMP 
VALUES (0,'123','WE STREET'),
(1,'124','AE STREET'),
(2,'133','RE STREET'),
(3,'223','FE STREET'),
(4,'523','WE GTREET'),
(5,'623','123WE STREET'),
(6,'623','THE STREET'),
(7,'125','WIE STREET'),
(8,'126','WIN STREET'),
(9,'127','GIN STREET'),
(10,'128','WK STREET'),
(11,'129','KIE STREET'),
(12,'131','W45E STREET'),
(13,'133','W67E STREET'),
(14,'136','W68E STREET'),
(15,'143','W89E STREET'),
(16,'1123','W42E STREET'),
(17,'2123','W59E STREET'),
(18,'3123','W123E STREET'),
(19,'4123','W125E STREET'),
(20,'5123','W128E STREET'),
(21,'6123','W130E STREET'),
(22,'7123','W141E STREET'),
(23,'8123','W142E STREET'),
(24,'9123','W143E STREET'),
(25,'100','W145E STREET'),
(26,'101','W147E STREET'),
(27,'102','W234E STREET'),
(28,'103','W256E STREET'),
(29,'104','W344E STREET');



INSERT INTO MANAGES
VALUES (0,2000.10),
(1,2000.10),
(2,2000.10),
(3,2000.10),
(4,2000.10),
(5,2000.10),
(6,2000.10),
(7,2000.10),
(8,2000.10),
(9,2000.10);



INSERT INTO NON_MANAGERS
VALUES (10,1000.10),
(11,1000.10),
(12,1000.10),
(13,1000.10),
(14,1000.10),
(15,1000.10),
(16,1000.10),
(17,1000.10),
(18,1000.10),
(19,1000.10),
(21,1000.10),
(22,1000.10),
(23,1000.10),
(24,1000.10),
(25,1000.10),
(26,1000.10),
(27,1000.10),
(28,1000.10),
(29,1000.10);



INSERT INTO EMPLOYEE_DEPENDANCIES
VALUES (1,'VIRAN','FATHER','1968-01-12','MALE'),
(2,'KIRAN','FATHER','1968-02-12','MALE'),
(3,'SIRAN','FATHER','1968-03-12','MALE'),
(5,'YIRAN','FATHER','1968-05-12','MALE'),
(6,'MIRAN','FATHER','1968-06-12','MALE'),
(7,'VIRAN','FATHER','1968-07-12','MALE'),
(8,'VIR','FATHER','1968-01-11','MALE'),
(9,'MIR','FATHER','1968-01-15','MALE'),
(10,'KIR','FATHER','1968-01-17','MALE'),
(11,'KARAN','FATHER','1968-01-19','MALE'),
(14,'VARAN','FATHER','1969-01-12','MALE'),
(16,'MARAN','FATHER','1978-01-12','MALE'),
(12,'SARAN','FATHER','1958-01-12','MALE'),
(15,'YUA','FATHER','1948-01-12','MALE'),
(17,'ZUA','FATHER','1998-01-12','MALE'),
(19,'QIN','FATHER','1978-05-12','MALE'),
(21,'BIN','FATHER','1978-06-12','MALE'),
(24,'KUSH','FATHER','1978-07-12','FEMALE'),
(26,'VUSH','FATHER','1978-01-21','FEMALE'),
(27,'MUSH','FATHER','1978-01-26','FEMALE');


INSERT INTO STORED_PRODUCTS
VALUES (1,'Electronics',500.00,100,1),
(2,'Others',500.00,100,2),
(3,'Electronics',700.00,100,3),
(4,'Others',800.00,10,5),
(5,'Garments',50.00,120,4),
(6,'Electronics',700.00,100,6),
(7,'Others',700.00,100,7),
(8,'Electronics',700.00,100,8),
(9,'Electronics',700.00,100,2),
(10,'Garments',80.50,120,9),
(11,'Electronics',700.00,100,12),
(12,'Electronics',70.00,100,19),
(13,'Others',700.00,100,4),
(14,'Furnitures',1000.00,100,12),
(15,'Electronics',500.00,100,9),
(16,'Electronics',700.00,100,5),
(17,'Furniture',700.00,100,15),
(18,'Garments',50.00,120,17),
(19,'Garments',50.00,120,9),
(20,'Others',50.00,120,8);



INSERT INTO Customer_UserDetails (CuSTOMER_ID, USER_NAME, c_PASSWORD)
VALUES ('100001', 'Liam', '10001'),
('100002', 'Noah', '10002'),
('100003', 'Oliver', '10003'),
('100004', 'Elijah', '10004'),
('100005', 'William', '10005'),
('100006', 'Benjamin', '10006'),
('100007', 'Lucas', '10007'),
('100008', 'Henry', '10008'),
('100009', 'Alexander', '10009'),
('100010', 'Alexander', '10010'),
('100011', 'Olivia', '10011'),
('100012', 'Emma', '10012'),
('100013', 'Ava', '10013'),
('100014', 'Charlotte', '10014'),
('100015', 'Sophia', '10015'),
('100016', 'Isabella', '10016'),
('100017', 'Mia', '10017'),
('100018', 'Evelyn', '10018'),
('100019', 'Harper', '10019')
;

INSERT INTO Customer_Address (CuSTOMER_ID, ADDRESS)
VALUES ('100001', '55/6 polonnaruwa'),
('100002', '51/6 polonnaruwa'),
('100003', '54/6 polonnaruwa'),
('100004', '57/6 polonnaruwa'),
('100005', '533/6 polonnaruwa'),
('100006', '5355/6 polonnaruwa'),
('100007', '577/6 polonnaruwa'),
('100008', '55/46 polonnaruwa'),
('100009', '515/6 panagoda'),
('100010', '151/6 panagoda'),
('100011', '251/6 panagoda'),
('100012', '521/6 panagoda'),
('100013', '561/6 panagoda'),
('100014', '571/6 panagoda'),
('100015', '351/6 balangoda' ),
('100016',  '251/6 balangoda'),
('100017',  '551/6 balangoda'),
('100018',  '751/6 balangoda'),
('100019',  '951/6 balangoda')
;






INSERT INTO Customer_Email (CuSTOMER_ID, EMAIL_ADDRESS)
VALUES ('100001', 'e18001@eng.pdn.ac.lk' ),
('100002',  'e18002@eng.pdn.ac.lk' ),
('100003',  'e18003@eng.pdn.ac.lk' ),
('100004', 'e18004@eng.pdn.ac.lk'  ),
('100005',  'e18005@eng.pdn.ac.lk' ),
('100006', 'e18006@eng.pdn.ac.lk' ),
('100007',  'e18007@eng.pdn.ac.lk' ),
('100008',  'e18008@eng.pdn.ac.lk' ),
('100009',  'e18009@eng.pdn.ac.lk' ),
('100010',  'e18010@eng.pdn.ac.lk' ),
('100011',  'e18111@eng.pdn.ac.lk' ),
('100012',  'e18011@eng.pdn.ac.lk' ),
('100013',  'e18012@eng.pdn.ac.lk' ),
('100014', 'e18013@eng.pdn.ac.lk' ),
('100015',  'e18014@eng.pdn.ac.lk'  ),
('100016',   'e18015@eng.pdn.ac.lk' ),
('100017',   'e18016@eng.pdn.ac.lk' ),
('100018',   'e18017@eng.pdn.ac.lk' ),
('100019',   'e18018@eng.pdn.ac.lk' )
;


INSERT INTO Customer_PlacementDate (CuSTOMER_ID, ORDER_ID , PLACE_DATE)
VALUES ('100001', '300001' , '2013-05-04' ),
('100002', '300002' ,'2013-05-04' ),
('100003', '300003' ,'2013-05-05' ),
('100004', '300004' ,'2013-05-04' ),
('100005', '300005' ,'2013-05-06' ),
('100006', '300006' ,'2013-05-04' ),
('100007', '300007' ,'2013-05-08' ),
('100008', '300008' ,'2013-05-04' ),
('100009', '300009' ,'2013-05-14' ),
('100010', '300010' ,'2013-05-04' ),
('100011', '300011' ,'2013-05-24' ),
('100012', '300012' ,'2013-05-12' ),
('100013', '300013' ,'2013-05-02' ),
('100014', '300014' ,'2013-05-01' ),
('100015', '300015' ,'2013-02-16' ),
('100016', '300016' ,'2013-01-24' ),
('100017', '300017' ,'2013-01-01' ),
('100018', '300018' ,'2013-02-03' ),
('100019', '300019' ,'2013-02-04' ),
('100020', '300020' ,'2013-02-04' )
;


INSERT INTO ORDER_FullfilimentDate (ORDER_ID, PRODUCT_ID , FULFILS_DATE)
VALUES ('100001', '1' , '2013-05-04' ),
('100002', '2' ,'2013-05-07' ),
('100003', '3' ,'2013-05-07' ),
('100004', '4' ,'2013-05-07' ),
('100005', '5' ,'2013-05-08' ),
('100006', '6' ,'2013-05-09' ),
('100007', '7' ,'2013-05-10' ),
('100008', '8' ,'2013-05-14' ),
('100009', '9' ,'2013-05-17' ),
('100010', '10' ,'2013-05-13' ),
('100011', '11' ,'2013-05-28' ),
('100012', '12' ,'2013-05-16' ),
('100013', '13' ,'2013-05-08' ),
('100014', '14' ,'2013-05-04' ),
('100015', '15' ,'2013-02-19' ),
('100016', '16' ,'2013-01-28' ),
('100017', '17' ,'2013-01-05' ),
('100018', '18' ,'2013-02-08' ),
('100019', '19' ,'2013-02-09' ),
('100020', '20' ,'2013-02-10' )
;

INSERT INTO ORDER_PRODUCT 
VALUES ('100001', '1' , '12' ),
('100002', '2' ,'1' ),
('100003', '3' ,'4' ),
('100004', '4' ,'2' ),
('100005', '5' ,'8' ),
('100006', '6' ,'9' ),
('100007', '7' ,'2' ),
('100008', '8' ,'14' ),
('100009', '9' ,'1' ),
('100010', '10' ,'2' ),
('100011', '11' ,'5' ),
('100012', '12' ,'6' ),
('100013', '13' ,'1' ),
('100014', '14' ,'04' ),
('100015', '15' ,'19' ),
('100016', '16' ,'13' ),
('100017', '17' ,'05' ),
('100018', '18' ,'08' ),
('100019', '19' ,'09' ),
('100020', '20' ,'1' )
;



INSERT INTO ORDER_Price (ORDER_ID, TOTAL_PRICE , SHIPPING_price)
VALUES ('300001', '123.68','55.20' ),
('300002', '156.68','55.20' ),
('300003', '189.68','55.20' ),
('300004', '145.68','55.20' ),
('300005', '198.68','55.20' ),
('300006', '823.68','55.20' ),
('300007', '526.68','55.20' ),
('300008', '639.68','55.20' ),
('300009', '955.68','55.20' ),
('300010', '418.68','55.20' ),
('300011', '123.68','55.20' ),
('300012', '156.68','55.20' ),
('300013', '189.68','55.20' ),
('300014', '145.68','55.20' ),
('300015', '198.68','55.20' ),
('300016', '823.68','55.20' ),
('300017', '526.68','55.20' ),
('300018', '639.68','55.20' ),
('300019', '955.68','55.20' ),
('300020', '418.68','55.20' )
;

UPDATE WAREHOUSE_ADDRESS_DETAILS
SET MANAGERID = WAREHOUSE_ID -1 
WHERE WAREHOUSE_ID < 11;
