package com.test.housebook.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.housebook.dao.MoneyBookDAO;
import com.test.housebook.vo.MoneyBook;

@Service
public class MoneyBookService {
	
	@Autowired
	private MoneyBookDAO dao;
	
	@Autowired
	private HttpSession session;
	
	public String insertMoneyBook(MoneyBook moneybook) {
		
		String path = "";
		int result = dao.insertMoneyBook(moneybook);
		
		if (result > 0) {
			path = "redirect:/listMoneyBook";
		} 
		else {
			path = "redirect:/writeMoneyBook";
		}
		
		return path;
	}
	
	public List<MoneyBook> selectAll(HashMap<String, String> search) {
		
		return dao.selectAll(search);
	}
	
	public MoneyBook selectOne(int moneybook_no) {
		
		return dao.selectOne(moneybook_no);
	}
	
	public String updateMoneyBook(MoneyBook moneybook) {
		
		String message = "";

		int result = dao.updateMoneyBook(moneybook);

		if (result > 0) {
			message = "Success";
		} else {
			message = "Failed";
		}

		return message;
	}
	
	public String deleteMoneyBook(int moneybook_no) {
		
		String message = "";
		
		int result = dao.deleteMoneyBook(moneybook_no);
		
		if (result > 0) {
			message = "Success";
		} else {
			message = "Failed";
		}
		
		return message;
	}
	
	public int selectSumIncome(String acc_id) {
		
		return dao.selectSumIncome(acc_id);
	}
	
	public int selectSumOutcome(String acc_id) {
		
		return dao.selectSumOutcome(acc_id);
	}
	
	public int selectMinAmount(String acc_id) {
	
		return dao.selectMinAmount(acc_id);
	}
	
	public int selectMaxAmount(String acc_id) {
	
		return dao.selectMaxAmount(acc_id);
	}

}
