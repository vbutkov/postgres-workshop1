-- Вывести имя владельца аккаунта, которому чаще всего переводили деньги

select u.name, tr.to_account as account_id, count(*) as transfer_count 
from transfer tr
left join account acc on acc.account_id = tr.to_account
left join users u on u.user_id = acc.user_id
group by tr.to_account, u.name
order by transfer_count desc 
limit 1;
