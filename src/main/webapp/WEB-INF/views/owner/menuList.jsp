<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table>
		<tr>
			<td>메뉴코드</td>
			<td>메뉴명</td>
			<td>메뉴가격</td>
			<td>메뉴사진 경로</td>
			<td>상점코드</td>
		</tr>
		<c:forEach items="${menuList}" var="item">
			<tr>
				<td>${item.menuCode}</td>
				<td>${item.menuName}</td>
				<td>${item.menuPrice}</td>
				<td>${item.menuPicture}</td>
				<td>${item.storeCode}</td>
			</tr>
		</c:forEach>

	</table>


</body>
</html>