package com.test.housebook.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.housebook.vo.Account;


@Repository
public class AccountDAO {
	
	@Autowired
	private SqlSession session;

	// receive account info and return 1 or 0
	public int join(Account account) {
		AccountMapper mapper = session.getMapper(AccountMapper.class);
		
		int result = 0 ;
		
		try {
			result = mapper.insertAccount(account);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// receive id and return account
	public Account selectAccount(String acc_id) {
		AccountMapper mapper = session.getMapper(AccountMapper.class);
		Account acc = null;
		
		try {
			acc = mapper.selectAccount(acc_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return acc;
	}
}
