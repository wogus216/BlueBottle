<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.top {
   width: 100%;
   padding: 0;
   margin: 0;
   background-color: white;
   display: inline-block;
   min-width: 1400px;
    height: 62px;
}

.top_menu{
	display: inline-block;
	vertical-align: top;
	float: right ;
	width: 1050px;
}

body {
   margin: 0;
   padding: 0;
   background-color: #f2f2f2;
}

ul {
   list-style-type: none;
   margin: 0;
   padding: 0;
  
}

ul:after {
   content: '';
   display: block;
   clear: both;
}

li {
   float: left;
}

.main_menu{
   display: inline-block;
   color: black;
   padding: 20px 30px;
   text-decoration: none;
   font-weight: bold;
   font-size: 17px;
}

.main_menu:hover {
   background-color: #f1f1f1;
}


.logo {
   padding: 13px 30px;
  
  
}

.sub {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 128px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    font-size: 15px;
    text-align: center;
}
.sub a{
	color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    
}

.log_out{
	display:inline-block;
	text-decoration: none;
	color: gray;
	padding:10px 20px;
	line-height: 42px;
}

.sub a:hover {
     background-color: #f1f1f1;
}

.menu_a:hover .sub, .menu_b:hover .sub ,.menu_c:hover .sub,.menu_d:hover .sub,
.menu_e:hover .sub,.menu_f:hover .sub, .menu_g:hover .sub  {
    display: block;
}
.content_area{
	width: 1250px;
	height: 900px;
	margin: 0 auto;
	margin-top: 50px;
}

.content{
	max-width: 1250px;
    min-width: 700px;
    margin-left: 30px;
     width: 1250px;
}
.filter_area{
	text-align: right;
	margin-bottom: 10px;
}
.search_btn{
	height: 40px;
	margin: 0 ;
	padding: 0;
	vertical-align: bottom;
}
select{
	font-size: 15px;	
	height: 40px;
	width : 100px;
}
.add_btn{
	height: 40px;
	padding: 0;
	vertical-align: bottom;
}
h1 {
 margin-bottom: 40px;
 font-size: 30px;
}
table {
    width: 100%;
    table-layout: fixed;
    background: #ffffff;
	margin: 10px 0 0 1px;
	border-top: 2px solid #3498db;
	border-bottom: 2px solid #d9d9d9;
}
tbody td:nth-child(3){
	cursor: pointer;
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
}
.add_btn,.search_btn{
	color: white;
	width: 100px;
	height: 40px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin:10px;
	cursor: pointer;
	background-color: #01a1dd;
	outline:none;
}
.search_info,.page_area, .page_btn{
	text-align: center;
}
.page_area, .page_btn{
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
.search_filter{
	width : 120px;
}

.search_input{
	height: 34px;
	vertical-align: middle;
	width : 280px;
	outline:none;
}

.search_filter,.search_input,.search_btn{
	vertical-align: middle;
}

.page_btn button{
	background-color: white;
}

.on{
	background-color: blue;
}
</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	if("${param.search_filter}" != ""){
		$("#search_filter").val("${param.search_filter}");
	}
	
	if("${param.cate}" != ""){
		$(".cate").val("${param.cate}");
	}
	
	reloadList();
	
	$(".search_btn").on("click",function(){
		$("#page").val(1);
		$("#Old_search_input").val($(".search_input").val());
		reloadList();	
	});
	
	$(".cate").change(function(){
		$("#cate").val($(".cate").val());
		$(".search_input").val($("#Old_search_input").val());
		$("#page").val(1);
 		reloadList();
 	});
	
	$(".top_menu").on("click","a",function(){
		$(".top_menu a").attr("style","color: black");
		$(this).css("color", "#01a1dd");
		$(this).parent().parent().children(1).css("color", "#01a1dd");
	});
	$(".sub").hover(function(){
		$("li").css("background-color","white");
		$(this).parent("li").css("background-color","#f1f1f1");
	
	},function(){
			$("li").css("background-color","white");
	});
	
	$(".page_btn").on("click","button",function(){
		$("#page").val($(this).attr("page"));
		$(".search_input").val($("#Old_search_input").val());
		reloadList();
	});
	
	$("tbody").on("click","a",function(){
		$("#itemNo").val($(this).attr("itemNo"));
		$(".search_input").val($("#Old_search_input").val());
		$("#actionForm").attr("action","Item_Dtl");
		$("#actionForm").submit();
	}); //품목코드 클릭 시에는 품목 상세조회 페이지로 이동
	
	$("tbody").on("click","td:nth-child(3)",function(){
		$("#itemNo").val($(this).attr("itemNo"));
		$("#itemName").val($(this).attr("itemName"));
		$(".search_input").val($("#Old_search_input").val());
		$("#actionForm").attr("action","Stock_Dtl");
		$("#actionForm").submit();
	}); //품목명 클릭 시에는 재고 상세조회 페이지로 이동 , 이거 수정 필요.. tr과 a태그 구분 선택... //우선 이대로?
	
	$(".add_btn").on("click",function(){
		$(".search_input").val($("#Old_search_input").val());
		$("#actionForm").attr("action","Item_Add");
		$("#actionForm").submit();
	});
	
}); //ready end

function reloadList(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url : "Item_Lists",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawproductList(res.list);
			drawproductPaging(res.pb);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
}

