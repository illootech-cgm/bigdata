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
			<span>사원번호 </span> <input type="text" id="empno" name="empno" value="" />
		</div>
		<div>
			<span>job </span> <input type="text" id="job" name="job" value="" />
		</div>
		<div>
			<span>이름</span> <input type="text" id="ename" name="ename" value="" />
		</div>
		<div>
			<span>커미션</span> <input type="text" id="comm" name="comm" />
		</div>
		<input type="submit" value="저장" />
	</form>
	<div>
		<a href="list">목록</a>
	</div>
</body>
</html>
