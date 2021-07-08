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
	height: 100%;
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

.stock_rel_history thead,.stock_discard_history thead{
	display : table;
	table-layout : fixed;
	width : 1250px;
}

.stock_rel_history tbody,.stock_discard_history tbody{
	display : block;
	max-height : 287px;
	width : 1250px;
	overflow : auto;
	overflow-x : hidden;
}

.stock_rel_history tr,.stock_discard_history tr{
	display : table;
	table-layout : fixed;
	width : 1250px;
}

td:first-child{
	border-left: none;
}

.stock_discard_history td:nth-child(7){
	padding : 0px;
	text-align: center;
}

input{
	width:220px;
	height:20px;
}

.item_info, .button_area{
	display: inline-block;
	vertical-align: top;
}

.button_area{
	float: right;
}


label{
	font-weight: bold;
	font-size : 15pt;
	margin-bottom : 50px;
}

.item_info li{
	font-size:19px;
	margin:10px;
	height : 40px;
	
}
.item_info ul{
	max-width: 1000px; 
}

.search_btn,.stock_add_btn,.discard_btn,.discard_cnl_btn,.discard_submit_btn{
	height: 40px;
	margin: 0 ;
	padding: 0;
	vertical-align: bottom;
}

.discard_btn,.discard_cnl_btn{
	background-color: #bf4040;
}

.discard_cnl_btn,.discard_submit_btn{
	display: none;
}

.discard_cnl2_btn{ /* 원복 버튼에 사용할 것 이름 다시 지어야함*/
	background-color: #bf4040;
	width: 50px;
	height: 30px;
	font-size:15px;
	margin: 0px;
}
select{
	font-size: 15px;	
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
	background-color: #01a1dd;
	outline:none;
}

.list_btn{
	text-align:center;
}

.list_btn button{
	width:200px;
	height: 50px;
	background-color: #01a1dd;
	font-weight: bold;
	font-size: 22px;
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

</style>


<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	draw_stock_tb();
	
	$(".top_menu").on("click","a",function(){
		$(".top_menu a").attr("style","color: black");
		$(this).css("color", "#01a1dd");
		$(this).parent().parent().children(1).css("color", "#01a1dd");
	});
	$(".sub").hover(function(){
		$(".top li").css("background-color","white");
		$(this).parent("li").css("background-color","#f1f1f1");
	
	},function(){
			$(".top li").css("background-color","white");
	});
	
	$(".stock_add_btn").on("click",function(){
		location.href = "H_stock_plus.html";
	});
	
	$(".discard_btn").on("click",function(){
		draw_discard_tb();
		$(".discard_btn").hide();
		$(".stock_add_btn").hide();
		$(".discard_cnl_btn").show();
		$(".discard_submit_btn").show();
	});
	
	$(".discard_cnl_btn").on("click",function(){
		draw_stock_tb();
		$(".discard_btn").show();
		$(".stock_add_btn").show();
		$(".discard_cnl_btn").hide();
		$(".discard_submit_btn").hide();
	});
	
	$(".discard_submit_btn").on("click",function(){
		draw_stock_tb();
		$(".discard_btn").show();
		$(".stock_add_btn").show();
		$(".discard_cnl_btn").hide();
		$(".discard_submit_btn").hide();
	});
	
}); //ready end

function draw_stock_tb(){//재고 테이블 그리기
	
	var html ="";
	
	html += "<tr>";
	html += "<th style=\"border-left: none;\">품목명</th>";
	html += "<th>재고수량</th>";
	html += "<th>유통기한</th>";
	html += "<th>입고날짜</th>";
	html += "</tr>";
	
	$(".stock_tb thead").html(html);
	
	html ="";
	
	html += "<tr>";
	html += "<td>우유</td>";
	html += "<td>4</td>";
	html += "<td>2021-05-08</td>";
	html += "<td>2021-05-01</td>";
	html += "</tr>";
	
	
	$(".stock_tb tbody").html(html);
}

