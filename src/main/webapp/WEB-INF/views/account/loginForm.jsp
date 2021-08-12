<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script type="text/javascript">
function formCheck(){
	var acc_id = document.getElementById("acc_id").value;
	var acc_pw = document.getElementById("acc_pw").value;
	
	if (acc_id == "") {
		alert("아이디를 입력해 주세요");
		return false;
	}
	else if (acc_id.length < 3 || acc_id.length > 8) {
		alert("아이디는 3~8글자로 입력해 주세요");
		return false;
	}
	
	if (acc_pw == "") {
		alert("비밀번호를 입력해 주세요");
		return false;
	}
	else if (acc_pw.length < 5 || acc_pw.length > 10) {
		alert("비밀번호는 5~10글자로 입력해 주세요");
		return false;
	}
	
	return true;
}
</script>
</head>

<body>
	<h2>[ 로그인 ]</h2>
	<form action="login" method="post" onsubmit="return formCheck();">
		<label>아이디 <input type="text" id="acc_id" name="acc_id"></label><br>
		<label>비밀번호 <input type="password" id="acc_pw" name="acc_pw"></label><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>