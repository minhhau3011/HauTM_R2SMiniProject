
CREATE DATABASE minir2s; USE
    minir2s;
    
CREATE TABLE Accounts(
    Username VARCHAR(50) NOT NULL PRIMARY KEY,
    Password VARCHAR(250) NOT NULL,
    Fullname VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Photo VARCHAR(50) NOT NULL
); 

CREATE TABLE  Roles (
     Roleid  VARCHAR (10) NOT NULL PRIMARY KEY ,
     Name   VARCHAR (50) NOT NULL
   );
   
   CREATE TABLE Categories(
    Id CHAR(4) NOT NULL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
); 
   
   CREATE TABLE  Products (
     Id   INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
	 Name VARCHAR (50) NOT NULL,
     Image  VARCHAR (50) NOT NULL,
     Price  FLOAT  NOT NULL,
     Createdate  DATE  NOT NULL,
     Available  BIT  NOT NULL,
     Categoryid   CHAR (4) NOT NULL,
	FOREIGN KEY (Categoryid) REFERENCES Categories(Id) ON DELETE CASCADE
  );
  
CREATE TABLE Authorities(
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    Roleid VARCHAR(10) NOT NULL,
    FOREIGN KEY (Roleid) REFERENCES Roles(Roleid)ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Username) REFERENCES Accounts(Username) ON UPDATE CASCADE ON DELETE CASCADE
); 

CREATE TABLE  Orders (
     Id  BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
     Username  VARCHAR (50) NOT NULL,
     createDate  DATETIME  NOT NULL,
     Address   VARCHAR (100) NOT NULL,
    FOREIGN KEY (Username) REFERENCES Accounts(Username) ON UPDATE CASCADE ON DELETE CASCADE
    );
    
    CREATE TABLE OrderDetails(
    Id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Orderid bigint NOT NULL,
	Productid int NOT NULL,
    Price FLOAT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (Orderid) REFERENCES Orders(Id) ON UPDATE CASCADE ON DELETE CASCADE,   
    FOREIGN KEY (Productid) REFERENCES Products(Id) ON UPDATE CASCADE
);
INSERT INTO `accounts`(`Username`, `Password`, `Fullname`, `Email`, `Photo`) VALUES('customer', '$2a$10$xpOwxSr9sVFDHOoCIywjIu0dmEw7XyrOOFUEsOwUNJ9Veo3ps4WmC', 'Nguyen Van Teo', 'teonv@gmail.com', 'user.png');
INSERT INTO `accounts`(`Username`, `Password`, `Fullname`, `Email`, `Photo`) VALUES ('director', '$2a$10$xpOwxSr9sVFDHOoCIywjIu0dmEw7XyrOOFUEsOwUNJ9Veo3ps4WmC', 'Nguyen Chi Pheo', 'pheonc@fpt.edu.vn', 'admin.png');
INSERT INTO `accounts`(`Username`, `Password`, `Fullname`, `Email`, `Photo`) VALUES  ('staff', '$2a$10$xpOwxSr9sVFDHOoCIywjIu0dmEw7XyrOOFUEsOwUNJ9Veo3ps4WmC', 'Pham Thi No', 'nopt@gmail.com', 'staff.png');
INSERT INTO `accounts`(`Username`, `Password`, `Fullname`, `Email`, `Photo`) VALUES  ('MinhHau', '$2a$10$xpOwxSr9sVFDHOoCIywjIu0dmEw7XyrOOFUEsOwUNJ9Veo3ps4WmC', 'Tran Minh Hau', 'hautm@gmail.com', 'user1.png');

INSERT INTO `roles`(`Roleid`, `NAME`) VALUES ('ROLE_USER', 'Customers');
INSERT INTO `roles`(`Roleid`, `NAME`) VALUES ('ROLE_ADMIN', 'Directors');
INSERT INTO `roles`(`Roleid`, `NAME`) VALUES ('ROLE_PM', 'Staffs');

INSERT INTO `authorities`(`Id`, `Username`, `Roleid`) VALUES (1, 'MinhHau', 'ROLE_USER');
INSERT INTO `authorities`(`Id`, `Username`, `Roleid`) VALUES (2, 'director', 'ROLE_ADMIN');
INSERT INTO `authorities`(`Id`, `Username`, `Roleid`) VALUES (3, 'staff', 'ROLE_PM');
INSERT INTO `authorities`(`Id`, `Username`, `Roleid`) VALUES (4, 'customer', 'ROLE_USER');

