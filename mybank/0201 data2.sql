
# 출금 내역 쿼리 생성(ATM에서 출금, 이체하여 돈을 보냄) 2가지 경우
-- 보낸 사람 d_account_id 가 not null이라면 보낸 계좌 번호도 출력
-- 이체가 되었다면 보낸 계좌 정보 (ATM이 아니라면)
-- 출금된 계좌번호와 입금한 계좌번호를 함께 출력하시오
select h.id, h.amount, h.w_balance, wa.number as sender, h.created_at
, ifnull(h.d_account_id, 'ATM') as receiver, da.number
from history_tb as h 
left join account_tb as wa 
on h.w_account_id = wa.id 
left join account_tb as da
on h.d_account_id = da.id 
where h.w_account_id = 1;


-- 입금 거래 내역 쿼리 생성
select h.id, h.amount, h.d_balance, h.created_at
, ifnull(wa.number, 'ATM') as sender, da.number as receiver
from history_tb as h 
left join account_tb as wa 
on h.w_account_id = wa.id 
left join account_tb as da
on h.d_account_id = da.id 
where h.d_account_id = 1;

-- 강사님 버전
select h.id, h.amount, h.d_balance as balance, h.created_at,
	   ifnull(wa.number, 'ATM') as sender, 
       da.number as receiver 
from history_tb as h 
left join account_tb as da 
on h.d_account_id = da.id 
left join account_tb as wa 
on h.w_account_id = wa.id 
where h.d_account_id = 1;


# 입출금 내역 (조건이 1 만족할 때 A 출력 조건 2가 만족할 때 B출력 )
-- CASE WEHN THEN ... 함수가 필요 하다. 
-- 
select h.id, h.amount,
case when h.w_account_id = 1 then (h.w_balance)
     when h.d_account_id = 1 then (h.d_balance) 
     end as balance, 
     ifnull(wa.number, 'ATM') as sender, 
     ifnull(da.number, 'ATM') as receiver, 
     h.created_at
from history_tb as h 
left join account_tb as da 
on h.d_account_id = da.id 
left join account_tb as wa 
on h.w_account_id = wa.id 
where h.d_account_id = 1 or h.w_account_id = 1;

select h.id, h.amount,
case when h.w_account_id = 1 then (h.w_balance)
     when h.d_account_id = 1 then (h.d_balance) 
     end as balance, 
     ifnull(wa.number, 'ATM') as sender, 
     ifnull(da.number, 'ATM') as receiver, 
     h.created_at
from history_tb as h 
left join account_tb as da 
on h.d_account_id = da.id 
left join account_tb as wa 
on h.w_account_id = wa.id 
where h.d_account_id = 1 or h.w_account_id = 1;



