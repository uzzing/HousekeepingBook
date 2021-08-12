<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가계부</title>

<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
let acc_id = "";

$(function() {
	getList();
	
	$("#btn_write").on("click", goToWrite);
	$("#btn_search").on("click", search);
	
	$("#btn_sumIncome").on("click", getSumIncome);
	$("#btn_sumOutcome").on("click", getSumOutcome);
	$("#btn_minAmount").on("click", getMinAmount);
	$("#btn_maxAmount").on("click", getMaxAmount);
});


function search() {
	
	let searchWord = $("#searchWord").val();
	if (searchWord.trim().length == 0) {
		alert("검색어를 입력해 주세요");
		return;
	}
	
	$(".listTr").remove();
	
	getList();
}

function getList() {
	
	acc_id = $("#acc_id").val();
	let searchItem = $("#searchItem>option:selected").val();
	let searchWord = $("#searchWord").val();
	
	let searchData = { "acc_id" : acc_id,
						"searchItem" : searchItem,
						"searchWord" : searchWord };
	$.ajax({
		url : "selectAll"
		, method  : "GET"
		, data : searchData
		, success : output
		, error : function(err) {
			console.log(err);
		}
	});
}

function output(res) {
	
	let result = '';
	
	if (res.length == 0) {
		result += '<tr class="listTr">'
		result += '	<td colspan="7">등록된 데이터가 없습니다.</td>'
		result += '</tr>'
		$("#list").append(result);
	} 
	else {
		
		$.each(res, function(index, item){
			result += '<tr class="listTr">'
			result += ' <td class="num">'+ item.moneybook_no +'</td>'
			result += '	<td class="memo">'+ item.moneybook_memo +'</td>'
			result += '	<td class="type">'+ item.moneybook_type +'</td>'
			result += '	<td class="amount">'+ item.moneybook_amount +'</td>'
			result += '	<td class="indate">'+ item.moneybook_indate +'</td>'
			result += '	<td><input type="button" class="updatebtn" data-num="'+ item.moneybook_no +'"  value="수정"></td>'
			result += '	<td><input type="button" class="delbtn"    data-num="'+ item.moneybook_no +'"  value="삭제"></td>'
			result += '</tr>'
		});

		$("#list").append(result);
		
		$(".updatebtn").on('click', updateMoneyBook);
		$(".delbtn").on('click', deleteMoneyBook);
	}
}

function updateMoneyBook() {
	
	let num = $(this).attr('data-num');
	
	$(location).attr("href", "/updateMoneyBook?moneybook_no=" + num);
}

function deleteMoneyBook() {
	
	let num = $(this).attr('data-num');
	
	$.ajax({
		url : "deleteMoneyBook"
		, method  : "GET"
		, data : { "moneybook_no" : num }
		, success : function(res) {
			alert(res);
			$(".listTr").remove();
			getList();
		}
		, error : function(err) {
			console.log(err);
		}
	});
}


function goToWrite() {
	$(location).attr("href", "/writeMoneyBook");
}

function getSumIncome() {
	
	$.ajax({
		url : "selectSumIncome"
		, method  : "GET"
		, data : { "acc_id" : acc_id }
		, success : function(res) {
			$("#result1").val(res);
		}
		, error : function(err) {
			console.log(err);
		}
	});
}

function getSumOutcome() {
	
	$.ajax({
		url : "selectSumOutcome"
		, method  : "GET"
		, data : { "acc_id" : acc_id }
		, success : function(res) {
			$("#result1").val(res);
		}
		, error : function(err) {
			console.log(err);
		}
	});
}

function getMinAmount() {
	
	$.ajax({
		url : "selectMinAmount"
		, method  : "GET"
		, data : { "acc_id" : acc_id }
		, success : function(res) {
			$("#result2").val(res);
		}
		, error : function(err) {
			console.log(err);
		}
	});
}

function getMaxAmount() {
	
	$.ajax({
		url : "selectMaxAmount"
		, method  : "GET"
		, data : { "acc_id" : acc_id }
		, success : function(res) {
			$("#result2").val(res);
		}
		, error : function(err) {
			console.log(err);
		}
	});
}
</script>
</head>
<body>
	<h2>[ 가계부 ]</h2>
	<input type="hidden" id="acc_id" value="${sessionScope.loginId}">
	<table border = "1" id="list">
		<tr>
			<th>번호</th>
			<th>메모</th>
			<th>종류</th>
			<th>금액</th>
			<th>작성일</th>
			<th></th>
			<th></th>
		</tr>
	</table>
	<br>
	<input type="button" id="btn_write" value="가계부 작성">
	<br>
	<form id="searchAll" method="GET">
		<select id="searchItem">
			<option value="type_all"  ${searchItem=='type_all' ? 'selected' : ''}>전체</option>
			<option value="type_income"  ${searchItem=='type_income' ? 'selected' : ''}>수입</option>
			<option value="type_outcome"   ${searchItem=='type_outcome'  ? 'selected' : ''}>지출</option>
		</select>
		<input type="text" id="searchWord" value="${searchWord}">
		<input type="button" id="btn_search" value="Search">
	</form>
	<br>
	<input type="button" id="btn_sumIncome" value="총 수입 구하기"> &nbsp;
	<input type="button" id="btn_sumOutcome" value="총 지출 구하기"> &nbsp;
	<input type="text" id="result1" placeholder="총 수입 또는 지출">
	<br>
	<input type="button" id="btn_minAmount" value="최소 금액 구하기"> &nbsp;
	<input type="button" id="btn_maxAmount" value="최대 금액 구하기"> &nbsp;
	<input type="text" id="result2" placeholder="최소 또는 최대 금액">
</body>
</html>