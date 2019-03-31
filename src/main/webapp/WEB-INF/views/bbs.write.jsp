<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>스프링프레임워크 게시판</title>
</head>
<body>
	<form id="emp" method="post" action="insert" >
		<div>
			<span>학생명 </span> <input type="text" id="cstno" name="cstno" value="" />
		</div>
		<div>
			<span>학생구분 </span> <input type="text" id="cst_dvcd" name="cst_dvcd" value="" />
		</div>
		<div>
			<span>주민번호</span> <input type="text" id="idno" name="idno" value="" />
		</div>
		<div>
			<span>주소</span> <input type="text" id="addr" name="addr" />
		</div>
		<div>
			<span>연락처</span> <input type="text" id="cst_phn_no1" name="cst_phn_no1" />-
								<input type="text" id="cst_phn_no2" name="cst_phn_no2" />-
								<input type="text" id="cst_phn_no3" name="cst_phn_no3" />	
			
		</div>
		<div>
			<span>핸드폰</span> <input type="text" id="cst_celphn_no1" name="cst_celphn_no1" width="120px"/>-
								<input type="text" id="cst_celphn_no2" name="cst_celphn_no2" />-
								<input type="text" id="cst_celphn_no3" name="cst_celphn_no3" />	
			
		</div>
		<input type="submit" value="저장" />
	</form>
	<div>
		<a href="list">목록</a>
	</div>
</body>
</html>
