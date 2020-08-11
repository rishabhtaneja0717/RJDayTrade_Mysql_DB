-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- TODAYS Transactions
-- ------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------
-- delete today's transactionos 
delete from demo.`transaction` t where 
date(t.buy_datetime) = curdate()
and user_id=@user_id;
commit;


delete from demo.`transaction` t where 
 user_id=@user_id;
commit;


set @month = 8;
set @user_id = 6;
set @day_sub = 0;

select uai.* from user_account_info uai			
where uai.user_id = 6
and 
uai.account_type='ACTUAL';
commit;


-- complete gain --
insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , sell_datetime , 
	buy_price_market , sell_price_market, buy_price_actual , sell_price_actual , unit_gain_market , unit_gain_actual , 
	stock_symbol, units_purchased , sell_date,  transaction_status, 
	gain_market, gain_actual, after_sell_account_amt)
values
	(@user_id, MONTH(date_sub(now(), interval @day_sub day)), 2020, 
	date_sub(date_sub(now(),interval 15 minute) , interval @day_sub day) , 
	date_sub(date_sub(now(),interval 10 minute) , interval @day_sub day), 
	165, 168, 165.1, 167.9, 3, 2.8, 
	'APPL', 10, 
	date_sub(date_sub(now(),interval 10 minute) , interval @day_sub day), 
	'COMPLETE', 
	unit_gain_market * units_purchased, unit_gain_actual * units_purchased, 20000 +  (5000 * month(date_sub(now(), interval @day_sub day))) + (100 * DAY(date_sub(now(), interval @day_sub day))));

-- complete gain --
insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , sell_datetime , 
	buy_price_market , sell_price_market, buy_price_actual , sell_price_actual, unit_gain_market, unit_gain_actual, 
	stock_symbol, units_purchased , sell_date,  transaction_status, 
	gain_market, gain_actual, after_sell_account_amt)
values
	(@user_id, MONTH(date_sub(now(), interval @day_sub day)), 2020, 
	date_sub(date_sub(now(),interval 15 minute) , interval @day_sub day) , 
	date_sub(date_sub(now(),interval 10 minute) , interval @day_sub day), 
	265, 268, 265.1, 267.9, 3, 2.8, 
	'BABA', 10, 
	date_sub(date_sub(now(),interval 10 minute) , interval @day_sub day), 
	'COMPLETE', 
	unit_gain_market * units_purchased, unit_gain_actual * units_purchased, 24000 + (5000 * month(date_sub(now(), interval @day_sub day))) + (100 * DAY(date_sub(now(), interval @day_sub day))));

-- complete loss --
insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , sell_datetime , 
	buy_price_market , sell_price_market, buy_price_actual , sell_price_actual , unit_gain_market, unit_gain_actual, 
	stock_symbol, units_purchased , sell_date,  transaction_status, 
	gain_market, gain_actual, after_sell_account_amt)
values
	(@user_id, MONTH(date_sub(now(), interval @day_sub day)), 2020, 
	date_sub(date_sub(now(),interval 15 minute) , interval @day_sub day) , 
	date_sub(date_sub(now(),interval 10 minute) , interval @day_sub day), 
	265, 262, 265.1, 262.1, -3, -3, 
	'ZM', 3, 
	date_sub(date_sub(now(),interval 10 minute) , interval @day_sub day), 
	'COMPLETE', 
	unit_gain_market * units_purchased, unit_gain_actual * units_purchased, 22500 + (5000 * month(date_sub(now(), interval @day_sub day))) +  (100 * DAY(date_sub(now(), interval @day_sub day))));

-- ---------------------------
-- in progress ---------------
-- ---------------------------

insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , 
	buy_price_market, buy_price_actual, 
	stock_symbol, units_purchased , sell_date,  transaction_status)
values
	(@user_id, @month, 2020, date_sub(now(),interval 15 minute), 
	465, 466, 
	'TSLA', 10, curdate(),  'IN PROGRESS');
	
insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , 
	buy_price_market, 
	stock_symbol, units_purchased , sell_date,  transaction_status)
values
	(@user_id, @month, 2020, date_sub(now(),interval 15 minute), 
	45, 
	'AMD', 35, curdate(),  'IN PROGRESS');
	

-- ---------------------------
-- Compute pending -----------
-- ---------------------------

-- compute gain profit with actual buy price ----

insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , sell_datetime , 
	buy_price_market , sell_price_market, buy_price_actual, unit_gain_market, 
	stock_symbol, units_purchased , sell_date,  transaction_status, 
	gain_market)
