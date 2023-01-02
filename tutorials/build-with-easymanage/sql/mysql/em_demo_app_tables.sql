
DROP TABLE  if exists erp_inventory;
DROP TABLE   if exists erp_product;
drop table  if exists erp_customer;
drop table if exists  erp_sales_inquiry;


CREATE TABLE erp_product (
  product_id int(11) NOT NULL AUTO_INCREMENT,
  product_name varchar(50) NOT NULL,
  product_category varchar(20) DEFAULT '',
  primary_supplier varchar(30) DEFAULT '',
  product_desc text,
  product_picture MEDIUMBLOB,
  PRIMARY KEY (product_id)
);

INSERT INTO erp_product 
(
  product_id ,
  product_name ,
  product_category ,
  primary_supplier 
)
VALUES (1,'Amoxicillin','Antibiotics','Lupin'),(2,'Azithromycin','Antibiotics','Abbot'),(3,'Erythromycin Stearate','Antibiotics','Cipla'),(4,'Ceftriaxone','Antibiotics','Lupin'),(5,'Cefoperazone','Antibiotics','Abbot'),(6,'Cefixime','Antibiotics','Cipla'),(7,'Cephalexin','Antibiotics','Lupin'),(8,'Piperacillin Tazobactam','Antibiotics','Abbot'),(9,'Sulbactam','Antibiotics','Cipla'),(10,'Dexamethasone','Steroid','Lupin'),(11,'Prednisolone','Steroid','Abbot'),(12,'Metformin','Antibiotics','Cipla'),(13,'Gabapentin','Antibiotics','Lupin'),(14,'Rifampicin','Antibiotics','Abbot'),(15,'Vitamin B1','Vitamin','Cipla'),(16,'Vitamin B6','Vitamin','Lupin'),(17,'Clindamycin Phosphate','Antibiotics','Abbot'),(18,'Clindamycin HCL','Antibiotics','Cipla'),(19,'Streptomycin','Antibiotics','Lupin'),(20,'Neomycin','Antibiotics','Abbot'),(21,'Gentamycin','Antibiotics','Cipla'),(22,'Doxycycline','Antibiotics','Lupin'),(23,'Potassium Clavulanate','Antibiotics','Abbot'),(24,'Oxytetracycline','Antibiotics','Cipla'),(25,'Tetracycline','Antibiotics','Lupin'),(26,'Clarithromycin','Antibiotics','Abbot');

/* ----- stage 2 -------
Alter  TABLE erp_product 
add (product_type varchar(30) default 'Medicine')
;
*/

CREATE TABLE erp_inventory (
  inv_id int(11) NOT NULL AUTO_INCREMENT,
  product_id int(11) NOT NULL,
  inv_date DATE NULL,
  inv_qty int(11) DEFAULT 0,
  inv_min_qty int(11) DEFAULT 0,
  inv_cost numeric(19,4) DEFAULT 0,
  inv_location VARCHAR(50) DEFAULT '',
  PRIMARY KEY (inv_id),
  UNIQUE KEY (inv_id, product_id, inv_date),
  CONSTRAINT erp_product_id FOREIGN KEY (product_id) REFERENCES erp_product (product_id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

INSERT INTO erp_inventory 
(
  product_id ,
  inv_date ,
  inv_qty ,
  inv_min_qty ,
  inv_cost ,
  inv_location 
)
SELECT 
  product_id ,
  date_sub(curdate(),interval 1 month), 
  product_id * 10 ,
  product_id * 2 ,
  product_id * 10 * 10 * 0.5 ,
  'USA'
FROM erp_product
;

create or replace view erp_inventory_vw
AS
select 
b.inv_id ,
b.product_id       ,
a.product_name     ,
b.inv_date    ,
b.inv_qty    ,
b.inv_min_qty   , 
b.inv_cost    ,
b.inv_location 
from erp_product a, 
	 erp_inventory b
where b.product_id = a.product_id
;

create or replace view erp_inventory_sum_vw
AS
select 
	YEAR(inv_date) year, 
	MONTH(inv_date) month, 
	sum(inv_qty) total_qty 
from erp_inventory 
group by 
	YEAR(inv_date),
	MONTH(inv_date)
union all
select 
	YEAR(inv_date) - 1 year, 
	MONTH(inv_date) month, 
	sum(inv_qty) * 0.80 total_qty 
from erp_inventory 
group by 
	YEAR(inv_date),
	MONTH(inv_date)
union all
select 
	YEAR(inv_date) -2 year, 
	MONTH(inv_date) month, 
	sum(inv_qty) * 0.50 total_qty 
from erp_inventory 
group by 
	YEAR(inv_date),
	MONTH(inv_date)
	; 

create table erp_customer ( 
 Customer_Id VARCHAR (30) NOT NULL
, Name VARCHAR (300) NOT NULL
, Phone VARCHAR (20) DEFAULT ''
, Mobile_Phone VARCHAR (20) DEFAULT ''
, Pict MEDIUMBLOB 
, Email VARCHAR (500) DEFAULT ''
, WebSite VARCHAR (500) DEFAULT ''
, Address TEXT
, DateOfInquiry DATE 
, RequestedQty INT DEFAULT 0
, ReqQuoteAmt DECIMAL(20,4)  DEFAULT 0
, MeetingPrefTime TIME
, Created DATETIME
, Updated TIMESTAMP NULL
,PRIMARY KEY (Customer_Id)
);


insert into erp_customer ( 
 Customer_Id 
, Name 
)
values (1, 'John Doe') 
	,(2, 'Jane Doe')
	,(3, '3 John Doe')
	,(4, '4 Jane Doe')
	,(5, '5 John Doe')
	,(6, '6 Jane Doe')
	,(7, '7 John Doe')
	,(8, '8 Jane Doe')
	,(9, '9 John Doe')
	,(10, '10 Jane Doe')
	,(11, '11 John Doe')
	;


update erp_customer
set 
 Phone = '+1 408 555 0100'
, Mobile_Phone = '+1 408 555 0199'
, Email = 'info@yourdomain.com'
, Address ='Street 1 \n Landmark Name'
, WebSite = 'https://www.yourdomain.com'
, DateOfInquiry = NOW()
, RequestedQty = SECOND(NOW()) * 10
, ReqQuoteAmt = (SECOND(NOW()) * 10 * 10 * 1.5) + 0.5
, MeetingPrefTime = CURRENT_TIME
, Created =  NOW()
, Updated  = CURRENT_TIMESTAMP
;


create table erp_sales_inquiry ( 
 DateOfInquiry DATE 
, RequestedQty INT
, ReqQuoteAmt DECIMAL(20,4)
, MeetingPrefTime TIME
, Created DATETIME
, Updated TIMESTAMP NULL
,PRIMARY KEY (DateOfInquiry)
);

insert into erp_sales_inquiry (
 DateOfInquiry 
, RequestedQty 
, ReqQuoteAmt 
, MeetingPrefTime 
, Created 
, Updated 
)
values 
(CURDATE(), 550, 400.55, CURRENT_TIME,NOW(), CURRENT_TIMESTAMP ) ,
( date_add(now(),interval 1 day), 550, 400.55, CURRENT_TIME,NOW(), CURRENT_TIMESTAMP ) ,
( date_add(now(),interval 2 day), 550, 400.55, CURRENT_TIME,NOW(), CURRENT_TIMESTAMP ) 
;
