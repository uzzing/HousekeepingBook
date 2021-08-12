package com.test.housebook.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.housebook.service.MoneyBookService;
import com.test.housebook.vo.MoneyBook;

@Controller
public class MoneyBookController {

	@Autowired
	private MoneyBookService service;

	// create
	@RequestMapping(value = "/writeMoneyBook", method = RequestMethod.GET)
	public String writeMoneyBook() {
		return "moneybook/write";
	}

	@RequestMapping(value = "/writeMoneyBook", method = RequestMethod.POST)
	public String writeMoneyBook(MoneyBook moneybook) {
		return service.insertMoneyBook(moneybook);
	}

	// read
	@RequestMapping(value = "/listMoneyBook", method = RequestMethod.GET)
	public String listMoneyBook() {
		return "moneybook/list";
	}

	// read - ajax
	@RequestMapping("/selectAll")
	@ResponseBody
	public List<MoneyBook> selectAll(String acc_id, String searchItem, String searchWord) {

		HashMap<String, String> search = new HashMap<String, String>();
		search.put("acc_id", acc_id);
		search.put("searchItem", searchItem);
		search.put("searchWord", searchWord);

		System.out.println("search map : " + search);

		return service.selectAll(search);
	}

	// update
	@RequestMapping(value = "/updateMoneyBook", method = RequestMethod.GET)
	public String updateMoneyBook(int moneybook_no, Model model) {
		model.addAttribute("moneybook_no", moneybook_no);
		return "moneybook/update";
	}

	// get data for update - ajax
	@RequestMapping("/selectOne")
	@ResponseBody
	public MoneyBook selectOne(int moneybook_no) {

		return service.selectOne(moneybook_no);
	}

	// update - ajax
	@RequestMapping(value = "/updateMoneyBook", method = RequestMethod.POST)
	@ResponseBody
	public String updateMoneyBook(MoneyBook moneybook) {

		// message
		return service.updateMoneyBook(moneybook);
	}
	
	// delete - ajax
	@RequestMapping("/deleteMoneyBook")
	@ResponseBody
	public String deleteMoneyBook(int moneybook_no) {

		// message
		return service.deleteMoneyBook(moneybook_no);
	}

	// read
	// ajax
	@RequestMapping("/selectSumIncome")
	@ResponseBody
	public int selectSumIncome(String acc_id) {

		return service.selectSumIncome(acc_id);
	}

	// ajax
	@RequestMapping("/selectSumOutcome")
	@ResponseBody
	public int selectSumOutcome(String acc_id) {

		return service.selectSumOutcome(acc_id);
	}

	// ajax
	@RequestMapping("/selectMinAmount")
	@ResponseBody
	public int selectMinAmount(String acc_id) {

		return service.selectMinAmount(acc_id);
	}

	// ajax
	@RequestMapping("/selectMaxAmount")
	@ResponseBody
	public int selectMaxAmount(String acc_id) {

		return service.selectMaxAmount(acc_id);
	}
}
