<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>메뉴판</title>
</head>
<body>
<form action="addMenu" method="post">
<table>
<tr><td>상점코드 : <input type="text" id="storeCode" name="storeCode"></td></tr>
<tr><td>메뉴코드 : <input type="text" id="menuCode" name="menuCode"></td></tr>
<tr><td>메뉴명 : <input type="text" id="menuName" name="menuName"></td></tr>
<tr><td>메뉴가격 : <input type="text" id="menuPrice" name="menuPrice"></td></tr>
<tr><td>메뉴사진 : <input type="text" id="menuPicture" name="menuPicture"></td></tr>
</table>
<input type="submit" value="등록하기">
</form>
</body>
</html>


