set echo off
set heading off
set feedback off
set verify off

/* Brandon Rasmussen open.sql */

spool c:\project\open.txt

prompt
prompt ******* Open Order *******
/* Current date */
select 'Today''s Date:', CURRENT_DATE
from Dual;

prompt

/* Customer information */

accept vCNum prompt 'Enter the Customer Number: ';

select '   Customer Name: ', rtrim(initcap(CLastName))|| ', ' || rtrim(initcap(CFirstName))
from Customers
where CNum ='&vCNum';

select '   Shipping Address: ', CStreet
from Customers
where CNum ='&vCNum';

select '   City, State Zip:', rtrim(initcap(CCity))||', '|| rtrim(initcap(CState))||' '|| rtrim(initcap(CZip))
from Customers
where CNum = '&vCNum';

select '   Phone: ', CPhone
from Customers
where CNum = '&vCNum';

/* Product information */

accept vPNum prompt 'Enter the Product Number: ';

select '   Product Number: ', PNum
from Products
where PNum = '&vPNum';

select '   Product Description: ', PDesc
from Products
where PNum = '&vPNum';

select '   Unit Price: $', trim(PPrice)
from Products
where PNum = '&vPNum';

/* Quantity ordered */

accept vOrdQty prompt 'Enter the quantity ordered: ';

select '   Amount Total: $', trim('&vOrdQty'*PPrice)
from Products
where PNum = '&vPNum';

/* Warehouse information */
set heading on

prompt
prompt Please choose from the following warehouses:

Column WHNum heading 'WHNum' format a20
Column WHCity heading 'WHCity' format a20
Column WhState heading 'WHState' format a20
Column InvQty heading 'Quantity' format 9999

select Warehouse.WHNum, WHCity, WHState, InvQty
from Warehouse, Inventory, Products
where Warehouse.WHNum = Inventory.WHNum
and Products.PNum = '&vPNum'
and Products.PNum = Inventory.Pnum;

prompt
accept vWHNum prompt 'Enter the warehouse code: ';

set heading off

commit;

insert into SalesOrder (Status, OrdNum, OrdDate, ShipDate, OrdQty, ShipQty, UnitPrice, CNum, PNum, WHNum, OrdAmt, ShipAmt)
select 'Open', OrdNum, sysdate, null, '&vOrdQty', null, PPrice, '&vCNum', '&vPNum', '&vWHNum',('&vOrdQty'*PPrice), null
from Counter, Products
where Products.PNum = '&vPNum'
and Counter.OrdNum = OrdNum;

/* I have a counter table in my setup.sql */

update Counter set OrdNum = OrdNum+1;


prompt
prompt
prompt ****** Order Status: OPEN
prompt
select '***** Order Number is --------> ', OrdNum
from Counter;

commit;

spool off