function draw_discard_tb(){
	
	var html ="";
	
	html += "<tr>";
	html += "<th style=\"border-left: none;\">품목명</th>";
	html += "<th>재고수량</th>";
	html += "<th>폐기수량</th>";
	html += "<th>유통기한</th>";
	html += "<th>입고날짜</th>";
	html += "</tr>";
	
	$(".stock_tb thead").html(html);
	
	html ="";
	
	html += "<tr>";
	html += "<td>우유</td>";
	html += "<td>4</td>";
	html += "<td style = \"padding : 0px; text-align: center;\"><input type=\"number\" min = 0 maxlength=\"10\"></td>";
	html += "<td>2021-05-08</td>";
	html += "<td>2021-05-01</td>";
	html += "</tr>";
	
	$(".stock_tb tbody").html(html);
}

</script>
</head>
<body>
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
	        		픔목관리</a>
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
  <!--컨텐츠 -->
<div class="content_area">
<div class="content">
<h1>재고상세조회</h1>
<ul class="item_info">
<li><strong>품목번호 : </strong>D-011</li>
</ul>
<div class="button_area">
			<button class="stock_add_btn">추가</button>
			<button class="discard_btn" style= "margin:0px 0px 0px 10px;">폐기</button>
			<button class="discard_submit_btn" >완료</button>
			<button class="discard_cnl_btn" style= "margin:0px 0px 0px 10px;">취소</button>
		</div>

<div class = "stock_tb">
<table cellspacing="0">
	
	<thead></thead>
	<tbody>
	
	</tbody>
</table>
</div>
<div class = "stock_rel_history">
<h2 style ="padding-top: 50px;">재고출고이력</h2>
<table cellspacing="0">
	<colgroup>
		<col width="10%">
		<col width="10%">
		<col width="10%">
		<col width="10%">
		<col width="10%">
		<col width="10%">
		<col width="10%">
	</colgroup>
	<thead>
	<tr>
		<th scope="col" style="border-left: none;">주문번호</th>
		<th scope="col">품목코드</th>
		<th scope="col">품목명</th>
		<th scope="col">수량</th>
		<th scope="col">유통기한</th>
		<th scope="col">등록일</th>
		<th scope="col">지점명</th><!-- 사용자번호와 fk관계이기에 테이블 합쳐서 불러오기 가능  -->
	</tr>
	</thead>
	<tbody>
	<tr>
		<td><a href = "#">2021062868315</a></td>
		<td>D-011</td>
		<td>우유</td>
		<td>5</td>
		<td>2021-10-30</td>
		<td>2021-06-28</td>
		<td>망원점</td>
	</tr>
	<tr>
		<td><a href = "#">2021062868315</a></td>
		<td>D-011</td>
		<td>우유</td>
		<td>5</td>
		<td>2021-10-30</td>
		<td>2021-06-28</td>
		<td>망원점</td>
	</tr>
	<tr>
		<td><a href = "#">2021062868315</a></td>
		<td>D-011</td>
		<td>우유</td>
		<td>5</td>
		<td>2021-10-30</td>
		<td>2021-06-28</td>
		<td>망원점</td>
	</tr>
	<tr>
		<td><a href = "#">2021062868315</a></td>
		<td>D-011</td>
		<td>우유</td>
		<td>5</td>
		<td>2021-10-30</td>
		<td>2021-06-28</td>
		<td>망원점</td>
	</tr>
	<tr>
		<td><a href = "#">2021062868315</a></td>
		<td>D-011</td>
		<td>우유</td>
		<td>5</td>
		<td>2021-10-30</td>
		<td>2021-06-28</td>
		<td>망원점</td>
	</tr>
	<tr>
		<td><a href = "#">2021062868315</a></td>
		<td>D-011</td>
		<td>우유</td>
		<td>5</td>
		<td>2021-10-30</td>
		<td>2021-06-28</td>
		<td>망원점</td>
	</tr>
	<tr>
		<td><a href = "#">2021062868315</a></td>
		<td>D-011</td>
		<td>우유</td>
		<td>5</td>
		<td>2021-10-30</td>
		<td>2021-06-28</td>
		<td>망원점</td>
	</tr>
	<tr>
		<td><a href = "#">2021062868315</a></td>
		<td>D-011</td>
		<td>우유</td>
		<td>5</td>
		<td>2021-10-30</td>
		<td>2021-06-28</td>
		<td>망원점</td>
	</tr>
	<tr>
		<td><a href = "#">2021062868315</a></td>
		<td>D-011</td>
		<td>우유</td>
		<td>5</td>
		<td>2021-10-30</td>
		<td>2021-06-28</td>
		<td>망원점</td>
	</tr>
	<tr>
		<td><a href = "#">2021062868315</a></td>
		<td>D-011</td>
		<td>우유</td>
		<td>5</td>
		<td>2021-10-30</td>
		<td>2021-06-28</td>
		<td>망원점</td>
	</tr>
	</tbody>