INSERT INTO `categories`(`Id`, `Name`) VALUES ('1000', 'Dien thoai Iphone');
INSERT INTO `categories`(`Id`, `Name`) VALUES ('1001', 'Dien thoai Samsung');
INSERT INTO `categories`(`Id`, `Name`) VALUES ('1002', 'Dien thoai Oppo');
INSERT INTO `categories`(`Id`, `Name`) VALUES ('1003', 'Dien thoai Vivo');
INSERT INTO `categories`(`Id`, `Name`) VALUES ('1004', 'Dien thoai Vsmart');
INSERT INTO `categories`(`Id`, `Name`) VALUES ('1005', 'Dien thoai Xiaomi');

INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1001, 'Iphone 12 64GB', '1001.jpg', 500, '2021-09-04', 0, '1000');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES (1002, 'IPhone 12 Pro Max 512GB', '1002.jpg', 199,'2021-09-06', 0, '1000');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1003, 'IPhone 12 Pro Max 126GB', '1003.jpg', 110,'2021-09-06', 1, '1000');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1004, 'iPhone SE 64GB (2020)', '1004.jpg', 222, '2021-09-04', 0, '1000');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES (1005, 'Iphone XR 64GB', '1005.jpg', 21.35, '2021-09-06', 1, '1000');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1006, 'IPhone 11 Pro Max 64GB', '1006.jpg', 252, '2021-09-04', 0, '1000');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1007, 'IPhone 6s 16GB', '1007.jpg', 330, '2021-09-06', 0, '1000');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1008, 'iPhone 8 Plus 256GB', '1008.jpg', 440,'2021-09-06', 0, '1000');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1009, 'Samsung Galaxy Z Fold3 5G 256GB', '1009.jpg', 197, '2021-09-04', 0, '1001');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1010, 'Samsung Galaxy Z Fold5', '1010.jpg', 131, '2021-09-04', 0, '1001');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1011, 'Galaxy Z Fold3 & Z Flip3 5G', '1011.jpg', 521, '2021-09-06', 0, '1001');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1012, 'Samsung Galaxy S21+ 5G 256GB', '1012.jpg', 438, '2021-09-04', 1, '1001');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1013, 'Samsung Galaxy M51', '1013.jpg', 6,'2021-09-06', 0, '1001');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES 	(1014, 'Samsung Galaxy A52 256GB', '1014.jpg', 23.25, '2021-09-04', 1, '1001');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1015, 'Samsung Galaxy A52 126BG', '1015.jpg', 15.5, '2021-09-06', 0, '1001');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1016, 'Oppo A93', '1016.jpg', 17.45, '2021-09-04', 0, '1002');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1017, 'Oppo A15s', '1017.jpg', 39,'2021-09-06', 1, '1002');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1018, 'OPPO Reno6 Z 5G', '1018.jpg', 62.5,'2021-09-04', 1, '1002');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1019, 'Oppo A74', '1019.jpg', 9.2, '2021-09-06', 0, '1002');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1020, 'Oppo Find x3 Pro 5G', '1020.jpg', 81,'2021-09-06', 0, '1002');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES 	(1021, 'Oppo Reno4 Pro', '1021.jpg', 23.25, '2021-09-04', 1, '1002');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1022, 'Oppo Reno5 Marvel', '1022.jpg', 15.5, '2021-09-06', 0, '1002');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1023, 'Oppo Reno5', '1023.jpg', 17.45, '2021-09-04', 0, '1002');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1024, 'Vivo Y12S', '1024.jpg', 39,'2021-09-06', 1, '1003');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1025, 'Vivo V21 5G', '1025.jpg', 62.5,'2021-09-04', 1, '1003');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1026, 'Vivo V20 2021', '1026.jpg', 9.2, '2021-09-06', 0, '1003');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1027, 'Vivo V20 SE', '1027.jpg', 81,'2021-09-06', 0, '1003');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES 	(1028, 'Vivo Y20', '1028.jpg', 23.25, '2021-09-04', 1, '1003');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1029, 'Vivo Y1S', '1029.jpg', 15.5, '2021-09-06', 0, '1003');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1030, 'Vivo Y20 2021', '1030.jpg', 17.45, '2021-09-04', 0, '1003');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1031, 'Vsmart Star 5', '1031.jpg', 39,'2021-09-06', 1, '1004');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1032, 'Vsmart Star 3', '1032.jpg', 62.5,'2021-09-04', 1, '1004');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1033, 'Vsmart Aris', '1033.jpg', 9.2, '2021-09-06', 0, '1004');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1034, 'Vsmart Active3', '1034.jpg', 81,'2021-09-06', 0, '1004');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1035, 'Vsmart Star', '1035.jpg', 9.2, '2021-09-06', 0, '1004');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1036, 'Vsmart Joy 1+', '1036.jpg', 81,'2021-09-06', 0, '1004');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1037, 'Vsmart Lux', '1037.jpg', 9.2, '2021-09-06', 0, '1004');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1038, 'Vsmart 2021', '1038.jpg', 81,'2021-09-06', 0, '1004');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1039, 'Xiaomi Redmi Note 9', '1039.jpg', 9.2, '2021-09-06', 0, '1005');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1040, 'Xiaomi Redmi Note 10', '1040.jpg', 81,'2021-09-06', 0, '1005');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1041, 'Xiaomi Redmi 9A', '1041.jpg', 9.2, '2021-09-06', 0, '1005');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1042, 'Xiaomi Redmi Note 9 Pro', '1042.jpg', 81,'2021-09-06', 0, '1005');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1043, 'Xiaomi Redmi 9T', '1043.jpg', 9.2, '2021-09-06', 0, '1005');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1044, 'Xiaomi Redmi 9C', '1044.jpg', 81,'2021-09-06', 0, '1005');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1045, 'Xiaomi MI MIX 4', '1045.jpg', 9.2, '2021-09-06', 0, '1005');
INSERT INTO `products`(`Id`, `Name`, `Image`, `Price`, `Createdate`, `Available`, `CategoryId`) VALUES  (1046, 'Xiaomi Redmi 8A', '1046.jpg', 81,'2021-09-06', 0, '1005');

