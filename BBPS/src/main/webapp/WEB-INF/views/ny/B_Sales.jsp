<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지점매출조회</title>
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
	width: 800px;;
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
 width: 90%;
 margin-bottom: 40px;
 margin-left: 30px;
 font-size: 30px;
}
table {
    width: 90%;
    table-layout: fixed;
    background: #ffffff;
	margin: 10px 0;
	margin-left: 30px;
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
tbody span {
	text-decoration:underline;
	text-underline-position: under;
}
tbody span:hover{
	cursor: pointer;
	color: blue;
}
tbody td {
	text-align: right;
}
tbody td:first-child{
	text-align: center;
}

input{
	width:150px;
	height:40px;
	margin:10px 5px;
}

.sales_info, .tot_sales{
	width: 90%;
	float: center;
	text-align: right;
	margin-left: 30px;
}

.sales_info span {
	font-weight: bold;
	vertical-align: middle;
}

.tot_sales span{
	font-weight: 500;
	font-size: 18px;
	vertical-align: middle;
	margin-left: 15px;
}

.tot_price{
	color: red;
	font-size: 20px;
}
.search_btn, .graph_btn, .reset_btn{
	height: 40px;
	vertical-align: bottom;
}
.search_btn{
	background-color: #01a1dd;
}
.graph_btn{
	background-color: #bf4040;
	margin-right: 0px;
}
.reset_btn {
	background-color: #b3b3b3;
}

input[type='date'] hover {
    cursor: pointer;
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

.page_area, .page_btn{
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

/*팝업*/
.bg{
	display: inline-block;
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0px;
	left: 0px;
	background-color: #000000;
	z-index: 200;
	opacity: 0.6; /* 0.0(투명)~1.0(불투명)*/
}
.popup_area {
	display: inline-block;
	width: 400px;
	height: 240px;
	background-color: #ffffff;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	position: absolute;
	top: calc(50% - 120px); /*높이의 반만큼 뺌*/
	left: calc(50% - 200px); /*너비의 반만큼 뺌*/
	z-index: 300;
}
.popup_head{
	height: 30px;
	font-size: 16pt;
	background-color: #01a1dd;
	color:white;
	padding:10px;
	font-weight:bold;
}
.popup_btn{
	text-align:center;
}
.popup_btn input[type='button']{
	color: white;
	width: 150px;
	height: 40px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin:10px;
	cursor: pointer;
}
.popup_content{
	margin-bottom:80px;
	margin-top:20px;
	margin-left:20px;
	text-align:center;
	font-size:18px;
	color: black
}
input[type='button']:focus{outline:none;}

.popup_head .close_btn{
	width: 25px;
	height: 25px;
	background-color: #01a1dd;
	float: right;
	margin: 0px;
	font-size: 18px;
	text-align: center;
	color: #ffffff;
	border: none;
}

</style>

<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript"> 
$(document).ready(function() {
	
	reloadList();
	totSales();
	
	$(".page_btn").on("click","button",function(){
		$("#page").val($(this).attr("page"));
		reloadList();
	}); 
	
	$(".reset_btn").on("click", function() {
		$("#start_date").val("");
		$("#end_date").val("");
	});//reset_btn click end
	
	$(".search_btn").on("click", function() {
		reloadList();
		$(".tot_sales_price").html("");
		$(".tot_expense_price").html("");
		$(".tot_price").html("");
		totSales();
	});// search_btn click end
	
	$(".graph_btn").on("click",function() {
		location.href = "B_Chart";
	});
	
	$("tbody").on("click", "span", function() {
		if($(this).html() == "0") {
			makePopup("", "해당 일자의 매출 정보가 없습니다.", null);
		} 
		else{
			if($(this).parent().attr("id") == "sales") {
				$("#enroll_date").val($(this).parent().parent().attr("date"));
				$("#actionForm").attr("action","B_Sales_Detail");
				$("#actionForm").submit();		
			}
			if($(this).parent().attr("id") == "expense") {
				$("#enroll_date").val($(this).parent().parent().attr("date"));
				$("#actionForm").attr("action","");
				$("#actionForm").submit();		
			}
		}
				
	 });// td click end 
	
	
});// document ready end
	
function reloadList() {

	var params = $("#actionForm").serialize();

	console.log(params);
	$.ajax({
		url: "getSalesList",
		type: "post",
		dataType: "json",
		data: params,
		success: function(res) {
			drawList(res.list);
			drawPaging(res.pb);
		},
		error: function(request, status, error) {
			console.log(error);
		}
		
	}); //ajax end
}

function drawList(list) {
	var html = "";
	console.log(list);
	for(var d of list) {
		
		var S = addComma(d.SALES_PRICE);
		var O = addComma(d.ORD_PRICE);
		var N = addComma(d.NET_PRICE);
		
		html += "<tr date=\"" + d.ENROLL_DATE + "\">";
		html += "<td>" + d.ENROLL_DATE + "</td>     ";
		html += "<td id=\"sales\"><span>" + S + "</span></td>     ";
		html += "<td id=\"expense\"><span>" + O + "</span></td>     ";
		html += "<td>" + N + "</td>     ";
		html += "</tr>                ";
	}
	
	$("tbody").html(html);
}

//총 매출,지출액 정보
function totSales() {
	var params = $("#actionForm").serialize();

	console.log(params);
	$.ajax({
		url: "getTotSales",
		type: "post",
		dataType: "json",
		data: params,
		success: function(res) {
			totPrice(res.list);
		},
		error: function(request, status, error) {
			console.log(error);
		}
		
	}); //ajax end
}
function totPrice(list){
	
	var sHtml = 0;
	var eHtml = 0;
	var pHtml = 0;
	
	for(d of list) {		
		sHtml += parseInt(d.SALES_PRICE);
		eHtml += parseInt(d.ORD_PRICE);
		pHtml += parseInt(d.NET_PRICE);
	}
	
	sHtml = addComma(sHtml);
	eHtml = addComma(eHtml);
	pHtml = addComma(pHtml);
	
	$(".tot_sales_price").html("총매출액: " + sHtml + "원");
	$(".tot_expense_price").html("총지출액: " + eHtml + "원");
	$(".tot_price").html("순매출액: " + pHtml + "원");
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

//팝업
function makePopup(title, contents, func) {
	
	var html ="";
	html+= "<div class=\"bg\"></div>";	
	html+= "<div class=\"popup_area\">";	
	html+= "<div class=\"popup_head\">"+ title +"";	
	html+= 		"<input type=\"button\" value=\"X\" class=\"close_btn\">";	
	html+= "</div>";	
	html+= "<div class=\"popup_content\">"+ contents +"</div>";	
	html+= 		"<div class=\"popup_btn\">";	
	html+= 			"<input type=\"button\" value=\"확인\"  class=\"confirm_btn\"style=\"background-color: rgb(41, 128, 185)\">";	
	html+= 	 	"</div>";
	html+= "</div>";	
	
	$("body").prepend(html);
	$(".popup_area").hide().show();
	
	$(".popup_btn, .close_btn").on("click",function(){
		if(func !=null){
			func.call();
		}
		closePopup();
		});
	$(".confirm_btn").on("click",function(){
		closePopup();
	});
	}

function closePopup() {
	$(".bg, .popup_area").fadeOut(function(){
		$(".bg, .popup_area").remove();
	}); //popup_btn end
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
	<h1 >매출조회 및 환불</h1>
	<div class="sales_info">
		<form action="#" method="post" id="actionForm">
			<input type="hidden" id="brch_choice" name="brch_choice"/>
			<input type="hidden" id="enroll_date" name="enroll_date" />
			<input type="hidden" id="page" name="page" value="${page}" />
			<input type="button" class="reset_btn" value="초기화" />
			<span>시작일</span>
			<input type = "date" id="start_date" name="start_date" value="${param.start_date}" />
			<span>종료일</span>
			<input type = "date" id="end_date" name="end_date" value="${param.end_date}" />
			<input type="button" class="search_btn" value="검색" />
			<input type="button" class="graph_btn" value="그래프" />
		</form>
	</div>
	<table cellspacing="0">
		<colgroup>
			<col width="25%">
			<col width="25%">
			<col width="25%">
			<col width="25%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col" style="border-left: none;">날짜</th>
				<th scope="col">매출액(원)</th>
				<th scope="col">지출액(원)</th>
				<th scope="col">순매출액(원)</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<div class="tot_sales">
		<span class="tot_sales_price"></span>
		<span class="tot_expense_price"></span>
		<span class="tot_price"></span>
	</div>
	<div class="page_area">
		<div class="page_btn"></div>
	</div>
		
	</div> <!--content end  -->
</div> <!--content_area end -->
</html>