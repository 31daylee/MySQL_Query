use mybank;
insert into user_tb
	(username, password,fullname,created_at)
values('test1', 'asd1234', 'aa', now());

update user_tb set usrename = 'test2', password = '1111',
					fullname='' where id = '';
                    
insert into account_tb
	(number, password, balance, user_id, created_at)
values('4444', '1234', 10000, 2, now());

update account_tb set number= '0111', password = '2222', balance = 9000
					 where id = 4;

insert into history_tb
	(amount, w_account_id,d_account_id,w_balance,d_balance,created_at)
values(1000,1,3, 300,1000,now());

# 출금 금액 insert 쿼리문 만들기 
use mybank;
desc history_tb;

# 출금 내역(1번 계좌에서 100원)
insert into history_tb(amount, w_account_id, d_account_id,
					w_balance, d_balance, created_at)
values(100,1,null,1200,null, now());

# 출금 처리 update
update account_tb set number = '1111', password = '1234', 
	balance = 1200, user_id='1' where id = '1';
    
show processlist;

# 1번 계좌에서 출금 내역 
select * from history_tb where w_account_id = 1;

# 1번 계좌에서 입금 내역
select * from history_tb where d_account_id = 1;

# 1번 계좌에서 계좌 정보까지 출력하는 출금 결과 집합을 만드시오
select h.id, h.amount, h.w_balance, a.number, h.created_at
from history_tb as h 
join account_tb as a 
on h.w_account_id = a.id 
where h.w_account_id = 1;
