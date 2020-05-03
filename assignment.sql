select  count(*) from users;


select count(*) from transfers where send_amount_currency = 'CFA';

select count(distinct u_id) from transfers; 

select count(*), extract(months from when_created) as month from transfers where extract(years from when_created) = 2018 GROUP BY extract(months from when_created);

select sum(case when amount > 0 THEN amount else 0 END) as withdrawal,  sum(case when amount < 0 then amount else 0 END) as deposit, 
case when ((sum(case when amount > 0 THEN amount else 0 END)) > ((sum(case when amount < 0 then amount else 0 END))) * -1) then 'withdrawer' 
else 'depositer' END as agent_status, count(*)from agent_transactions WHERE when_created  between (now()  - '1 WEEK'::INTERVAL) and now()