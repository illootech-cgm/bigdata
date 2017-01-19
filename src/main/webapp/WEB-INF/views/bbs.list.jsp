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
			<col width="60">
			<col>
			<col width="115">
			<col width="85">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">커미션</th>
			</tr>
		</thead>
		<tbody>
			<!-- 목록이 반복될 영역 -->
			<c:forEach var="item" items="${list}" varStatus="status">
				<tr>
					<td>${item.empno}</td>
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
		<a href="./write">쓰기</a>
	</div>
</body>
</html>

