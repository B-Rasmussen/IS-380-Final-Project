set echo off
set heading off
set feedback off
set verify off

/* Brandon Rasmussen shortship.sql */

spool c:\project\shortship.txt

prompt
prompt ******* Short Ship Report *******
prompt

Column PNum heading 'Product|#' format a20
Column PDesc heading 'Product|name' format a20
Column sum(ShortShipQty) heading 'Short Ship|Qty   ' format 9999
Column sum(ShortShipQty*UnitPrice) heading 'Short Ship|Amount   ' format $9999.99

set heading on

select Products.PNum, Products.PDesc, sum(ShortShipQty), sum(ShortShipQty*UnitPrice)
from Products, SalesOrder
where SalesOrder.PNum = Products.PNum
group by Products.PNum, Products.PDesc
order by Products.PNum, Products.PDesc;