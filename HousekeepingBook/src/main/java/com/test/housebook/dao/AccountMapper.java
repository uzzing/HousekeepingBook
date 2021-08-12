package com.test.housebook.dao;

import com.test.housebook.vo.Account;

public interface AccountMapper {

	public int insertAccount(Account account);
	
	public Account selectAccount(String acc_id);

}
