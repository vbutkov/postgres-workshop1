-- По id аккаунта вывести топ-3 его контрагентов (по частоте переводов в любую сторону)


-- the first solution

select from_account, to_account
from transfer tr
where from_account=3 or to_account=3
group by from_account, to_account
limit 3;

-- the second solution

select acc.account_id, u.name from account acc
left join users u on u.user_id = acc.account_id
where acc.account_id in (
		select distinct(tr.from_account) from transfer tr where tr.to_account=3
	) 
	or acc.account_id in (
		select distinct(tr.to_account) from transfer tr where tr.from_account=3
	)
order by account_id
limit 3
