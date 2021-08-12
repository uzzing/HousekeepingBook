<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript">

function formCheck(){
	var acc_id = document.getElementById("acc_id").value;
	var acc_pw = document.getElementById("acc_pw").value;
	var pwCheck = document.getElementById("pwCheck").value;
	var acc_nm = document.getElementById("acc_nm").value;
	
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
	else if (acc_pw != pwCheck) {
		alert("동일한 비밀번호를 입력해 주세요");
		return false;
	}
	
	if (acc_nm == ""){
		alert("이름을 입력해 주세요");
		return false;
	}
	
	return true;
}
</script>
</head>

<body>
	<h2>[ 회원가입 ]</h2>
	<form action="join" method="post" onsubmit="return formCheck();">
		<label>아이디      <input type="text" id="acc_id" name="acc_id">	  </label><br>
		<label>비밀번호	 <input type="password" id="acc_pw" name="acc_pw"></label><br>
		<label>비밀번호 확인 <input type="password" id="pwCheck">			  </label><br>
		<label>이름		  <input type="text" id="acc_nm" name="acc_nm">   </label><br>
		<input type="submit" value="가입하기">
	</form>
</body>
</html>