<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<c:import url="H_Menu.jsp">
	<c:param name="menuno" value="9"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POS관리</title>
<style type="text/css">
/* 미들 부분 */

.content_area{
	width: 1250px;
	height: 900px;
	margin: 0 auto;
	margin-top: 50px;    
	width: 50%;
    height: 110px;
}

.content{
	max-width: 1250px;
    min-width: 700px;
    margin-left: 30px;
}
/* Pos메뉴 게시판 */

h1 {
 margin-bottom: 40px;
 font-size: 30px;
}

table {
    width: 100%;
    table-layout: fixed;
    background: #ffffff;
	margin: 10px 0;
	border-top: 2px solid #01a1dd;
	border-bottom: 2px solid #d9d9d9;
	text-align: center;
}


tr {
    display: table-row;
}
th{
	background: #e8e8e8;
    padding: 10px;
    border-bottom: 1px solid #ffffff;
    border-left: 1px solid #ffffff;
}
td{
	font-size:15px;
	padding:10px;
	border-top: 1px solid #eaeaea;
	border-left: 1px solid #eaeaea;
	cursor: pointer;
}

 td:first-child{
	border-left: none;
}
input{
	width:200px;
	height:40px;

}

.filter_area{
	text-align: right;
	margin-bottom: 20px;
}
.add_btn{
	height: 40px;
    padding: 0;
    vertical-align: bottom;
}


label{
	vertical-align: middle;
}
.search_btn{
	height: 40px;
	margin: 0 ;
	padding: 0;
	vertical-align: bottom;
}

select{
	font-size: 13px;	
	height: 40px;
	width : 100px;
}

/* 일반버튼 */
button{
	color: white;
	width: 100px;
	height: 40px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin:10px;
	cursor: pointer;
	outline:none;
	background-color: #01a1dd;
}
/* 검색 과 페이지 */

.search_Info,.page_Area, .page_btn{
	text-align: center;
}

.page_btn button{
	color: black;
	width: 40px;
	height: 40px;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin:40px 3px;
	box-shadow: 0px 2px 4px 0px rgba(0,0,0,0.2);
}

.page_btn button:hover{
	color: #01a1dd;
}

.page_btn button:focus{
	outline:none;
}

#search_Filter{
	width : 120px;
	vertical-align: middle;
}

.search_input{
	height: 34px;
	vertical-align: middle;
	width : 280px;
	outline:none;
}

</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("${param.search_Filter}" != ""){
			$("#search_Filter").val("${param.search_Filter}");
	}

	reloadList();
	//카테고리 선택하고 상세보기 갔다가 돌아 왔을 때 유지
	if($("#cateNo").val() != ""){
		$(".cate").val("${param.cateNo}").prop("selected",true);
	}
	
	//if("${param.cate}" != ""){
	//$(".cate").val("${param.cate}");
	//}
	
	//페이지 변경	
	$(".page_btn").on("click","button",function(){
		$("#page").val($(this).attr("page"));
		reloadList();
	});
 	//카테고리 변경 시 value 값 넣어주기
 	$(".cate").change(function(){
 		$("#cateNo").val($(".cate").val());
 		$("#page").val(1);
 		reloadList();
 	});
 	
 	//검색
 	$(".search_btn").on("click",function(){
 		$("#page").val(1);
 		reloadList();
 	});
 	
 	//상세보기
 	$("tbody").on("click","tr",function(){
 		$("#posMenuNo").val($(this).attr("mNo"));
 		$("#menu_form").attr("action","Menu_Dtl");
 		$("#menu_form").submit();
 	});
 	
 	//추가 
 	$(".add_btn").on("click",function(){
 		$("#menu_form").attr("action","Menu_Add");
 		$("#menu_form").submit();
 	});
 		
	
}); //ready end
//비동기로 다시 해보기
function reloadList(){
	var params = $("#menu_form").serialize();
	console.log(params);
	$.ajax({
		url: "Menu_Lists",
		type: "post", 
		dataType: "json",
		data : params, 
		success : function(res) {
			
			console.log(res);
			drawList(res.list);
			drawPaging(res.pb);
			
		},
		error: function(request, status, error){ 
			console.log(error);
		}
	});
}

