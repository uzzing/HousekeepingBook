
-- create
CREATE TABLE account_tb (
	acc_id varchar2(30) primary key
	, acc_nm varchar2(30) not null
	, acc_pw varchar2(30) not null
);


CREATE TABLE moneybook_tb
(
	moneybook_no number primary key
	, acc_id varchar2(30) not null references account_tb(acc_id)
	, moneybook_memo varchar2(1000) not null
	, moneybook_type varchar2(20) not null
	, moneybook_amount number default 0
	, moneybook_indate date default sysdate
);

CREATE SEQUENCE moneybook_tb_seq;

-- drop
DROP TABLE account_tb;
DROP TABLE moneybook_tb;

DROP SEQUENCE moneybook_tb_seq;