<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지점매출액상세조회</title>
<style type="text/css">

/* 상단 바 */
.top {
   width: 100%;
   padding: 0;
   margin: 0;
   background-color: white;
   display: inline-block;
   min-width: 1300px;
    height: 62px;
}

.top_menu{
	display: inline-block;
	vertical-align: top;
	float: right ;
	width: 800px;
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

.sub a:hover {
     background-color: #f1f1f1;
}

.menu_a:hover .sub, .menu_b:hover .sub ,.menu_c:hover .sub,.menu_d:hover .sub,
.menu_e:hover .sub  {
    display: block;
}

.log_out{
	display:inline-block;
	text-decoration: none;
	color: gray;
	padding:10px 20px;
	line-height: 42px;
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
/* 게시판 */

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

td:first-child{
	border-left: none;
}

table td {
	text-align: center;
}

.sales_info {
	font-size: 20px;
	width: 100%;
}

.sales_info span{
	font-weight: 500;
	font-size: 18px;
	vertical-align: middle;
	margin-left: 15px;
}
.sales_info #tot_pay{
	color: red;
}
.tot_price {
	display: inline-block;
	float: right;
}
.tot_price span{
	font-size:19px;
	margin:10px;
}

input[type='button']{
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
}

.page_area{
	text-align: center;
	margin-top: 30px;
}
.page_btn{
	display: inline-block;
	width: 400px;
	text-align: center;
	vertical-align: bottom;
	margin: 10px;
}

.page_btn button{
	color: black;
	width: 40px;
	height: 40px;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin:0px 3px;
	box-shadow: 0px 2px 4px 0px rgba(0,0,0,0.2);
}
.page_btn button:hover{
	color: #01a1dd;
	cursor: pointer;
}

.page_btn button:focus{
	outline:none;
}

.page_btn button{
	background-color: white;
}

.on {
	font-weight: bold;
}

.list_btn {
	width:200px;
	height: 50px;
	background-color: #01a1dd;
	font-weight: bold;
	font-size: 22px;
	float: left;
	vertical-align: bottom;
	margin: 0px;
}

</style>

<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	reloadList();
	
	$(".page_btn").on("click","button",function(){
		$("#page").val($(this).attr("page"));
		reloadList();
	}); 
	
	$(".list_btn").on("click", function() {
		$("#actionForm").attr("action", "B_Sales");
		$("#actionForm").submit();
	}); 
	
});//document ready end

function reloadList(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url: "getSalesDetail",
		type: "post",
		dataType: "json",
		data: params,
		success: function(res) {
			totSales();
			drawList(res.list);
			drawPaging(res.pb);
		},
		error: function(request, status, error) {
			console.log(error);
		}
		
	}); //ajax end
}

function totSales(){
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url: "getSalesDetailAll",
		type: "post",
		dataType: "json",
		data: params,
		success: function(res) {
			getTotSales(res.list);
		},
		error: function(request, status, error) {
			console.log(error);
		}
		
	}); //ajax end
}

function getTotSales(list) {
	
	for(d of list) {
		$(".sales_info #card_pay").html("카드결제: " + d.CARD_PAY + "원");
		$(".sales_info #cash_pay").html("현금결제: " + d.CASH_PAY + "원");
		$(".sales_info #tot_pay").html("총결제금액: " + d.TOT_PAY + "원");
	}
	
}

function drawList(list) {
	
	var html = "";
	
	for(d of list) {	
		var card = addComma(d.CARD_PAY);
		var cash = addComma(d.CASH_PAY);
		var tot = addComma(d.TOT_PAY);
		
		html += "<tr salesNo = \""+ d.SALES_NO +"\">";
		html += "<td>"+ d.NUM +"</td>     ";
		html += "<td>"+ d.ENROLL_TIME +"</td>";
		html += "<td>"+ d.SALES_NO +"</td>   ";
		html += "<td>"+ card +"</td>   ";
		html += "<td>"+ cash +"</td>   ";
		html += "<td>"+ tot +"</td>    ";
		html += "</tr>";
	}
	
	$("tbody").html(html);
}

function drawPaging(pb){
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

//천단위 콤마 찍기
function addComma(value){
	value = String(value);
    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return value; 
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
         		<a class="main_menu" href="#">재고관리</a>
	        	 <div class="sub">
		        	 <a href="#">현재재고조회</a>
		             <a href="#">입고재고조회</a>
		             <a href="#">사용재고조회</a>
		             <a href="#">폐기조회</a>
	            </div>
             </li>
         </div>
         
         <div class="menu_b">
       		  <li>
         		<a class="main_menu" style="padding: 20px 40px;" href="#">주문관리 </a>
	          	<div class="sub">
	     			<a href="#">주문조회 및 환불</a>
	     			<a href="#">주문요청</a>
		            <a href="#">환불조회</a>
	            </div>
          	</li>
         </div>
         
          <div class="menu_c">
        	 <li>
				<a class="main_menu" href="#">매출조회</a>
             </li>
         </div>
        
          <div class="menu_d">
         	<li>
         		<a class="main_menu" href="#">공지사항</a>
	        </li>
          </div>
      
          <div class="menu_e">
           	<li>
               <a class="main_menu" href="#">마이페이지</a>
          	</li>
          </div>
          
           <a class="log_out" href="#">로그아웃</a>
      	</div><!-- top_munu end -->
      </ul>
 </div>  <!-- top end -->

<!--컨텐츠 -->
<div class="content_area">
<div class="content">
<form action="#" method="post" id="actionForm">
	<input type="hidden" id="page" name="page" value="${page}" />
	<input type="hidden" id="enroll_date" name="enroll_date" value="${param.enroll_date}" />
	<input type ="hidden" id="start_date" name="start_date" value="${param.start_date}" />
	<input type="hidden" id="end_date" name="end_date" value="${param.end_date}" />
</form>
<h1 >일자별 매출액조회</h1>
<div class="sales_info">
	<strong>조회날짜 : </strong>${param.enroll_date}
	<div class="tot_price">
		<span id="card_pay"></span>
		<span id="cash_pay"></span>
		<span id="tot_pay"></span>
	</div>
</div>
<table cellspacing="0">
	<colgroup>
		<col width="10%">
		<col width="13%">
		<col width="20%">
		<col width="18%">
		<col width="18%">
		<col width="18%">
	</colgroup>
	<thead>
		<tr>
			<th scope="col" style="border-left: none;">No.</th>
			<th scope="col">판매시간</th>
			<th scope="col">판매번호</th>
			<th scope="col">카드매출(원)</th>
			<th scope="col">현금매출(원)</th>
			<th scope="col">총매출(원)</th>
		</tr>
	<thead>
	<tbody>
	</tbody>
</table>
	<div class="page_area">
		<div class="page_btn">
		</div>	
		<input type="button" class="list_btn" value="목록"/>
	</div>	
	</div> <!--content end  -->
</div> <!--content_area end -->
</html>