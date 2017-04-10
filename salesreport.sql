set echo off
set heading off
set feedback off
set verify off
set linesize 200

/* Brandon Rasmussen salesreport.sql */

spool c:\project\salesreport.txt

prompt
prompt ******* Monthly Sales Report *******
prompt

Column OrdDate heading 'Order|Month   ' format a20
Column Products.PNum heading 'Product|#   ' format 9999
Column Products.PDesc heading 'Product|Name   ' format a20
Column count(OrdNum) heading ' # of|Orders' format 9999
Column sum(OrdQty) heading 'Total|Units' format 9999
Column sum(OrdAmt) heading 'Total|Amount' format $9999.99

set heading on

select TO_CHAR(OrdDate, 'MM/YYYY') as OrdDate, Products.PNum, Products.PDesc, count(OrdNum), sum(OrdQty), sum(OrdAmt)
from SalesOrder, Products
where SalesOrder.PNum = Products.PNum
group by TO_CHAR(OrdDate, 'MM/YYYY'), Products.PNum, Products.PDesc
order by OrdDate, Products.PNum, Products.PDesc;