INSERT `orders` (`Id`, `Username`, `createDate`,`Address`) VALUES (10001, 'MinhHau', '2021-09-07', 'Thoi Lai, CanTho');
INSERT `orders` (`Id`, `Username`, `createDate`,`Address`) VALUES (10002, 'staff', '2021-09-07', '91B Nguyen Van Cu, Can Tho');
INSERT `orders` (`Id`, `Username`, `createDate`,`Address`) VALUES (10003, 'customer', '2021-09-07', 'Thoi Lai, CanTho');
INSERT `orders` (`Id`, `Username`, `createDate`,`Address`) VALUES (10004, 'MinhHau', '2021-09-07', 'Thoi Lai, CanTho');
INSERT `orders` (`Id`, `Username`, `createDate`,`Address`) VALUES (10005, 'staff', '2021-09-07', '91B Nguyen Van Cu, Can Tho');
INSERT `orders` (`Id`, `Username`, `createDate`,`Address`) VALUES (10006, 'customer', '2021-09-07', 'Thoi Lai, CanTho');
INSERT `orders` (`Id`, `Username`, `createDate`,`Address`) VALUES (10007, 'customer', '2021-09-07', '91B Nguyen Van Cu, Can Tho');
INSERT `orders` (`Id`, `Username`, `createDate`,`Address`) VALUES (10008, 'MinhHau', '2021-09-07', 'Thoi Lai, CanTho');

INSERT `orderdetails` (`Id`, `Orderid`, `Productid`,`Price`,`Quantity`) VALUES (001, '10001', '1001', '560','4');
INSERT `orderdetails` (`Id`, `Orderid`, `Productid`,`Price`,`Quantity`) VALUES (002, '10003', '1004', '100','10');
INSERT `orderdetails` (`Id`, `Orderid`, `Productid`,`Price`,`Quantity`) VALUES (003, '10002', '1012', '202','1');
INSERT `orderdetails` (`Id`, `Orderid`, `Productid`,`Price`,`Quantity`) VALUES (004, '10004', '1023', '194','3');
INSERT `orderdetails` (`Id`, `Orderid`, `Productid`,`Price`,`Quantity`) VALUES (005, '10005', '1042', '399','4');
INSERT `orderdetails` (`Id`, `Orderid`, `Productid`,`Price`,`Quantity`) VALUES (006, '10007', '1011', '560','5');
INSERT `orderdetails` (`Id`, `Orderid`, `Productid`,`Price`,`Quantity`) VALUES (007, '10008', '1045', '560','4');


