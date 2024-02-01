# 1번 계좌에서 계좌 정보까지 출력하는 출금 결과 집합을 만드시오
-- 만약 h.d_account_id 가 null이라면 출금(ATM)
-- 만약 h.d_account_id 가 not null이라면 이체 
select h.id, h.amount, h.w_balance, a.number, h.created_at
, ifnull(h.d_account_id, 'ATM') as receiver
from history_tb as h 
left join account_tb as a 
on h.w_account_id = a.id 
where h.w_account_id = 1;

# 1번 계좌에서 계좌 정보까지 출력하는 입금 결과 집합을 만드시오
-- 만약 h.w_account_id 가 null이라면 입금
-- 만약 h.w_account_id 가 not null이라면 이체 
select h.id, h.amount, h.d_balance, a.number, h.created_at
, ifnull(h.w_account_id, 'ATM') as sender
from history_tb as h 
join account_tb as a 
on h.d_account_id = a.id 
where h.d_account_id = 2;
