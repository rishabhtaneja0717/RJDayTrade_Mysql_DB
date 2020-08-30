use demo;
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

set @month = 5;
set @user_id = 6;

select uai.* from user_account_info uai			
where uai.user_id = 6
and 
uai.account_type='ACTUAL';
commit;


-- complete gain --
insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , sell_datetime , 
	buy_price_market , sell_price_market, buy_price_actual , sell_price_actual , unit_gain_market , unit_gain_actual , 
	stock_symbol, units_purchased , transaction_date, transaction_type, transaction_status, 
	gain_market, gain_actual)
values
	(@user_id, @month, 2020, date_sub(now(),interval 15 minute), date_sub(now(),interval 10 minute), 165, 168, 165.1, 167.9, 3, 2.8, 
	'APPL', 10, curdate(), 'ACTUAL', 'COMPLETE', 
	unit_gain_market * units_purchased, unit_gain_actual * units_purchased);

-- complete gain --
insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , sell_datetime , 
	buy_price_market , sell_price_market, buy_price_actual , sell_price_actual, unit_gain_market, unit_gain_actual, 
	stock_symbol, units_purchased , transaction_date, transaction_type, transaction_status, 
	gain_market, gain_actual)
values
	(@user_id, @month, 2020, date_sub(now(),interval 15 minute), date_sub(now(),interval 10 minute), 
	265, 268, 265.1, 267.9, 3, 2.8, 
	'BABA', 10, curdate(), 'ACTUAL', 'COMPLETE', 
	unit_gain_market * units_purchased, unit_gain_actual * units_purchased);

-- complete loss --
insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , sell_datetime , 
	buy_price_market , sell_price_market, buy_price_actual , sell_price_actual , unit_gain_market, unit_gain_actual, 
	stock_symbol, units_purchased , transaction_date, transaction_type, transaction_status, 
	gain_market, gain_actual)
values
	(@user_id, @month, 2020, date_sub(now(),interval 15 minute), 
	date_sub(now(),interval 10 minute), 265, 262, 265.1, 262.1, -3, -3, 
	'ZM', 3, curdate(), 'ACTUAL', 'COMPLETE', 
	unit_gain_market * units_purchased, unit_gain_actual * units_purchased);

-- ---------------------------
-- in progress ---------------
-- ---------------------------

insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , 
	buy_price_market, buy_price_actual, 
	stock_symbol, units_purchased , transaction_date, transaction_type, transaction_status)
values
	(@user_id, @month, 2020, date_sub(now(),interval 15 minute), 
	465, 466, 
	'TSLA', 10, curdate(), 'ACTUAL', 'IN PROGRESS');
	
insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , 
	buy_price_market, 
	stock_symbol, units_purchased , transaction_date, transaction_type, transaction_status)
values
	(@user_id, @month, 2020, date_sub(now(),interval 15 minute), 
	45, 
	'AMD', 35, curdate(), 'ACTUAL', 'IN PROGRESS');
	

-- ---------------------------
-- Compute pending -----------
-- ---------------------------

-- compute gain profit with actual buy price ----

insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , sell_datetime , 
	buy_price_market , sell_price_market, buy_price_actual, unit_gain_market, 
	stock_symbol, units_purchased , transaction_date, transaction_type, transaction_status, 
	gain_market)
values
	(@user_id, @month, 2020, date_sub(now(),interval 15 minute), date_sub(now(),interval 10 minute), 
	200, 205, 205.2, 5,
	'NVD', 10, curdate(), 'ACTUAL', 'COMPUTE PENDING', 
	unit_gain_market * units_purchased);

-- compute gain profit with market buy price ----
insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , sell_datetime , 
	buy_price_market , sell_price_market, unit_gain_market, 
	stock_symbol, units_purchased , transaction_date, transaction_type, transaction_status, 
	gain_market)
values
	(@user_id, @month, 2020, date_sub(now(),interval 15 minute), date_sub(now(),interval 10 minute), 
	230, 235, 5, 
	'RING', 7, curdate(), 'ACTUAL', 'COMPUTE PENDING', 
	unit_gain_market * units_purchased);

-- compute loss with actual buy price ----
insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , sell_datetime , 
	buy_price_market , sell_price_market, buy_price_actual, unit_gain_market, 
	stock_symbol, units_purchased , transaction_date, transaction_type, transaction_status, 
	gain_market)
values
	(@user_id, @month, 2020, date_sub(now(),interval 15 minute), date_sub(now(),interval 10 minute), 
	25, 24.5, 25.1, -0.5,
	'WORK', 10, curdate(), 'ACTUAL', 'COMPUTE PENDING', 
	unit_gain_market * units_purchased);

-- compute loss with market buy price ----
insert into demo.`transaction` 
	(user_id , `month` , `year` , buy_datetime , sell_datetime , 
	buy_price_market , sell_price_market, unit_gain_market, 
	stock_symbol, units_purchased , transaction_date, transaction_type, transaction_status, 
	gain_market)
values
	(@user_id, @month, 2020, date_sub(now(),interval 15 minute), date_sub(now(),interval 10 minute), 
	30, 29.7, -0.3,
	'MRNA', 4, curdate(), 'ACTUAL', 'COMPUTE PENDING', 
	unit_gain_market * units_purchased);


commit;
