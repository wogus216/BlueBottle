<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일자별 매출조회 및 환불</title>
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
	width: 1350px;
	height: 900px;
	margin: 0 auto;
	margin-top: 60px;
	text-align: center;
}

.contentA{
	display: inline-block;
	vertical-align: top;
    margin-left: 30px;
    margin-right: 15px;
    width: 90%;
}

.contentB {
	display: none;
	vertical-align: top;
	width: 40%;
}
/* 게시판 */
.head{
	display: inline-block;
	float: left;
	vertical-align: top;
}
h1 {
 margin-bottom: 42px;
 font-size: 30px;
 float: left;
}

table {
    width: 100%;
    table-layout: fixed;
    background: #ffffff;
	margin-bottom: 10px 0;
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
	text-align: center;
}

td:first-child{
	border-left: none;
}

tbody span{
	text-decoration:underline;
	text-underline-position: under;
}
tbody span:hover{
	cursor: pointer;
	color: blue;
}

.sales_info {
	font-size: 18px;
	font-weight: 500;
	width: 100%;
	line-height: 60px;
	display: inline-block;
	vertical-align: bottom;
}
.sales_info .info {
	display: inline-block;
	vertical-align: bottom;
	float: left;
}

.contentB .sales_info span{
	vertical-align: middle;
	margin-right: 10px;
	margin-left: 3px;
	float: left;
}
.contentB .sales_info span:nth-of-type(3){
	vertical-align: middle;
	color: red;
	font-size: 20px;
	float: right;
	margin-right: 3px;
}

#ref_btn{
	background-color: #bf4040;
	float: right;
	vertical-align: bottom;
}
.tot_price #tot_pay{
	color: red;
}
.tot_price {
	display: inline-block;
	vertical-align: top;
	float: right;
}
.tot_price span {
	margin-right:5px;
}

input[type='button']{
	color: white;
	width: 100px;
	height: 40px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:18px;
	cursor: pointer;
	outline:none;
	margin: 10px;
	vertical-align: bottom;
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
	
	reloadListA();
	
	$(".contentA .page_btn").on("click","button",function(){
		$(".contentA #page").val($(this).attr("page"));
		reloadListA();
	}); 
	
	$(".contentA .list_btn").on("click", function() {
		$("#actionForm").attr("action", "B_Sales");
		$("#actionForm").submit();
	}); 
	
	$(".contentA tbody").on("click", "span", function() {
		$("#sales_no").val($(this).parent().parent().attr("salesNo"));
		$("#sales_price").val($(this).parent().parent().attr("salesPrice"));
		$(".contentA").css("width","55%");
		$(".contentB").css("display", "inline-block");
		$(".contentB .sales_info").html("");
		reloadListB();	
	});// tr click end
	
	$(".contentB .sales_info").on("click", "#ref_btn", function() {
		makePopup("환불","해당 판매를 전체 환불하시겠습니까?", function() {
			
			var params = $(".contentA #actionForm").serialize();
			
			$.ajax({
				url: "cnlSales",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res) {
					reloadListA();
					reloadListB();
				},
				error: function(request, status, error) {
					console.log(error);
				}
				
			}); //ajax end
		}); // makePopup end
		
	}); //ref_btn click end
	
});//document ready end


function reloadListA(){
	var params = $(".contentA #actionForm").serialize();
	
	$.ajax({
		url: "getSalesDetail",
		type: "post",
		dataType: "json",
		data: params,
		success: function(res) {
			totSales();
			drawListA(res.list);
		},
		error: function(request, status, error) {
			console.log(error);
		}
		
	}); //ajax end
}

function reloadListB(){
	var params = $(".contentA #actionForm").serialize();
	$.ajax({
		url: "getSalesDetailDetail",
		type: "post",
		dataType: "json",
		data: params,
		success: function(res) {
			drawListB(res.list);
		},
		error: function(request, status, error) {
			console.log(error);
		}
		
	}); //ajax end
}

function totSales(){
	
	var params = $(".contentA #actionForm").serialize();
	
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
		$(".contentA .sales_info #card_pay").html("<strong>카드결제: </strong>" + d.CARD_PAY + "원");
		$(".contentA .sales_info #cash_pay").html("<strong>현금결제: </strong>" + d.CASH_PAY + "원");
		$(".contentA .sales_info #tot_pay").html("<strong>총결제금액: </strong>" + d.TOT_PAY + "원");
	}
	
}

