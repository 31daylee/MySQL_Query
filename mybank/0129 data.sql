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