function drawList(list){
	var menu = "";
	
	//" +  + " : 문자열 넣는 꿀팁
	for(var m of list){
		
		menu+="<tr mNo=" + m.MENU_NO + ">";
		menu+="		<td>" + m.MENU_NO + "</td>";
		menu+="		<td>" + m.MENU_NAME + "</td>";
		menu+="		<td>" + m.CNAME + "</td>";
		menu+="		<td>" + m.MENU_PRICE + "</td>";
		menu+="</tr>";
	}
	
	$("table tbody").html(menu);
}

function drawPaging(pb){
	var html = "";
//	" + + "
	//처음
	html+= "<button  page=\"1\" style=\"background-color: white\"><<</button>";
	
	//이전페이지
	if($("#page").val() =="1"){
		html+= "<button page=\"1\" style=\"background-color: white\"><</button>";
	} else{
		html+= "<button page=\"" + ($("#page").val() -1) + "\" style=\"background-color: white\"><</button>";
	}
	
	//처음페이지
	for(var i = pb.startPcount; i<= pb.endPcount; i++){
		if($("#page").val() == i ){
			html+= "<button page=\"" + i + "\" style=\"background-color: white\"><b>" + i + "</b></button>";
		}else{
			html+= "<button page=\"" + i + "\" style=\"background-color: white\">" + i + "</button>";
		}		
	}
	//다음페이지
	if($("#page").val() == pb.maxPcount){
		html+= "<button  page=\"" + pb.maxPcount + "\" style=\"background-color: white\">></button>";
	}else{
		html+= "<button  page=\"" + ($("#page").val() * 1 + 1) + "\" style=\"background-color: white\">></button>";
		
	}
	html+= "<button  page=\"" + pb.maxPcount + "\" style=\"background-color: white\">>></button>";

	$(".page_btn").html(html)
}

</script>

</head>
<body>
<!--컨텐츠 -->

	<div class="content_area">
		<div class="content">
			<h1>POS메뉴조회</h1>

	<div class="filter_area">
		<select class="cate" name ="cate">
			<option value="4" selected="selected">전체</option>
			<option value="0">음료</option>
			<option value="1">제과</option>
			<option value="2">굿즈</option>
			<option value="3">원두</option>
		</select>

		<button class="add_btn" style="margin:0px 0px 0px 10px;">등록</button>
	</div>	
		
		<table cellspacing="0">
			<colgroup>
				<col width="15%">
				<col width="25%">
				<col width="35%">
				<col width="20%">
			</colgroup>
			<thead>
				<tr>
					<th scope="col" style="border-left: none;">No.</th>
					<th scope="col">메뉴이름</th>
					<th scope="col">카테고리</th>
					<th scope="col">가격(원)</th>
				</tr>
			</thead>	
			<tbody></tbody>
		</table>
		<div class="search_Area" style = "margin-top : 30px;">
			<form action="#" id="menu_form" method="post">
				<input type="hidden" id="posMenuNo" name="posMenuNo" value="" />
				<input type="hidden" id="cateNo" name="cateNo" value="${param.cateNo}"/>
				<input type="hidden" id="page" name="page" value="${page}"/>
			<div class="search_Info">
				<select id="search_Filter" name="search_Filter">
					<option value="0" selected="selected">메뉴이름</option>
					<option value="1">카테고리</option>
					<option value="2">가격</option>
				</select>
				<input type="text" class="search_input" name="search_input" value="${param.search_input}"/>
				<input type="hidden" class="search_Filter" name="search_Filter" value="${search_Filter}"/>
				<button class="search_btn">검색</button>
			</div>
		</form>
		</div>
		<div class="page_Area">
			<div class="page_btn"></div>
		</div>
		
		</div> <!--content end  -->
	</div> <!--content_area end  -->
</body>
</html>