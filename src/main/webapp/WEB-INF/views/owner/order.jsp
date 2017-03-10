<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메뉴판</title>
</head>
<body>
<div align="left" class="storeName" >
	돈치킨
</div>
<p>좌석을 선택하세요.</p>
<div style=float:left>
	<img src="../resources/images/menu.png" height="50px" width="100px"><br>
	<table>	
	<tr><td><a>치킨</a></td></tr>
	<tr><td><a>피자</a></td></tr>
	<tr><td><a>안주</a></td></tr>
	<tr><td><a>세트</a></td></tr>
	</table>
</div>

<div class="table" align="center"  style="float:left;padding:0px 100px;border-bottom:1px;">
	
	<img src="../resources/images/Koala.jpg" height="100px" width="100px">
	<img src="../resources/images/Hydrangeas.jpg" height="100px" width="100px">
	<img src="../resources/images/Desert.jpg" height="100px" width="100px">
	<img src="../resources/images/Jellyfish.jpg" height="100px" width="100px">
	<img src="../resources/images/Tulips.jpg" height="100px" width="100px"><br>
	<img src="../resources/images/Koala.jpg" height="100px" width="100px">
	<img src="../resources/images/Hydrangeas.jpg" height="100px" width="100px">
	<img src="../resources/images/Desert.jpg" height="100px" width="100px">
	<img src="../resources/images/Jellyfish.jpg" height="100px" width="100px">
	<img src="../resources/images/Tulips.jpg" height="100px" width="100px"><br>
	
</div>

<div class="orderList" style=float:right>
	<p>주문목록</p>
	<img src="../resources/images/Koala.jpg" height="100px" width="100px"><br>
	<img src="../resources/images/Hydrangeas.jpg" height="100px" width="100px"><br>
	<img src="../resources/images/Desert.jpg" height="100px" width="100px"><br>
	<img src="../resources/images/Jellyfish.jpg" height="100px" width="100px"><br>
	
</div>
<div align="center" style=clear:both>
<input type="button" align="middle" value="주문하기" >
</div>

</body>
</html>