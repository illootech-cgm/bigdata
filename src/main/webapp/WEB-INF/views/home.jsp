<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    $(document).ready(function() {
        jQuery("#grid").jqGrid({
            url : "/web/homePost",
            caption : '학생정보',    // caption : 그리드의 제목을 지정한다.
            datatype : 'json',               // datatype : 데이터 타입을 지정한다.
            mtype : 'post',
            height : '300px',                 // height : 그리드의 높이를 지정한다.
            colModel : [
                        { name : 'cstno',            index : 'cstno',                width : 100, height:55,       align : 'center', label : "학생번호"  },
                        { name : 'cst_dvcd',         index : 'cst_dvcd',            width : 100, height:55,   align : 'left' , label : "학생구분" },
                        { name : 'cstnm',             index : 'cstnm',                width : 100,  height:55,  align : 'left' , label : "학생명" , formatter : info },
                        { name : 'cst_celphn_no',         index : 'cst_celphn_no',            width : 200, height:55,   align : 'left' , label : "핸드폰번호"  },
                        { name : 'addr',         index : 'addr',            width : 300, height:55,   align : 'left' , label : "주소"  },
                        { name : 'idno',         index : 'idno',            width : 200, height:55,   align : 'left' , label : "주민번호"  }
                        ]
        }).navGrid('#pager', {
            search : true,
            edit : true,
            add : true,
            del : true
        });
        
        
        $("#search").on("click",function(){
        	
        	jQuery("#grid").jqGrid("clearGridData", true);
        	jQuery("#grid").setGridParam({
          	 datatype	: "json",
          	 postData	: {cstnm : $("#cstnm").val(), idno : $("#idno").val(), cst_celphn_no : $("#cst_celphn_no").val()},
          	 loadComplete	: function(data) {
          		 console.log(data);
          	 }
           }).trigger("reloadGrid");
      })
        
        
        
    });
    
