<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리</title>
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
$(document).ready(function() {
    $("#search").on("click",function(){
    	info2($("#schd_dt").val(),$("#iedu_subject").val());
    	return;
//     	jQuery("#grid").jqGrid("clearGridData", true);
//     	jQuery("#grid").setGridParam({
//       	 datatype	: "json",
//       	 postData	: {schd_dt : $("#schd_dt").val()},
//       	 loadComplete	: function(data) {
//       		 console.log(data);
//       	 }
//        }).trigger("reloadGrid");
  });
  
});

function info2(schd_dt,iedu_subject){

jQuery("#popup").jqGrid("GridUnload");
	jQuery("#popup").jqGrid({
        url : "/web/view?schd_dt="+schd_dt+"&edu_subject="+iedu_subject,
        caption : '수강내역',    // caption : 그리드의 제목을 지정한다.
        datatype : 'json',               // datatype : 데이터 타입을 지정한다.
        mtype : 'post',
        height : '150px',                 // height : 그리드의 높이를 지정한다.
        colModel : [
                    { name : 'edu_dt',             index : 'edu_dt',                width : 100, height:80,       align : 'center', label:"교육일자"},
                    { name : 'edu_strt_tm',       index : 'edu_strt_tm',            width : 100, height:80,   align : 'center' , label:"교육시작시간" },
                    { name : 'edu_end_tm',                index : 'edu_end_tm',                width : 100,  height:80,  align : 'center', label:"교육종료시간" },
                    { name : 'edu_subject',           index : 'edu_subject',            width : 200, height:80,   align : 'center' , label:"차종" },
                    { name : 'lssn_attnd_tm',           index : 'lssn_attnd_tm',            width : 200, height:80,   align : 'center' , label:"교육이수시간"},
                      { name : 'lssn_attnd_yn',          index : 'lssn_attnd_yn',            width : 200, height:80,   align : 'center' , label:"교육이수여부"  },
//                     { name : 'deptno',        index : 'deptno',            width : 200, height:50,  hidden :true ,align : 'center'  , label:"부서 번호" }
                    ]
    }).navGrid('#pager', {
        search : true,
        edit : true,
        add : true,
        del : true
    });
}


$(function() {
	  $( "#schd_dt" ).datepicker({
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
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
	  
	  $( "#edu_dt" ).datepicker({
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
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
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<!-- <p>손님</p> -->
<!-- <a href=""></a> -->
<!-- <a href=""></a> -->
<!-- <a href=""></a> -->
<!-- <a href=""></a> -->
<!-- <a href=""></a> -->
<!-- <br><hr><br> -->
<!-- <p>상점</p> -->
<!-- <a href="../owner/choice">자리선택화면</a> -->
<!-- <a href="../owner/order">주문받기</a> -->
<!-- <a href="../owner/regStore">상점코드 등록</a> -->
<!-- <a href="../owner/regTable">상점코드 등록</a> -->
<!-- <a href="../owner/addMenu">메뉴 추가하기</a> -->
<!-- <a href="../owner/menuList">메뉴리스트</a> -->
<!-- <a href="../owner/menuList">메뉴리스트</a> -->

<br><hr><br>
<a href="/web/owner/regStore">회원추가</a>
<a href="/web/home">회원조회</a>
<a href="/web/comm/main">메인화면</a>
<a href="/web/owner/menuList">메뉴리스트</a>
<br><hr><br>
<span>* 교육일정 등록</span>
<form action="addMenu" method="post">
<table>
<tr><td>학생번호 : <input type="number" id="cstno" name="cstno"></td></tr>
<tr><td>교육일자 : <input type="text" id="edu_dt" name="edu_dt"></td></tr>
<tr><td>교육시작시간 : <input type="number" id="edu_strt_tm" name="edu_strt_tm" maxlength="4"></td></tr>
<tr><td>교육종료시간 : <input type="number"    id="edu_end_tm" name="edu_end_tm" maxlength="4"></td></tr>
<tr><td>차종 : 
<select name ="edu_subject" id = "edu_subject"> 
                        <option value="지게차1">지게차1</option> 
                        <option value="지게차2">지게차2</option> 
                        <option value="지게차3">지게차3</option>
                        <option value="굴삭기1">굴삭기1</option>
                        <option value="굴삭기2">굴삭기2</option>
                    </select> 


</td></tr>
<tr><td>교육이수시간 : <input type="text" id="lssn_attnd_tm" name="lssn_attnd_tm"></td></tr>
<tr><td>교육이수여부 : 
 <select name ="lssn_attnd_yn" id = "lssn_attnd_yn"> 
                        <option value="Y">Y</option> 
                        <option value="N">N</option> 
                    </select> 


</td></tr>

</table>
<input type="submit" value="등록하기">
</form>

<br><hr><br>
<input type="text" id="schd_dt">
<select name ="iedu_subject" id = "iedu_subject"> 
                        <option value="지게차1">지게차1</option> 
                        <option value="지게차2">지게차2</option> 
                        <option value="지게차3">지게차3</option>
                        <option value="굴삭기1">굴삭기1</option>
                        <option value="굴삭기2">굴삭기2</option>
                    </select> 
<button id = "search" value="조회">조회
</button>
<!-- <form action="/web/view?empno="+empno" method="post"> -->
<!-- 	<input type="text" id="schd_dt">   -->
<!-- 	<input type="submit" value="조회"> -->
<!-- </form> -->

<div>
    	<table id="popup">
    		<tr><th></th></tr>
    		<tr><td></td></tr>
    	</table>
	</div>
</body>
</html>