</table>
</div>
<div class = "stock_discard_history">
<h2 style ="padding-top: 50px;">재고폐기이력</h2>
<table cellspacing="0">
	<colgroup>
		<col width="25%">
		<col width="25%">
		<col width="25%">
		<col width="25%">
		<col width="25%">
		<col width="25%">
		<col width="25%">
	</colgroup>
	<thead>
	<tr>
			<th scope = "col" style="border-left: none;">품목코드</th>
			<th scope = "col">품목명</th>
			<th scope = "col">폐기날짜</th>
			<th scope = "col">수량</th>
			<th scope = "col">유통기한</th>
			<th scope = "col">비고</th>
			<th scope = "col"></th>
	</tr>
	</thead>
	<tbody>
	<tr >
			<td >D-011</td>
			<td >우유</td>
			<td >2021-05-08</td>
			<td >5</td>
			<td >2021-05-07</td>
			<td></td>
			<td><button class = "discard_cnl2_btn">원복</button></td><!-- 원복 클래스 명 아직 못지음 -->
	</tr>
	<tr >
			<td >D-011</td>
			<td >우유</td>
			<td >2021-05-06</td>
			<td >5</td>
			<td >2021-05-06</td>
			<td></td>
			<td><button class = "discard_cnl2_btn">원복</button></td>
	</tr>
	<tr >
			<td >D-011</td>
			<td >우유</td>
			<td >2021-05-03</td>
			<td >5</td>
			<td >2021-05-03</td>
			<td></td>
			<td><button class = "discard_cnl2_btn">원복</button></td>
	</tr>
	<tr >
			<td >D-011</td>
			<td >우유</td>
			<td >2021-05-02</td>
			<td >5</td>
			<td >2021-05-02</td>
			<td></td>
			<td></td>
	</tr>
	<tr >
			<td >D-011</td>
			<td >우유</td>
			<td >2021-05-06</td>
			<td >5</td>
			<td >2021-05-06</td>
			<td></td>
			<td></td>
	</tr>
	<tr >
			<td >D-011</td>
			<td >우유</td>
			<td >2021-05-06</td>
			<td >5</td>
			<td >2021-05-06</td>
			<td></td>
			<td></td>
	</tr>
	<tr >
			<td >D-011</td>
			<td >우유</td>
			<td >2021-05-06</td>
			<td >5</td>
			<td >2021-05-06</td>
			<td></td>
			<td></td>
	</tr>
	<tr >
			<td >D-011</td>
			<td >우유</td>
			<td >2021-05-06</td>
			<td >5</td>
			<td >2021-05-06</td>
			<td></td>
			<td></td>
	</tr>
	<tr >
			<td >D-011</td>
			<td >우유</td>
			<td >2021-05-06</td>
			<td >5</td>
			<td >2021-05-06</td>
			<td></td>
			<td></td>
	</tr>
	<tr >
			<td >D-011</td>
			<td >우유</td>
			<td >2021-05-06</td>
			<td >5</td>
			<td >2021-05-06</td>
			<td></td>
			<td></td>
	</tr>
	</tbody>
</table>
</div>
<div class="list_btn">
<button style = "margin:50px 0 50px 0;">목록</button>
		</div>
	</div>
</div>
</body>
</html>