function drawListA(list) {
	console.log(list);
	var html = "";
	
	for(d of list) {	
		var card = addComma(d.CARD_PAY);
		var cash = addComma(d.CASH_PAY);
		var tot = addComma(d.TOT_PAY);
		
		if(d.CNL_DATE == "11/11/11") {
			html += "<tr salesNo = \""+ d.SALES_NO +"\" salesPrice = \""+ tot +"\" cnlDate = \""+ d.CNL_DATE +"\">";
			html += "<td>"+ d.NUM +"</td>     ";
			html += "<td>"+ d.ENROLL_TIME +"</td>";
			html += "<td><span>"+ d.SALES_NO +"</span></td>   ";
			html += "<td>"+ card +"</td>   ";
			html += "<td>"+ cash +"</td>   ";
			html += "<td>"+ tot +"</td>    ";
			html += "</tr>";
		} 
		else{
			html += "<tr style=\"color:red;\"salesNo = \""+ d.SALES_NO +"\" salesPrice = \""+ tot +"\" cnlDate = \""+ d.CNL_DATE +"\">";
			html += "<td>"+ d.NUM +"</td>     ";
			html += "<td>"+ d.ENROLL_TIME +"</td>";
			html += "<td><span>"+ d.SALES_NO +"</span></td>   ";
			html += "<td>"+ card +"</td>   ";
			html += "<td>"+ cash +"</td>   ";
			html += "<td>"+ tot +"(환불)</td>    ";
			html += "</tr>";
		}		
	}
	
	$(".contentA tbody").html(html);
	
}

function drawListB(list) {
	console.log(list);
	var html = "";
	
	for(d of list) {	
		var price = addComma(d.PRICE);
		
		html += "<tr cnlDate=\""+ d.CNL_DATE + "\">";
		html += "<td>"+ d.ROWNUM +"</td>";
		html += "<td>"+ d.MENU_NAME +"</td>     ";
		html += "<td>"+ d.CNT +"</td>";
		html += "<td>"+ d.PRICE +"</td>   ";
		html += "</tr>";
	}	
	$(".contentB tbody").html(html);
	$(".contentB .sales_info").html("<span><strong>판매번호: </strong>" + $("#sales_no").val() + "</span>");
	$(".contentB .sales_info").append("<span><strong>판매금액: </strong>"+ $("#sales_price").val() + "</span>");
	
	if($(".contentB tbody tr").attr("cnlDate") == "11/11/11") {
		$(".contentB .sales_info").append("<input type=\"button\" id=\"ref_btn\" value=\"환불\"/>");
	}
	else{
		$(".contentB .sales_info").append("<span><strong>환불완료</strong></span>");
	}
		
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
	html+= 			"<input type=\"button\"  value=\"취소\"  class=\"cnl_btn\" style=\"background-color: rgb(190, 190, 190)\">";	
	html+= 			"<input type=\"button\" value=\"확인\"  class=\"confirm_btn\" style=\"background-color: rgb(41, 128, 185)\">";	
	html+= 	 	"</div>";
	html+= "</div>";	
	
	$("body").prepend(html);
	$(".popup_area").hide().show();
	
	$(".cnl_btn, .close_btn").on("click",function(){
		closePopup();
	});	
	$(".confirm_btn").on("click",function(){
		if(func !=null){
			func.call();
	}
		closePopup();
	});
}


function closePopup() {
	$(".bg, .popup_area").fadeOut(function(){
		$(".bg, .popup_area").remove();
	}); //popup_btn end
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
<div class="contentA">
<form action="#" method="post" id="actionForm">
	<input type="hidden" id="page" name="page" value="${param.page}" />
	<input type="hidden" id="enroll_date" name="enroll_date" value="${param.enroll_date}" />
	<input type ="hidden" id="start_date" name="start_date" value="${param.start_date}" />
	<input type="hidden" id="end_date" name="end_date" value="${param.end_date}" />
	<input type="hidden" id="brch_no" name="brch_no" value="${param.brch_choice}"/>
	<input type="hidden" id="sales_no" name="sales_no"/>
	<input type="hidden" id="sales_price" name="sales_price"/>
</form>
<div class="head"><h1 >일자별 매출액조회</h1></div>
<div class="sales_info">
	<div class="info">
		<span><strong>조회날짜 : </strong>${param.enroll_date}</span>
	</div>
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
			<col width="25%">
			<col width="18%">
			<col width="18%">
			<col width="18%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col" style="border-left: none;">No.</th>
				<th scope="col">판매시간</th>
				<th scope="col">판매번호</th>
				<th scope="col">카드결제(원)</th>
				<th scope="col">현금결제(원)</th>
				<th scope="col">총결제금액(원)</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
<input type="button" class="list_btn" value="목록"/>

</div> <!--contentA end  -->

<div class="contentB">

	<div class="head"><h1 >상세조회 및 환불</h1></div>
	<div class="sales_info"></div>
	<table cellspacing="0">
		<colgroup>
			<col width="15%">
			<col width="35%">
			<col width="20%">
			<col width="30%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col" style="border-left: none;">No.</th>
				<th scope="col">품목</th>
				<th scope="col">수량</th>
				<th scope="col">가격</th>
			</tr>
		<thead>
		<tbody>
		</tbody>
	</table>
	
</div><!--contentB end -->
	
</div> <!--content_area end -->
</html>