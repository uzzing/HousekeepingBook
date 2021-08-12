<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가계부 수정</title>

<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
let result = false;
let num = 0;

$(function() {
	getData();
	$("#btn_update").on('click', update);
});


function getData() {
	
	num = $("#moneybook_no").val();
	
	$.ajax({
		url : "selectOne"
		, method  : "GET"
		, data : { "moneybook_no" : num }
		, success : function(res) {
			$("#memo").val(res.moneybook_memo);
			$("#type").val(res.moneybook_type);
			$("#amount").val(res.moneybook_amount);
		}
		, error : function(err) {
			console.log(err);
		}
	});
}


function update() {

	let memo = $("#memo").val();
	let type = $("#type").val();
	let amount = $("#amount").val();

	if (memo.trim().length == 0) {
		alert("메모를 입력해 주세요");
		result = false;
		event.preventDefault();
		return;
	}

	if (amount.trim().length == 0) {
		alert("금액을 입력해 주세요");
		result = false;
		event.preventDefault();
		return;
	}
	
	let data = { "moneybook_no" : num, 
				"moneybook_memo" : memo, 
				"moneybook_type" : type, 
				"moneybook_amount" : amount};
	
	$.ajax({
		url : "updateMoneyBook"
		, method : "POST"
		, data : data
		, success : function(res) {
			alert(res);
			$(location).attr("href", '/listMoneyBook');
		}
		, error : function(err) {
			console.log(err);
		}
	});
}
</script>
</head>

<body>
<h2>[ 가계부 수정 ]</h2>
	<form action="updateMoneyBook" method="post">
		<input type="hidden" id="moneybook_no" value="${moneybook_no}">
		<label>  메모 	<input type="text" id="memo" name="moneybook_memo"></label><br>
		<label>  분류
			<select id="type" name="moneybook_type">
				<option>수입</option>
				<option>지출</option>
			</select>
		</label><br>
		<label>  금액  	<input type="text" id="amount" name="moneybook_amount"></label><br>
		<input type="button" id="btn_update" value="수정하기">
	</form>
</body>
</html>