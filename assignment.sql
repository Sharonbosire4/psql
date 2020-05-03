select  count(*) from users;


select count(*) from transfers where send_amount_currency = 'CFA';

select count(distinct u_id) from transfers; 

select count(*), extract(months from when_created) as month from transfers where extract(years from when_created) = 2018 GROUP BY extract(months from when_created);

select sum(case when amount > 0 THEN amount else 0 END) as withdrawal,  sum(case when amount < 0 then amount else 0 END) as deposit, 
case when ((sum(case when amount > 0 THEN amount else 0 END)) > ((sum(case when amount < 0 then amount else 0 END))) * -1) then 'withdrawer' 
else 'depositer' END as agent_status, count(*)from agent_transactions WHERE when_created  between (now()  - '1 WEEK'::INTERVAL) and now()


select agents.city,  count(amount)  from agent_transactions “atx volume city summary inner join agents on agents.agent_id=agent_transactions.agent_id 
where when_created  > current_date -interval '7 days'  GROUP BY agents.city ;



SELECT agents.city, agents.country, SUM (agent_transaction_amount) AS transaction_volume (*)FROM agent_transaction when created > “DATE” GROUP BY city, country;


SELECT agents.city, SUM (transfers.send_amount_scalar) AS transaction_scalar, transfers.kind AS transfer_kind FROM transfer, agents, agents_transactions WHERE (agents_transactions.when_created >= DATE_TRUNC ('week', CURRENT_TIMESTAMP - interval '1 week'))


SELECT agents.city, SUM (transfers.send_amount_scalar) AS transaction_scalar, COUNT (agent_transactions.amount) AS transaction_volume, transfers.kind AS transfer_kind, COUNT (DISTINCT (transfer_id) AS unique_SENDERS FROM transfers, agents, agent_transactions WHERE (agent_transactions.when_created >= DATE_TRUCN ('week', CURRENT_TIMESTAMP - interval '1 week')) AND agent_transactions.when_created > DATE_TRUNC ('week', CURRENT_TIMESTAMP) GROUP BY country, kind, city