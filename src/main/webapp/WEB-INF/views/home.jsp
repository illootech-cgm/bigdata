<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" media="screen" href="http://trirand.com/blog/jqgrid/themes/redmond/jquery-ui-1.8.1.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="http://trirand.com/blog/jqgrid/themes/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen" href="http://trirand.com/blog/jqgrid/themes/ui.multiselect.css" />
 
<script src="http://trirand.com/blog/jqgrid/js/jquery.js" type="text/javascript"></script>
<script src="http://trirand.com/blog/jqgrid/js/jquery-ui-1.8.1.custom.min.js" type="text/javascript"></script>
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
            caption : '사원테이블',    // caption : 그리드의 제목을 지정한다.
            datatype : 'json',               // datatype : 데이터 타입을 지정한다.
            mtype : 'post',
            height : '500px',                 // height : 그리드의 높이를 지정한다.
            colModel : [
                        { name : 'empno',            index : 'empno',                width : 40, height:50,       align : 'center', label : "사원번호" },
                        { name : 'job',         index : 'job',            width : 100, height:50,   align : 'left' , label : "직책" , formatter : info },
                        { name : 'ename',             index : 'ename',                width : 100,  height:50,  align : 'left' , label : "사원이름"  },
                        { name : 'comm',         index : 'comm',            width : 200, height:50,   align : 'left' , label : "상여금"  },
                        ]
        }).navGrid('#pager', {
            search : true,
            edit : true,
            add : true,
            del : true
        });
   
    });
    
    function info(cellvalue, options, rowObject){
    	
    	return "<a href='#' onclick='info2(\""+rowObject.empno+"\"); return false; '  >"+cellvalue+"</a>";
    
    }
    
    function info2(empno){

	//	console.log(ret.empno);
		jQuery("#popup").jqGrid("GridUnload");
    	
		jQuery("#popup").jqGrid({
            url : "/web/view?empno="+empno,
            caption : '사원상세테이블',    // caption : 그리드의 제목을 지정한다.
            datatype : 'json',               // datatype : 데이터 타입을 지정한다.
            mtype : 'post',
            height : '500px',                 // height : 그리드의 높이를 지정한다.
            colModel : [
                        { name : 'empno',             index : 'empno',                width : 40, height:50,       align : 'center', label:"직원 번호"},
                        { name : 'ename',       index : 'ename',            width : 100, height:50,   align : 'left' , label:"직원 이름" },
                        { name : 'job',                index : 'job',                width : 100,  height:50,  align : 'left', label:"직급" },
                        { name : 'mgr',           index : 'mgr',            width : 200, height:50,   align : 'left' , label:"사수" },
                        { name : 'sal',           index : 'sal',            width : 200, height:50,   align : 'left' , label:"연봉"},
 //                       { name : 'comm',          index : 'comm',            width : 200, height:50,   align : 'left'   },
                        { name : 'deptno',        index : 'deptno',            width : 200, height:50,  hidden :true ,align : 'left'  , label:"부서 번호" }
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
<title>jqGrid</title>
</head>
<body>
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
</body>
</html>