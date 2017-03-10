<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴판</title>
</head>
<body>

	<table style="border-collapse:separate" bordercolor="blue">
		<tr>
			<th>메뉴코드</th>
			<th>메뉴명</th>
			<th>메뉴가격</th>
			<th>메뉴사진 경로</th>
			<th>상점코드</th>
			<th> </th>
		<tr>
		<c:forEach items="${menuList}" var="item">
			<tr>
				<td >${item.menuCode}</td>
				<td>${item.menuName}</td>
				<td>${item.menuPrice}</td>
				<td>${item.menuPicture}</td>
				<td>${item.storeCode}</td>
				<td><a href="">삭제</a></td>
			</tr>
		</c:forEach>

	</table>

</body>
</html>