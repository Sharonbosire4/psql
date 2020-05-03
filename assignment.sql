select  count(*) from users;


select count(*) from transfers where send_amount_currency = 'CFA';

select count(distinct u_id) from transfers; 