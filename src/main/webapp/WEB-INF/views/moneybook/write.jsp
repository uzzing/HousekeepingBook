<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가계부 등록</title>

<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
let result = false;

$(function() {
	$("#btn_submit").on('click', check);
});

function check() {

	let memo = $("#memo").val();
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
	
	if (result = true) {
		$("form").submit();
	}
}
</script>
</head>

<body>
	<h2>[ 가계부 입력 ]</h2>
	<form action="writeMoneyBook" method="post">
		<input type="hidden" id="acc_id" name="acc_id" value="${sessionScope.loginId}">
		<label>  메모 	<input type="text" id="memo" name="moneybook_memo"></label><br>
		<label>  분류
			<select name="moneybook_type">
				<option>수입</option>
				<option>지출</option>
			</select>
		</label><br>
		<label>  금액  	<input type="text" id="amount" name="moneybook_amount"></label><br>
		<input type="submit" id="btn_submit" value="입력하기">
	</form>
</body>
</html>