values
	(@user_id, @month, 2020, date_sub(now(),interval 15 minute), date_sub(now(),interval 10 minute), 
	200, 205, 205.2, 5,
	'NVD', 10, curdate(),  'COMPUTE PENDING', 
	unit_gain_market * units_purchased);

-- compute gain profit with market buy price ----
insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , sell_datetime , 
	buy_price_market , sell_price_market, unit_gain_market, 
	stock_symbol, units_purchased , sell_date,  transaction_status, 
	gain_market)
values
	(@user_id, @month, 2020, date_sub(now(),interval 15 minute), date_sub(now(),interval 10 minute), 
	230, 235, 5, 
	'RING', 7, curdate(),  'COMPUTE PENDING', 
	unit_gain_market * units_purchased);

-- compute loss with actual buy price ----
insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , sell_datetime , 
	buy_price_market , sell_price_market, buy_price_actual, unit_gain_market, 
	stock_symbol, units_purchased , sell_date,  transaction_status, 
	gain_market)
values
	(@user_id, @month, 2020, date_sub(now(),interval 15 minute), date_sub(now(),interval 10 minute), 
	25, 24.5, 25.1, -0.5,
	'WORK', 10, curdate(),  'COMPUTE PENDING', 
	unit_gain_market * units_purchased);

-- compute loss with market buy price ----
insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , sell_datetime , 
	buy_price_market , sell_price_market, unit_gain_market, 
	stock_symbol, units_purchased , sell_date,  transaction_status, 
	gain_market)
values
	(@user_id, @month, 2020, date_sub(now(),interval 15 minute), date_sub(now(),interval 10 minute), 
	30, 29.7, -0.3,
	'MRNA', 4, curdate(),  'COMPUTE PENDING', 
	unit_gain_market * units_purchased);


commit;


------------------
use demo;
select * from Transaction t 
			where date(t.buy_datetime) = curdate() 
			and 
			t.transaction_type='ACTUAL'
			and 
			t.user_id = 6;
		

-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- 30 days Transactions Stats
-- ------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------		
select 
			sum(tr.gain_actual) as net_gain_total,  
				sum(tr.buy_price_actual) as  total_invested,
				count(*) as total_transactions_count,
				sum(CASE WHEN tr.gain_actual>=0 THEN tr.gain_actual ELSE 0 END) as profit_total, 
				sum(CASE WHEN tr.gain_actual<0 THEN tr.gain_actual ELSE 0 END) as loss_total,
				sum(case when tr.gain_actual>=0  then 1 else 0 end) as profit_transactions_count,
				sum(case when tr.gain_actual<0  then 1 else 0 end) as loss_transactions_count,
				sum(case when tr.gain_actual>=0  then tr.buy_price_actual else 0 end) as total_invested_resulting_profit,
				sum(case when tr.gain_actual<0  then tr.buy_price_actual else 0 end) as total_invested_resulting_loss
			 from demo.`transaction` tr 
			 where 
				( tr.month <= MONTH(now()) and
				tr.month >=  MONTH(DATE_SUB(NOW(), INTERVAL 30 DAY))) and
				tr.user_id = 6 and 
				tr.transaction_status = 'COMPLETE' and 
			    tr.buy_datetime BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW();
		
			   

-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- 30 days Transactions Water fall Graph
-- ------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------	   

			 select 
			    sum(tr.gain_actual) as net_gain_total,  
				sum(tr.buy_price_actual) as  total_invested,
				count(*) as total_transactions_count,
				sum(CASE WHEN tr.gain_actual>=0 THEN tr.gain_actual ELSE 0 END) as profit_total, 
				sum(CASE WHEN tr.gain_actual<0 THEN tr.gain_actual ELSE 0 END) as loss_total,
				sum(case when tr.gain_actual>=0  then 1 else 0 end) as profit_transactions_count,
				sum(case when tr.gain_actual<0  then 1 else 0 end) as loss_transactions_count,
				sum(case when tr.gain_actual>=0  then tr.buy_price_actual else 0 end) as total_invested_resulting_profit,
				sum(case when tr.gain_actual<0  then tr.buy_price_actual else 0 end) as total_invested_resulting_loss,
				tr.sell_date
             from demo.`transaction` tr 
			 where 
				( tr.month <= MONTH(now()) and
				tr.month >=  MONTH(DATE_SUB(NOW(), INTERVAL 30 DAY))) and
				tr.user_id = 6 and 
				tr.transaction_status = 'COMPLETE' and 
			    tr.buy_datetime BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW()
			 group by tr.sell_date order by tr.sell_date;

