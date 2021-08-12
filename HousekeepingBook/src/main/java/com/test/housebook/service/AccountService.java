package com.test.housebook.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.housebook.dao.AccountDAO;
import com.test.housebook.vo.Account;

@Service
public class AccountService {
	
	@Autowired
	private AccountDAO dao;
	
	@Autowired
	private HttpSession session;
	
	public String join(Account account) {
		String path = "";
		int result = dao.join(account);
		
		if (result > 0) {
			path = "redirect:/login";
		} 
		else {
			path = "redirect:/join";
		}
		
		return path;
	}
	
	public String login(Account inputData) {
		
		String path = "";

		Account searchData = dao.selectAccount(inputData.getAcc_id());

		if (searchData == null) {
			path = "redirect:/login";
		} 
		else {
			if (inputData.getAcc_pw().equals(searchData.getAcc_pw())) {
				session.setAttribute("loginId", searchData.getAcc_id());
				path = "redirect:/";
			} 
			else {
				path = "redirect:/login";
			}
		}
		
		return path;
	}
	
	
	public String logout() {
		session.removeAttribute("loginId");
		return "redirect:/";
	}

}
