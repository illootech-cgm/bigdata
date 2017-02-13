<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>스프링프레임워크 게시판</title>
</head>
<body>
	<table border="1">
		<colgroup>
			<col width="80">
			<col>
			<col width="115">
			<col width="85">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">사원번호</th>
				<th scope="col">직책</th>
				<th scope="col">사원이름</th>
				<th scope="col">상여금</th>
			</tr>
		</thead>
		<tbody>
			<!-- 목록이 반복될 영역 -->
			<c:forEach var="item" items="${list}" varStatus="status">
				<tr>
					<td><a href="delete?empno=${item.empno}" >${item.empno}</a></td>
					<td>${item.job}</td>
					<td>${item.ename}</td>
					<c:choose>
						<c:when test = "${item.comm == null}">
							<td>0</td>
						</c:when>
						<c:otherwise>
							<td>${item.comm}</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<a href="write">사원추가</a>
	</div>
</body>
</html>

