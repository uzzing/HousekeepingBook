package com.test.housebook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.housebook.service.AccountService;
import com.test.housebook.vo.Account;

@Controller
public class AccountController {
	
	@Autowired
	private AccountService service;
	
	// join account
	@RequestMapping(value="/join" , method = RequestMethod.GET)
	public String join() {
		return "account/joinForm";
	}
	
	@RequestMapping(value="/join" , method = RequestMethod.POST)
	public String join(Account account) {
		return service.join(account);
	}
	
	// login
	@RequestMapping(value="/login" , method = RequestMethod.GET)
	public String loginForm() {
		return "account/loginForm";
	}
	
	@RequestMapping(value="/login" , method = RequestMethod.POST)
	public String login(Account account) {
		return service.login(account);
	}
	
	// logout
	@RequestMapping(value="/logout" , method = RequestMethod.GET)
	public String logout() {
		return service.logout();
	}
}
