package com.test.housebook.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.housebook.vo.MoneyBook;

@Repository
public class MoneyBookDAO {
	
	@Autowired
	private SqlSession session;
	
	public int insertMoneyBook(MoneyBook moneybook) {
		
		MoneyBookMapper mapper = session.getMapper(MoneyBookMapper.class);
		
		int result = 0 ;
		
		try {
			result = mapper.insertMoneyBook(moneybook);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<MoneyBook> selectAll(HashMap<String, String> search) {
		
		MoneyBookMapper mapper = session.getMapper(MoneyBookMapper.class);
		
		List<MoneyBook> list = null;
		
		try {
			list = mapper.selectAll(search);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// for update
	public MoneyBook selectOne(int moneybook_no) {
		
		MoneyBookMapper mapper = session.getMapper(MoneyBookMapper.class);
		
		MoneyBook moneybook = null;
		
		try {
			moneybook = mapper.selectOne(moneybook_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return moneybook;
		
	}
	
	public int updateMoneyBook(MoneyBook moneybook) {
		
		MoneyBookMapper mapper = session.getMapper(MoneyBookMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.updateMoneyBook(moneybook);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deleteMoneyBook(int moneybook_no) {
		
		MoneyBookMapper mapper = session.getMapper(MoneyBookMapper.class);
		
		int result = 0;
		
		try {
			result = mapper.deleteMoneyBook(moneybook_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int selectSumIncome(String acc_id) {
		
		MoneyBookMapper mapper = session.getMapper(MoneyBookMapper.class);
		
		Integer result = 0;
		
		try {
			result = mapper.selectSumIncome(acc_id);
			if (result == null) result = 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int selectSumOutcome(String acc_id) {
		
		MoneyBookMapper mapper = session.getMapper(MoneyBookMapper.class);
		
		Integer result = 0;
		
		try {
			result = mapper.selectSumOutcome(acc_id);
			if (result == null) result = 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int selectMinAmount(String acc_id) {
		
		MoneyBookMapper mapper = session.getMapper(MoneyBookMapper.class);
		
		Integer result = 0;
		
		try {
			result = mapper.selectMinAmount(acc_id);
			if (result == null) result = 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int selectMaxAmount(String acc_id) {
		
		MoneyBookMapper mapper = session.getMapper(MoneyBookMapper.class);
		
		Integer result = 0;
		
		try {
			result = mapper.selectMaxAmount(acc_id);
			if (result == null) result = 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
