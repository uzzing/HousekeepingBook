package com.test.housebook.dao;

import java.util.HashMap;
import java.util.List;

import com.test.housebook.vo.MoneyBook;

public interface MoneyBookMapper {
	
	// create
	public int insertMoneyBook(MoneyBook moneybook);
	
	// read
	public List<MoneyBook> selectAll(HashMap<String, String> search);
	public MoneyBook selectOne(int moneybook_no);
	public Integer selectSumIncome(String acc_id);
	public Integer selectSumOutcome(String acc_id);
	public Integer selectMinAmount(String acc_id);
	public Integer selectMaxAmount(String acc_id);
	
	// update
	public int updateMoneyBook(MoneyBook moneybook);
	
	// delete
	public int deleteMoneyBook(int moneybook_no);
}
