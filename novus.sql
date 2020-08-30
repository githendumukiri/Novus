CREATE TABLE T_Customers (
	id           INT(8) NOT NULL, 
	name         VARCHAR(20) NOT NULL, 
	accountinfo  VARCHAR(1000),
	5	PRIMARY KEY (id)
);

CREATE TABLE T_Orders (
	id           INT(8) NOT NULL, 
	customerid   INT(8) NOT NULL, 
      orderdate    DATE NOT NULL,
	time         TIMESTAMP NOT NULL,
	
	PRIMARY KEY (id),
      FOREIGN KEY (customerid) REFERENCES T_Customers (id)
);

CREATE TABLE T_Products (
	id           INT(8) NOT NULL, 
	name         VARCHAR(50) NOT NULL, 
      price        DECIMAL(4,2) NOT NULL,
	
	PRIMARY KEY (id)
);

CREATE TABLE T_Parts (
	id           INT(8) NOT NULL, 
	name         VARCHAR(8) NOT NULL,
      description  VARCHAR(1000) NOT NULL, 
      cost         DECIMAL(4,2) NOT NULL,
	
	PRIMARY KEY (id)
);

CREATE TABLE T_Suppliers (
	id           INT(8) NOT NULL, 
	address      VARCHAR(120) NOT NULL, 
	
	PRIMARY KEY (id)
);

CREATE TABLE T_Product_Part_Associate (
	productid    INT(8) NOT NULL, 
	partid       INT(8) NOT NULL, 
	
	FOREIGN KEY (productid) REFERENCES T_Products (id),
	FOREIGN KEY (partid) REFERENCES T_Parts (id)
);

CREATE TABLE T_Part_Supplier_Associate (
	partid       INT(8) NOT NULL, 
	supplierid   INT(8) NOT NULL, 
	
	FOREIGN KEY (partid) REFERENCES T_Parts (id),
	FOREIGN KEY (supplierid) REFERENCES T_Suppliers (id)
);

CREATE TABLE T_Order_Product_Associate (
	orderid      INT(8) NOT NULL, 
	productid    INT(8) NOT NULL, 
	
	FOREIGN KEY (orderid) REFERENCES T_Orders (id),
	FOREIGN KEY (productid) REFERENCES T_Products (id)
);

CREATE TABLE T_Payments (
	orderid      INT(8) NOT NULL, 
	billinginfo  VARCHAR(100) NOT NULL,
	cardinfo     VARCHAR(100) NOT NULL,
	
	FOREIGN KEY (orderid) REFERENCES T_Orders (id)
);

CREATE TABLE T_Refunds (
	customerid   INT(8) NOT NULL, 
	productid    INT(100) NOT NULL,
	
	FOREIGN KEY (customerid) REFERENCES T_Customers (id),
      FOREIGN KEY (productid) REFERENCES T_Products (id)
);

CREATE TABLE T_Shipments (
	orderid  INT(8) NOT NULL,
  address  VARCHAR(120) NOT NULL,
      shipdate DATE NOT NULL,
	
	FOREIGN KEY (orderid) REFERENCES T_Orders (id)
);

CREATE TABLE T_Distribution_Centers (
	id       INT(8) NOT NULL, 
	address  VARCHAR(120) NOT NULL,
	
	PRIMARY KEY (id)
);

CREATE TABLE T_Sellers (
	customerid   INT(8) NOT NULL, 
	profit       DECIMAL(8,2) NOT NULL,
	
	FOREIGN KEY (customerid) REFERENCES T_Customers (id)
);

CREATE TABLE T_Seller_Requests (
	customerid  INT(8) NOT NULL, 
	productid   INT(8) NOT NULL, 
	commission  DECIMAL(4,3) NOT NULL,
	numunits    INT(5),
	
	FOREIGN KEY (customerid) REFERENCES T_Customers (id),
      FOREIGN KEY (productid) REFERENCES T_Products (id)
	
);

CREATE TABLE T_Product_Reviews (
	customerid  INT(8) NOT NULL, 
	productid   INT(8) NOT NULL, 
	rating      INT(1) NOT NULL,
	comment     VARCHAR(5000),
	
	FOREIGN KEY (customerid) REFERENCES T_Customers (id),
      FOREIGN KEY (productid) REFERENCES T_Products (id)
	
);
CREATE TABLE T_Seller_Rating (
	customerid  INT(8) NOT NULL, 
	sellerid    INT(8) NOT NULL, 
	rating      INT(1) NOT NULL,
	comment     VARCHAR(5000),
	
	FOREIGN KEY (customerid) REFERENCES T_Customers (id),
      FOREIGN KEY (sellerid) REFERENCES T_Sellers (customerid)
);

CREATE TABLE T_Employees (
	id      INT(8) NOT NULL, 
	role    VARCHAR(100) NOT NULL, 
	salary  INT(8) NOT NULL,
	
	PRIMARY KEY (id)
);

CREATE TABLE T_Departments (
	id      INT(8) NOT NULL, 
	name    VARCHAR(20) NOT NULL, 
	role    VARCHAR(100) NOT NULL,
	
	PRIMARY KEY (id)
);