//     $('#search').click(function grid(){
// alert("search");
//         jQuery("#grid").jqGrid({
//             url : "/web/homePost",
//             caption : '학생정보',    // caption : 그리드의 제목을 지정한다.
//             datatype : 'json',               // datatype : 데이터 타입을 지정한다.
//             mtype : 'post',
//             height : '80px',                 // height : 그리드의 높이를 지정한다.
//             colModel : [
//                         { name : 'cstno',            index : 'cstno',                width : 100, height:50,       align : 'center', label : "학생번호" },
//                         { name : 'cst_dvcd',         index : 'cst_dvcd',            width : 100, height:50,   align : 'left' , label : "직책" , formatter : info },
//                         { name : 'cstnm',             index : 'cstnm',                width : 100,  height:50,  align : 'left' , label : "학생명"  },
//                         { name : 'cst_celphn_no',         index : 'cst_celphn_no',            width : 200, height:50,   align : 'left' , label : "핸드폰번호"  },
//                         ]
//         }).navGrid('#pager', {
//             search : true,
//             edit : true,
//             add : true,
//             del : true
//         });
//     });
    $(function() {
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
    
    function doSearch(){
    	jQuery("#grid").jqGrid("clearGridData", true);
    	jQuery("#grid").setGridParam({
      	 datatype	: "json",
      	 postData	: {cstnm : $("#cstnm").val(), idno : $("#idno").val(), cst_celphn_no : $("#cst_celphn_no").val()},
      	 loadComplete	: function(data) {
      		 console.log(data);
      	 }
       }).trigger("reloadGrid");
    	
    }
    function info(cellvalue, options, rowObject){
    	
    	return "<a href='#' onclick='info2(\""+rowObject.cstno+"\"); return false; '  >"+cellvalue+"</a>";
    
    }
    
    
function find_cst(cellvalue, options, rowObject){
    	
    	return "<a href='#' onclick='find_cst_info(\""+rowObject.cstnm+"\"); return false; '  >"+cellvalue+"</a>";
    
    }
    
    
function find_cst_info(cstnm){
	alert(cstnm);
	$("#cstnm").setValue("cstnm");
	doSearch();
}	
    
    
    
    
    
    function info2(cstno){

	//	console.log(ret.empno);
		jQuery("#popup").jqGrid("GridUnload");
    	
		jQuery("#popup").jqGrid({
            url : "/web/clsHist?cstno="+cstno,
            caption : '수강내역',    // caption : 그리드의 제목을 지정한다.
            datatype : 'json',               // datatype : 데이터 타입을 지정한다.
            mtype : 'post',
            height : '150px',                 // height : 그리드의 높이를 지정한다.
            colModel : [
            	{ name : 'cstno',             index : 'cstno',                width : 50, height:50,       align : 'center', label:"학생번호" , formatter : find_cst},        
    			{ name : 'edu_dt',             index : 'empno',                width : 80, height:50,       align : 'center', label:"교육일자"},
                { name : 'edu_strt_tm',       index : 'edu_strt_tm',            width : 100, height:50,   align : 'left' , label:"교육시작시간" },
                { name : 'edu_end_tm',       index : 'edu_end_tm',            width : 100, height:50,   align : 'left' , label:"교육종료시간" },
                { name : 'edu_subject',                index : 'edu_subject',                width : 100,  height:50,  align : 'left', label:"교육과목" },
                { name : 'lssn_attnd_tm',           index : 'lssn_attnd_tm',            width : 200, height:50,   align : 'left' , label:"수강시간" },
                { name : 'lssn_attnd_yn',           index : 'lssn_attnd_yn',            width : 200, height:50,   align : 'left' , label:"수강여부" },
                        ]
        }).navGrid('#pager', {
            search : true,
            edit : true,
            add : true,
            del : true
        });
   		
jQuery("#popup2").jqGrid("GridUnload");


		jQuery("#popup2").jqGrid({
            url : "/web/reserveHist?cstno="+cstno,
            caption : '예약내역',    // caption : 그리드의 제목을 지정한다.
            datatype : 'json',               // datatype : 데이터 타입을 지정한다.
            mtype : 'post',
            height : '150px',                 // height : 그리드의 높이를 지정한다.
            colModel : [
            	{ name : 'cstno',             index : 'cstno',                width : 50, height:50,       align : 'center', label:"학생번호"},        
    			{ name : 'edu_dt',             index : 'empno',                width : 80, height:50,       align : 'center', label:"예약일자"},
                { name : 'edu_strt_tm',       index : 'edu_strt_tm',            width : 100, height:50,   align : 'left' , label:"교육시작시간" },
                { name : 'edu_end_tm',       index : 'edu_end_tm',            width : 100, height:50,   align : 'left' , label:"교육종료시간" },
                { name : 'edu_subject',                index : 'edu_subject',                width : 100,  height:50,  align : 'left', label:"교육과목" },
                { name : 'lssn_attnd_tm',           index : 'lssn_attnd_tm',            width : 200, height:50,   align : 'left' , label:"수강시간" },
                { name : 'lssn_attnd_yn',           index : 'lssn_attnd_yn',            width : 200, height:50,   align : 'left' , label:"수강여부" },
                        ]
        }).navGrid('#pager', {
            search : true,
            edit : true,
            add : true,
            del : true
        });
jQuery("#popup3").jqGrid("GridUnload");
    	
		jQuery("#popup3").jqGrid({
            url : "/web/buyHist?cstno="+cstno,
            caption : '결재내역',    // caption : 그리드의 제목을 지정한다.
            datatype : 'json',               // datatype : 데이터 타입을 지정한다.
            mtype : 'post',
            height : '150px',                 // height : 그리드의 높이를 지정한다.
            colModel : [
            	{ name : 'cstno',             index : 'cstno',                width : 50, height:50,       align : 'center', label:"학생번호"},        
    			{ name : 'buy_dt',             index : 'buy_dt',                width : 80, height:50,       align : 'center', label:"결재일자"},
                { name : 'cst_dvcd',       index : 'cst_dvcd',            width : 100, height:50,   align : 'center' , label:"차종" },
                { name : 'buy_amt',       index : 'buy_amt',            width : 100, height:100,   align : 'right' , label:"결재금액" },
                { name : 'buy_dvcd',                index : 'buy_dvcd',                width : 200,  height:50,  align : 'left', label:"기타" },
                        ]
        }).navGrid('#pager', {
            search : true,
            edit : true,
            add : true,
            del : true
        });
		
//    	 jQuery("#popup").jqGrid("GridUnload");
    	
    }
    
/*     function popup(empno){
    	window.open("", "pop", "width=400,height=500,history=no,resizable=no,status=no,scrollbars=yes,menubar=no")
    
    } */
    
</script>
<title>고객관리</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<hr>
<a href="/web/owner/regStore">회원추가</a>
<a href="/web/home">회원조회</a>
<a href="/web/comm/main">메인화면</a>
<a href="/web/owner/menuList">메뉴리스트</a>
<hr><br>
<!-- <form action="/web/homePost" method="post"> -->
<!-- <table> -->
<span>학생명 : <input type="text" id="cstnm" name="cstnm" onkeydown="javascript:if(event.keyCode==13){doSearch();}"></span><br>
<span>주민번호 : <input type="number"    id="idno" name="idno" onkeydown="javascript:if(event.keyCode==13){doSearch();}"></span><br>
<span>핸드폰 : <input type="number" id="cst_celphn_no" name="cst_celphn_no" onkeydown="javascript:if(event.keyCode==13){doSearch();}"></span>
<!-- </table> -->
<button id = "search" value="조회">조회
</button>

<form action="delete" method="post">

<br><br>
<span>*삭제하기</span>
<table>
<tr><td>학생번호 : <input type="text" id="cstno" name="cstno"></td></tr>
</table>

<input type="submit" value="삭제하기">
</form>
<!-- </form> -->
<!-- <a href='/web/owner/regStore' >추가하기</a> -->

    <table id = "grid">
    <tr><th></th></tr>
    <tr><td></td></tr>
<!--     <tr><td>2</td></tr> -->
<!--     <tr><td>3</td></tr> -->
<!--     <tr><td>4</td></tr> -->
    </table>
    <div id = "pager"></div>
    
    <div>
    	<table id="popup">
    		<tr><th></th></tr>
    		<tr><td></td></tr>
    	</table>
	</div>
	<div id="d1">
    	<table id="popup2">
    		<tr><th></th></tr>
    		<tr><td></td></tr>
    	</table>
	</div>
	<div>
    	<table id="popup3">
    		<tr><th></th></tr>
    		<tr><td></td></tr>
    	</table>
	</div>
	
</body>
</html>