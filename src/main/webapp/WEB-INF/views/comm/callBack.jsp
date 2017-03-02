<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("GzCVlEJt8xhSJNcmFw_4", "http://192.168.1.24:8091/web/comm/callBack");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {

	console.log(naver_id_login.getProfileData('email'));
	
	
	var email = naver_id_login.getProfileData('email');
	//var email = naver_id_login.getProfileData('nickname');
	var age = naver_id_login.getProfileData('age');
	
	$("#email").val(email);
	$("#age").val(age);
	
	console.log($("#age").val());
	/* 
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('age'));
	 */
	
	
  }
</script>
<div align="center" style='margin-top:150px;'>
<form action="/web/guest/choice" method="post">

<input type="hidden" id="email">
<input type="hidden" id="age">
<select>
	<option value="guest">손님</option>
	<option value="owner">업주</option>
</select>
</br>

가게코드입력</br>
<input type="text"	 name="가게코드 입력"></br>
		<input type="submit" value="submit"><mark color="red">헤헤</mark>
		<canvas ></canvas>
</form>
</div>
</body>
</html>
	