function drawproductList(list){
	var html ="";
	
	for(var d of list){
		html += "<tr itemNo = \""+d.ITEM_NO+"\">";
		html += "<td><a href = \"#\" itemNo = \""+d.ITEM_NO+"\">"+d.ITEM_NO+"</a></td>";
		html += "<td>"+d.CATE_NAME+"</th>";
		html += "<td itemNo = \""+d.ITEM_NO+"\" itemName = \""+d.ITEM_NAME+"\">"+d.ITEM_NAME+"</td>";
		html += "<td>"+d.PRICE+"</th>";
		html += "<td>"+d.MIN_ORD_UNIT+"</td>";
		html += "</tr>";	
	}
	
	$("tbody").html(html);
}

function drawproductPaging(pb){
	var html = "";
	                                    
	html += "<button page = \"1\">|<</button>";
	if($("#page").val()=="1"){
		html += "<button page = \"1\"><</button>";
	}else{
		html += "<button page = \""+ ($("#page").val()-1) + "\" ><</button>";
		
	}
	
	for(var i = pb.startPcount; i <= pb.endPcount; i++){
		if($("#page").val() == i){ //현재 페이지의 값이랑 같을 때
			html += "<button class = \"on\" page = \""+ i +"\" >"+ i +"</button>";	
		}else{
			html += "<button  page = \""+ i +"\" >"+ i +"</button>";	
		}
		
	}
	
	if($("#page").val() == pb.maxPcount){
		html += "<button page = \""+ pb.maxPcount +"\" >></button>";
	}else{
		html += "<button page = \""+ ($("#page").val()*1+1) +"\" >></button>";/* -는 알아서 숫자 빠지는데 더하기는 문자열 처리가 됨  그래서 *1 해줘야됨*/
	}
	
	
	
	html += "<button page = \""+ pb.maxPcount +"\" >>|</button>";
	
	$(".page_btn").html(html);
}

</script>
</head>
<body>
<div class="top">
<ul>
         <li>
         <a href="#">
         <img class="logo" alt="logo" src="resources/images/bb/logo.png" width="250px"></a>
         </li>
         
         <div class="top_menu">
         
         <div class="menu_a">
         <li>
         	<a class="main_menu" href="#">
         	주문관리</a>
	         <div class="sub">
	        	 <a href="#">
	            	주문조회</a>
	            <a href="#">
	            	환불요청조회</a>
	             <a href="#">
	            	환불완료조회</a>
	      </div>
         </li>
         </div>
         
         <div class="menu_b">
         <li>
         	<a class="main_menu" href="#">
         		재고관리</a>
	          	<div class="sub">
     			<a href="#">		
	            	재고조회</a>
     			<a href="#">
	            	재고등록</a>
	            <a href="#">	
	            	입출고조회</a>
	            <a href="#">
	            	폐기조회</a>
	            </div>
          </li>
         </div>
         
           <div class="menu_c">
         <li>
		<a class="main_menu" href="#"> 
	        		품목관리</a>
	          	<div class="sub">
				<a href="#">
	            	품목조회</a>
	            <a href="#">
	            	품목등록</a>
	            </div>
          </li>
         </div>
         
         <div class="menu_d">
         <li>
         	<a class="main_menu" href="#"> 
         		POS관리</a>
	          <div class="sub" >
				<a href="#">
	            	메뉴조회</a>
				<a href="#">
	            	메뉴등록</a>
            </div>	
          </li>
         </div>
          <div class="menu_e">
         	<li>
         		<a class="main_menu" href="#"> 
         			공지사항</a>
	        </li>
         </div>
         <div class="menu_f">
         	<li>
         	<a class="main_menu" href="#"> 
         			사용자관리</a>
         		 <div class="sub" style="min-width: 145px;">
			<a href="#">
	            	사용자조회</a>
	          <a href="#">
	            	사용자등록</a>
            </div>	
	        </li>
         </div>
          <div class="menu_g">
          <li>
          <a class="main_menu" href="#"> 
         		마이페이지</a>
           </li>
         </div>
         <a class="log_out" href="#">
         		로그아웃</a>
      	</div>
      </ul>
 </div>
<div class="content_area">
<div class="content">
<h1>품목조회</h1>
<div class="filter_area">
			<select class= "cate">
               <option selected="selected" value = "">전체</option>
                  <c:forEach items="${catelist}" var = "d">
                   <option value="${d.CATE_NO}">
                   <c:out value="${d.CATE_NAME}"/> </option>
                  </c:forEach>
            </select>

<input type = "button" class="add_btn" style="margin:0px 0px 0px 10px;" value = "추가"/>
</div>
<table cellspacing="0">
	<colgroup>
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
	</colgroup>
	<thead>
	<tr>
		<th scope=col style= "border-left: none;">품목코드</th>
		<th scope=col>카테고리</th>
		<th scope=col>품목명</th>
		<th scope=col>가격(원)</th>
		<th scope=col>최소주문단위</th>
	</tr>
	</thead>
	<tbody></tbody>
</table>
<div class="search_area" style = "margin-top : 30px;">
		<div class="search_info">
		<form action = "#" id = "actionForm" method = "post">
			<input type = "hidden" id = "Old_search_input" name = "Old_search_input" value ="${param.search_input}" />
			<input type = "hidden" id = "itemNo" name = "itemNo"/>
			<input type = "hidden" id = "itemName" name = "itemName"/>
			<input type = "hidden" id = "page" name = "page" value = "${page}"/>
		<select id="search_filter" name = "search_filter">
				<option value="0" selected="selected">품목코드</option>
				<option value="1">품목명</option>
			</select>
			<input type = "hidden" id = "cate" name = "cate"/>
			<input type="text" class="search_input" name = "search_input" value = "${param.search_input}"/>
			<input type = "button" class="search_btn" value = "검색"/>
			</form>
		</div>
	</div>
<div class="page_area">
		<div class="page_btn"></div>
	</div>
</div>
</div>
</body>
</html>