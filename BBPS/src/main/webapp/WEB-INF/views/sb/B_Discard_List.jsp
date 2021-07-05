<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 상단 바 */
.top {
   width: 100%;
   padding: 0;
   margin: 0;
   background-color: white;
   display: inline-block;
   min-width: 1820px;
    height: 62px;
}

.top_menu{
	display: inline-block;
	vertical-align: top;
	float: right ;
	width: 1500px;
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
    height: 62px;
}

.main_menu{
   display: inline-block;
   color: black;
   padding: 20px 30px;
   text-decoration: none;
   font-weight: bold;
   font-size: 17px;
}

.menu_f li .sub {
	width: 162px;
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
    padding: 10px 16px;
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
/* 미들 부분 */
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
/* 품목등록 */

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
	
}

 td:first-child{
	border-left: none;
}

td:nth-child(8){
	padding : 0px;
	text-align: center;
}

input{
	width:200px;
	height:40px;

}

.discard_cnl_btn{
	background-color: #bf4040;
	width: 50px;
	height: 30px;
	font-size:15px;
	margin: 0px;
	
}

.filter_area{
	text-align: right;
	margin-bottom: 20px;
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

.start_date, .end_date{
	width: 150px;
	font-size: 15px;
	height: 36px;
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
	background-color: #01a1dd;
	outline:none;
}
/* 검색 과 페이지 */

.search_info,.page_area, .page_btn{
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

.search_cate, .search_info{
	display : inline-block;
	vertical-align: top;
}

.search_area{
	text-align: center;
}

</style>
<script type="text/javascript"
	src="../script/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function(){
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
	
	
}); //ready end
</script>
</head>
<body>
<!-- 상단 -->
  <div class="top">
     <ul>
         <li>
         <a href="#">
         <img class="logo" alt="logo" src="./logo.png" width="250px"></a>
         </li>
         
         <div class="top_menu">
         
         <div class="menu_a">
         <li>
         	<a class="main_menu" href="#">
         		재고관리</a>
	         <div class="sub">
	            <a href="#">
	            	현재재고조회</a>
	             <a href="#">
	            	입고재고조회</a>
	            <a href="#">
	            	사용재고조회</a>
	            <a href="#">
	            	폐기조회</a>
	         </div>
          </li>
         </div>
         
         <div class="menu_b">
         <li>
         	<a class="main_menu" href="#" style="padding: 20px 40px;">
         		주문관리</a>
	         <div class="sub">
	            <a href="#">
	            	주문조회 및 환불</a>
	             <a href="#">
	            	주문요청</a>
	            <a href="#">
	            	환불조회</a>
	         </div>
          </li>
         </div>
         
         <div class="menu_c">
         <li>
         	<a class="main_menu" href="#">
         		매출조회</a>
          </li>
         </div>
         
         <div class="menu_d">
         <li>
         	<a class="main_menu" href="#">
         		공지사항</a>
          </li>
         </div>
         
         <div class="menu_e">
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

<!--컨텐츠 -->
<div class="content_area">
<div class="content">
<h1>폐기재고조회</h1>

	<div class="filter_area">
			<select class="cate">
				<option value="0" selected="selected">카테고리</option>
				<option value ="음료">음료</option>
				<option value ="빵">빵</option>
				<option value ="기타">기타</option>
			</select>
			<select class="date_cate">
				<option value="0" selected="selected">검색날짜</option>
				<option value ="폐기날짜">폐기날짜</option>
				<option value ="유통기한">유통기한</option>
			</select>
			<input type = "date" value="2021-01-01" class="start_date" />
			<input type = "date" value="2021-01-01" class="end_date"/>
			<button class="search_btn">검색</button>
		</div>
	
<table cellspacing="0">
	<colgroup>
		<col width = "12%">
		<col width = "12%">
		<col width = "15%">
		<col width = "12%">
		<col width = "12%">
		<col width = "12%">
		<col width = "15%">
		<col width = "10%">
		
	</colgroup>
	<thead>
		<tr>
			<th scope = "col" style="border-left: none;">카테고리</th>
			<th scope = "col">품목코드</th>
			<th scope = "col">품목명</th>
			<th scope = "col">폐기수량</th>
			<th scope = "col">폐기날짜</th>
			<th scope = "col">유통기한</th>
			<th scope = "col">비고</th>
			<th scope = "col"></th>
		</tr>
	</thead>
	<tbody>
	<tr >
			<td >음료</td>
			<td >D-011</td>
			<td >우유</td>
			<td >4</td>
			<td >2021-05-08</td>
			<td >2021-05-08</td>
			<td></td>
			<td><button class = "discard_cnl_btn">원복</button></td>
	</tr>
	<tr >
			<td >빵</td>
			<td >B-007</td>
			<td >올리브 쿠키</td>
			<td >3</td>
			<td >2021-05-08</td>
			<td >2021-05-10</td>
			<td>문제있음</td>
			<td><button class = "discard_cnl_btn">원복</button></td>
	</tr>
	<tr >
			<td >음료</td>
			<td >D-011</td>
			<td >우유</td>
			<td >5</td>
			<td >2021-05-03</td>
			<td >2021-05-03</td>
			<td></td>
			<td><button class = "discard_cnl_btn">원복</button></td>
	</tr>
	<tr >
			<td >음료</td>
			<td >D-001</td>
			<td >커피원두</td>
			<td >7</td>
			<td >2021-04-28</td>
			<td >2021-05-01</td>
			<td></td>
			<td><button class = "discard_cnl_btn">원복</button></td>
	</tr>
	</tbody>
</table>
	<div class="search_area" style = "margin-top : 30px;">
		<select class="search_cate">
				<option value="0" selected="selected">검색필터</option>
				<option value ="품목코드">품목코드</option>
				<option value ="품목명">품목명</option>
		</select>
		<div class="search_info">
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