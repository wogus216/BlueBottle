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
tbody td{
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
	//drawproductlist();
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

	$("tr").on("click",function(){
		location.href = "H_stock_detail.html";
	});
	
	$(".add_btn").on("click",function(){
		location.href = "H_product_add.html";
	});
	
}); //ready end

/*function drawproductlist(list){
	var html ="";
	
	console.log(list);
	
	for(var d of list){
		html += "<tr>";
		html += "<td>"+d.I.ITEM_NO+"</td>";
		html += "<td>"+d.I.ITEM_NAME+"</td>";
		html += "<td>"+d.IP.PRICE+"</th>";
		html += "<td>"+d.I.MIN_ORD_UNIT+"</td>";
		html += "</tr>";	
	}
	
	$("tbody").html(html);
}*/

</script>
</head>
<body>
<div class="top">
     <ul>
         <li>
         <a href="#">
         <img class="logo" alt="logo" src="src/main/webapp/resources/images/bb/logo.png" width="250px"></a>
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
<select class="cate">
	<option value="0" selected="selected">카테고리명</option>
	<option value="1">음료</option>
	<option value="2">빵</option>
	<option value="3">기타</option>
</select>
<button class="add_btn" style="margin:0px 0px 0px 10px;">추가</button>
</div>
<table cellspacing="0">
	<colgroup>
		<col width="25%" />
		<col width="25%" />
		<col width="25%" />
		<col width="25%" />
	</colgroup>
	<thead>
	<tr>
		<th scope=col style= "border-left: none;">품목코드</th>
		<th scope=col>품목명</th>
		<th scope=col>가격(원)</th>
		<th scope=col>최소주문단위</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var= "d" items = "${list}">
			<tr name = "${d.ITEM_NO}">
				<td>${d.ITEM_NO}</td>
				<td>${d.ITEM_NAME}</td>
				<td>${d.PRICE}</td>
				<td>${d.MIN_ORD_UNIT}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="search_area" style = "margin-top : 30px;">
		<div class="search_info">
			<select class="search_filter">
				<option value="0" selected="selected">품목번호</option>
				<option value="1">본문 내용</option>
			</select>
			<input type="text" class="search_input"/>
			<button class="search_btn">검색</button>
		</div>
	</div>
<div class="page_area">
		<div class="page_btn">
		<button style="background-color: white"><</button>
		<button style="background-color: white">1</button>
		<button style="background-color: white">2</button>
		<button style="background-color: white">3</button>
		<button style="background-color: white">></button>
		</div>
	</div>
</div>
</div>
</body>
</html>