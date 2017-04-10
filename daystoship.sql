set echo off
set heading off
set feedback off
set verify off

/* Brandon Rasmussen daystoship.sql */

spool c:\project\daystoship.txt

prompt
prompt ******* Average Days to Ship Report *******
prompt

Column WHNum heading 'Warehouse' format a20
Column WHCity heading 'City' format a20
Column WhState heading 'State' format a20
Column avg(ShipDate-OrdDate) heading 'AvgDaystoShip' format 9999.99

set heading on

select Warehouse.WHNum, Warehouse.WHCity, Warehouse.WHState, avg(ShipDate-OrdDate)
from Warehouse, SalesOrder
where SalesOrder.WHNum = Warehouse.WHNum
group by Warehouse.WHNum, Warehouse.WHCity, Warehouse.WHState
order by Warehouse.WHNum, Warehouse.WHCity, Warehouse.WHState;