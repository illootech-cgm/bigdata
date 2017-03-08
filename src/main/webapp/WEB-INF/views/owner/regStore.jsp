<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메뉴판</title>
</head>
<body>
<form action="regStore" method="post">
<table>
<tr><td>상점코드 : <input type="text" id="storeCode" name="storeCode"></td></tr>
<tr><td>상점위치 : <input type="text" id="storeLoc" name="storeLoc"></td></tr>
<tr><td>상점명 : <input type="text"    id="storeName" name="storeName"></td></tr>
<tr><td>등록일 : <input type="text" id="regdate" name="regdate"></td></tr>
<tr><td>상점ID : <input type="text" id="ownerId" name="ownerId"></td></tr>
</table>
<input type="submit" value="등록하기">
</form>
</body>
</html>
