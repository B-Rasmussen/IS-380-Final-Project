set echo on
set wrap off
set linesize 150

spool c:\Project\setup.txt

/* Brandon Rasmussen project setup */
drop table Customers cascade constraint;
drop table Products cascade constraint;
drop table Warehouse cascade constraint;
drop table Inventory cascade constraint;
drop table Counter cascade constraint;
drop table SalesOrder cascade constraint;

create table Customers 	(
						CNum varchar2(3),
						CLastName varchar2(25),
						CFirstName varchar2(25),
						CStreet varchar2(30),
						CCity varchar2(20),
						CState varchar2(2),
						CZip number(5),
						CPhone varchar2(15),
						primary key (CNum)
						);

create table Products	(
						PNum varchar2(4),
						PDesc varchar2(10),
						PPrice number(8,2),
						primary key (PNum)
						);

create table Warehouse	(
						WHNum varchar2(4),
						WHStreet varchar2(20),
						WHCity varchar2(20),
						WHState varchar2(2),
						WHZip number(5),
						WHPhone varchar2(15),
						primary key (WHNum)
						);

create table Inventory	(
						PNum varchar2(4),
						WHNum varchar2(4),
						InvQty number(5),
						constraint fk_Inventory_PNum foreign key (PNum) references Products (PNum),
						constraint fk_Inventory_WHNum foreign key (WHNum) references Warehouse (WHNum),
						primary key (PNum,WHNum)
						);
						
create table Counter	(
						OrdNum number(4),
						primary key (OrdNum)
						);
						
create table SalesOrder	(
						OrdNum number(4),
						Status varchar2(6),
						OrdDate date,
						ShipDate date,
						OrdQty number(4),
						ShipQty number (5),
						UnitPrice number (8,2),
						CNum varchar2(3),
						PNum varchar2(4),
						WHNum varchar2(4),
						OrdAmt number(8,2),
						ShipAmt number(8,2),
						ShortShipQty number(4),
						ShortShipAmt number(8,2),
						constraint fk_SalesOrder_CNum foreign key (CNum) references Customers (CNum),
						constraint fk_SalesOrder_PNum foreign key (PNum) references Products (PNum),
						constraint fk_SalesOrder_WHNum foreign key (WHNum) references Warehouse (WHNum),
						primary key (OrdNum)
						);
						
/* Customer Data */
insert into Customers values ('101','Cartman','Eric','831 Main Street','South Park','CO','11359','(123) 222-5235');
insert into Customers values ('102','Gordon','Jim','611 Joker Street','Gotham','NY','61576','(646) 546-8554');
insert into Customers values ('103','Wayne','Bruce','777 Batman Street','Gotham','NY','61578','(646) 654-3256');
insert into Customers values ('104','Winchester','Sam','666 Hunter drive','Lawrence','KS','54157','(984) 117-8328');
insert into Customers values ('105','Templeton','Willow','398 Hollow Avenue','Flagstaff','AZ','54567','(987) 198-9767');

/* Product Data */
insert into Products values ('0001','Pencil','.99');
insert into Products values	('0002','Paper','2.99');
insert into Products values	('0003','Printer','24.99');
insert into Products values	('0004','Notebook','3.99');
insert into Products values	('0005','Binder','2.99');

/* Warehouse Data */
insert into Warehouse values ('1001','512 Industry Drive','Industry City','CA','90864','(888) 156-6543');
insert into Warehouse values ('1002','973 Storage Street','Phoenix','AZ','86548','(345) 645-7685');
insert into Warehouse values ('1003','132 2nd Street','Long Beach','CA','90815','(562) 176-1835');
insert into Warehouse values ('1004','626 Jean Road','Huntsville','AL','12345','(256) 687-1525');
insert into Warehouse values ('1005','328 Dakota Avenue','New York','NY','61677','(312) 645-6718');

/* Inventory Data */

/* Warehouse 1 */
insert into Inventory values ('0001','1001','1000');
insert into Inventory values ('0002','1001','500');
insert into Inventory values ('0003','1001','50');
insert into Inventory values ('0004','1001','200');
insert into Inventory values ('0005','1001','150');

/* Warehouse 2 */
insert into Inventory values ('0001','1002','100');
insert into Inventory values ('0002','1002','200');
insert into Inventory values ('0003','1002','100');
insert into Inventory values ('0004','1002','200');
insert into Inventory values ('0005','1002','100');

/* Warehouse 3 */
insert into Inventory values ('0001','1003','300');
insert into Inventory values ('0002','1003','200');
insert into Inventory values ('0003','1003','75');
insert into Inventory values ('0004','1003','200');
insert into Inventory values ('0005','1003','150');

/* Warehouse 4 */
insert into Inventory values ('0001','1004','500');
insert into Inventory values ('0002','1004','500');
insert into Inventory values ('0003','1004','25');
insert into Inventory values ('0004','1004','200');
insert into Inventory values ('0005','1004','200');

/* Warehouse 5*/
insert into Inventory values ('0001','1005','270');
insert into Inventory values ('0002','1005','500');
insert into Inventory values ('0003','1005','300');
insert into Inventory values ('0004','1005','400');
insert into Inventory values ('0005','1005','200');

/* Counter Data */
insert into Counter(OrdNum) values ('100');


select * from Customers;
select * from Products;
select * from Warehouse;
select * from Inventory;
select * from Counter;
select * from SalesOrder;

spool off