select  count(*) from users;


select count(*) from transfers where send_amount_currency = 'CFA';

select count(distinct u_id) from transfers; 

select count(*), extract(months from when_created) as month from transfers where extract(years from when_created) = 2018 GROUP BY extract(months from when_created);