select * from payments order by amount desc limit 0,3;
select amount from payments o where 1 = (select count(*) from payments p where o.amount < p.amount);