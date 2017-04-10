set echo off
set heading off
set feedback off
set verify off

/* Brandon Rasmussen lookup.sql */

spool c:\project\lookup.txt

prompt
prompt ******* ORDER DETAIL *******
prompt

accept vOrdNum prompt 'Please enter the Order Number: '

/* Customer Info */

select 'Order Number: ', rtrim(OrdNum)
from SalesOrder
where OrdNum = '&vOrdNum';

select 'Order Status: ', Status
from SalesOrder
where OrdNum = '&vOrdNum';

select 'Customer Number: ', CNum
from SalesOrder
where OrdNum = '&vOrdNum';

select '   ', rtrim(initcap(CLastName))||', '||CFirstName
from Customers, SalesOrder
where OrdNum = '&vOrdNum'
and SalesOrder.CNum = Customers.CNum;

select '   ', CStreet
from Customers, SalesOrder
where OrdNum = '&vOrdNum'
and SalesOrder.CNum = Customers.CNum;

select '   ', rtrim(CCity)||', '||ltrim(CState)||' '||ltrim(CZip)
from Customers, SalesOrder
where OrdNum = '&vOrdNum'
and SalesOrder.CNum = Customers.CNum;

select '   ', CPhone
from Customers, SalesOrder
where OrdNum = '&vOrdNum'
and SalesOrder.CNum = Customers.CNum;

prompt
/* Product Info */

select 'Product Number: ', Products.PNum
from SalesOrder, Products
where OrdNum = '&vOrdNum'
and SalesOrder.PNum = Products.Pnum;

select '   Item Description: ', PDesc
from SalesOrder, Products
where OrdNum = '&vOrdNum'
and SalesOrder.PNum = Products.PNum;

select '   Unit Price: $', trim(PPrice)
from SalesOrder, Products
where OrdNum = '&vOrdNum'
and SalesOrder.Pnum = Products.PNum;

prompt
/* Date */

select 'Order Date: ', OrdDate
from SalesOrder
where OrdNum = '&vOrdNum';

select 'Shipping Date: ', ShipDate
from SalesOrder
where OrdNum = '&vOrdNum';

prompt
/* Amount Shipped */

select 'Quantity Ordered: ', trim(OrdQty)
from SalesOrder
where OrdNum = '&vOrdNum';

select 'Amount Ordered: $', trim(OrdAmt)
from SalesOrder
where OrdNum = '&vOrdNum';

select 'Quantity Shipped: ', trim(ShipQty)
from SalesOrder
where OrdNum = '&vOrdNum';

select 'Amount Shipped: $', trim(ShipAmt)
from SalesOrder
where OrdNum = '&vOrdNum';

prompt
/* Warehouse Info */

select 'Shipping Warehouse: ', Warehouse.WHNum
from Warehouse, SalesOrder
where OrdNum = '&vOrdNum'
and SalesOrder.WHNum = Warehouse.WHNum;

select '   ', WHStreet
from Warehouse, SalesOrder
where OrdNum = '&vOrdNum'
and SalesOrder.WHNum = Warehouse.WHNum;

select '   ', rtrim(WHCity)||', '||ltrim(WHState)||' '||ltrim(WHZip)
from Warehouse, SalesOrder
where OrdNum = '&vOrdNum'
and SalesOrder.WHNum = Warehouse.WHNum;

select '   ', WHPhone
from Warehouse, SalesOrder
where OrdNum = '&vOrdNum'
and SalesOrder.WHNum = Warehouse.WHNum;

spool off