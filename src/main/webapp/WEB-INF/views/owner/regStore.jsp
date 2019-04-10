<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="screen" href="http://trirand.com/blog/jqgrid/themes/redmond/jquery-ui-1.8.1.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="http://trirand.com/blog/jqgrid/themes/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen" href="http://trirand.com/blog/jqgrid/themes/ui.multiselect.css" />
 
 <!-- // jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />


<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>

<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->


<!-- <script src="http://trirand.com/blog/jqgrid/js/jquery.js" type="text/javascript"></script> -->
<script src="http://trirand.com/blog/jqgrid/js/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script src="http://trirand.com/blog/jqgrid/js/jquery.layout.js" type="text/javascript"></script>
<script src="http://trirand.com/blog/jqgrid/js/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="http://trirand.com/blog/jqgrid/js/ui.multiselect.js" type="text/javascript"></script>
<script src="http://trirand.com/blog/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="http://trirand.com/blog/jqgrid/js/jquery.tablednd.js" type="text/javascript"></script>
<script src="http://trirand.com/blog/jqgrid/js/jquery.contextmenu.js" type="text/javascript"></script>

<script type="text/javascript">
$(function() {
	  $( "#buy_dt" ).datepicker({
	         dayNames: ['일요일','월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ],
	         dayNamesMin: ['일','월', '화', '수', '목', '금', '토' ], 
	         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	        changeMonth: true, 
	         changeYear: true,
	         showButtonPanel: true, 
	         currentText: '오늘 날짜', 
	         closeText: '닫기', 
	         dateFormat: "yymmdd",
	         nextText: '다음 달',
	         prevText: '이전 달'
	  });
	  
});
</script>
<title>회원추가</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<br><hr><br>
<a href="/web/owner/regStore">회원추가</a>
<!-- <a href="/web/home">회원조회</a> -->
<a href="/web/comm/main">메인화면</a>
<!-- <a href="/web/owner/menuList">메뉴리스트</a> -->
<br><hr><br>
<span>등록하기</span><br><br>
<form action="regStore" method="post">
<span>*학생정보</span>
<table>
<tr><td>학생명 : <input type="text" id="cstnm" name="cstnm"></td></tr>
<tr><td>학생구분 : 
<select name ="cst_dvcd" id = "cst_dvcd"> 
                        <option value="지게차">지게차</option> 
                        <option value="굴삭기">굴삭기</option> 
                    </select> 
</td></tr>
<tr><td>주민번호 : <input type="number"    id="idno" name="idno" size="13" maxlength="13"></td></tr>
<tr><td>주소 : <input type="text" id="addr" name="addr" style="width:500px;"></td></tr>
<tr><td>연락처 : <input type="number" id="cst_phn_no" name="cst_phn_no"  size="11" maxlength="11"></td></tr>
<tr><td>핸드폰 : <input type="number" id="cst_celphn_no" name="cst_celphn_no" size="11" maxlength="11"></td></tr>

</table>

<span>*결재정보</span>
<table>
<tr><td>결재일자 : <input type="text" id="buy_dt" name="buy_dt" ></td></tr>
<!-- <tr><td>학생구분 :  -->
<!-- <select name ="cst_dvcd" id = "cst_dvcd">  -->
<!--                         <option value="지게차">지게차</option>  -->
<!--                         <option value="굴삭기">굴삭기</option>  -->
<!--                     </select>  -->
<!-- </td></tr> -->
<tr><td>결재금액 : <input type="number"    id="buy_amt" name="buy_amt"></td></tr>
<tr><td>결재방법 : <input type="text" id="buy_dvcd" name="buy_dvcd" width = "300px"></td></tr>

</table>

<input type="submit" value="등록하기">
</form>
<!-- <br><hr><br> -->
<!-- <span>수정하기</span><br><br> -->
<!-- <form action="uptStore" method="post"> -->
<!-- <span>*학생정보</span> -->
<!-- <table> -->
<!-- <tr><td>*학생번호(필수) : <input type="text" id="cstno" name="cstno"></td></tr> -->
<!-- <tr><td>학생명 : <input type="text" id="cstnm" name="cstnm"></td></tr> -->
<!-- <tr><td>학생구분 :  -->
<!-- <select name ="cst_dvcd" id = "cst_dvcd">  -->
<!--                         <option value="지게차">지게차</option>  -->
<!--                         <option value="굴삭기">굴삭기</option>  -->
<!--                     </select>  -->
<!-- </td></tr> -->
<!-- <tr><td>주민번호 : <input type="number"    id="idno" name="idno" size="13" maxlength="13"></td></tr> -->
<!-- <tr><td>주소 : <input type="text" id="addr" name="addr" style="width:500px;"></td></tr> -->
<!-- <tr><td>연락처 : <input type="number" id="cst_phn_no" name="cst_phn_no"  size="11" maxlength="11"></td></tr> -->
<!-- <tr><td>핸드폰 : <input type="number" id="cst_celphn_no" name="cst_celphn_no" size="11" maxlength="11"></td></tr> -->

<!-- </table> -->

<!-- <span>*결재정보</span> -->
<!-- <table> -->
<!-- <tr><td>결재일자 : <input type="text" id="buy_dt" name="buy_dt" ></td></tr> -->
<!-- <tr><td>학생구분 :  -->
<!-- <select name ="cst_dvcd" id = "cst_dvcd">  -->
<!--                         <option value="지게차">지게차</option>  -->
<!--                         <option value="굴삭기">굴삭기</option>  -->
<!--                     </select>  -->
<!-- </td></tr> -->
<!-- <tr><td>결재금액 : <input type="number"    id="buy_amt" name="buy_amt"></td></tr> -->
<!-- <tr><td>결재방법 : <input type="text" id="buy_dvcd" name="buy_dvcd" width = "300px"></td></tr> -->

<!-- </table> -->

<!-- <input type="submit" value="수정하기"> -->
<!-- </form> -->

</body>
</html>