-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- 30 days Transactions Graph Analysis
-- ------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------	   

			
			

			 select 
			    sum(tr.gain_actual) as net_gain_total,  
				sum(tr.buy_price_actual) as  total_invested,
				count(*) as total_transactions_count,
				sum(CASE WHEN tr.gain_actual>=0 THEN tr.gain_actual ELSE 0 END) as profit_total, 
				sum(CASE WHEN tr.gain_actual<0 THEN tr.gain_actual ELSE 0 END) as loss_total,
				sum(case when tr.gain_actual>=0  then 1 else 0 end) as profit_transactions_count,
				sum(case when tr.gain_actual<0  then 1 else 0 end) as loss_transactions_count,
				sum(case when tr.gain_actual>=0  then tr.buy_price_actual else 0 end) as total_invested_resulting_profit,
				sum(case when tr.gain_actual<0  then tr.buy_price_actual else 0 end) as total_invested_resulting_loss,
				tr.sell_date,
				max_after_sell.after_sell_account_amt
             from demo.`transaction` tr 
             join 
               (
               select sub_tr.after_sell_account_amt,  sub_tr.sell_date, max.max_sell_date
               from demo.`transaction` sub_tr  	
			   JOIN 
			      (
			        SELECT MAX(sell_datetime) AS max_sell_date, sell_date 
			        FROM demo.`transaction` sub_tr2
			        where 
			          sub_tr2.transaction_status = 'COMPLETE' and 
			          sub_tr2.month <= MONTH(now()) and
				      sub_tr2.month >= MONTH(DATE_SUB(NOW(), INTERVAL 30 DAY)) and
				      sub_tr2.user_id = 6 and 
			          sub_tr2.buy_datetime BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW()			          
			        GROUP BY sell_date
			      ) max
			     on sub_tr.sell_datetime = max.max_sell_date
			     where 
			       sub_tr.transaction_status = 'COMPLETE' and 
			       sub_tr.month <= MONTH(now()) and
				   sub_tr.month >= MONTH(DATE_SUB(NOW(), INTERVAL 30 DAY)) and
				   sub_tr.user_id = 6 and 
			       sub_tr.buy_datetime BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW()		   
			   ) max_after_sell			   
			 on max_after_sell.sell_date = tr.sell_date 
			 where 
				tr.month <= MONTH(now()) and
				tr.month >=  MONTH(DATE_SUB(NOW(), INTERVAL 30 DAY)) and
				tr.user_id = 6 and 
				tr.transaction_status = 'COMPLETE' and 
			    tr.buy_datetime BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW()
			 group by tr.sell_date order by tr.sell_date;
		     
			
			==================
			
			
			
			select sub_tr. after_sell_account_amt,  sub_tr.sell_date, max.max_sell_date from demo.`transaction` sub_tr  
			   JOIN (SELECT MAX(sell_datetime) AS max_sell_date, sell_date FROM demo.`transaction` where transaction_status = 'COMPLETE'  GROUP BY sell_date) max
			   on sub_tr.sell_datetime = max.max_sell_date ;
			  
			  
			  
			  select sum(tr.gain_actual) as net_gain_total, 	
			  sum(tr.buy_price_actual) as  total_invested,	
			  count(*) as total_transactions_count,	
			  sum(CASE WHEN tr.gain_actual>=0 THEN tr.gain_actual ELSE 0 END) as profit_total,	
			  sum(CASE WHEN tr.gain_actual<0 THEN tr.gain_actual ELSE 0 END) as loss_total,	
			  sum(case when tr.gain_actual>=0  then 1 else 0 end) as profit_transactions_count,	
			  sum(case when tr.gain_actual<0  then 1 else 0 end) as loss_transactions_count, 	
			  sum(case when tr.gain_actual>=0  then tr.buy_price_actual else 0 end) as total_invested_resulting_profit, 	
			  sum(case when tr.gain_actual<0  then tr.buy_price_actual else 0 end) as total_invested_resulting_loss  
			  from demo.`transaction` tr  where 	( tr.month <= MONTH(now()) and	tr.month >=  MONTH(DATE_SUB(NOW(), INTERVAL 30 DAY))) and	
			  tr.user_id = 6 and 	tr.transaction_status = 'COMPLETE' and    tr.buy_datetime BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW()
			  
 
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- 30 days Transactions table
-- ------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------	
select * from Transaction tr 
where 
    tr.month <= MONTH(now()) and
    tr.month >=  MONTH(DATE_SUB(NOW(), INTERVAL 30 DAY)) and
	tr.user_id = 6 and 
	tr.transaction_status = 'COMPLETE' and 
	tr.buy_datetime BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW() limit 50;
			