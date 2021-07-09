<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본사주문상세조회</title>
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
}

.top_menu li{
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
.history_btn{
	float:right;
	margin:0;
}
.ord_area, .ref_area{
	margin-top:100px;
}

h1 {
 font-size: 30px;
}
table {
    width: 100%;
    table-layout: fixed;
    background: #ffffff;
	margin: 10px 0px;
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
.tot_price li{
	float:right;
}
.ord_info li, .ref_info li, .tot_price li{
	font-size:19px;
	margin:10px;
	
}
.send_info_ul li{
	margin:0 10px;
}
.apv_info, .apv_date_info, .send_info, .send_date_info{
	float:right;
	font-size:19px;
}

.rsn_area{
	display: inline-block;
	vertical-align: top;
	width:calc(100% - 20px);
	margin: 20px 0px;
}
.rsn_title{
	display: inline-block;
	vertical-align: top;
	width:100%;
	height: 25px;
	background: #e8e8e8;
    padding: 10px;
    border-top: 2px solid #01a1dd;
    border-bottom: 1px solid #ffffff;
    font-weight: bold;
}
.rsn_content_area{
	display: inline-block;
	vertical-align: top;
	width:100%;
	height: 100px;
	background-color: white;
	padding: 10px;
	border-top: 1px solid #eaeaea;
	border-left: 1px solid #eaeaea;
	border-bottom: 2px solid #d9d9d9;
}
.rsn_content{
	width: calc(100% - 20px);
	height: 80px;
	padding: 10px;
	resize: none;
	border: 10;
	font-size: 15px;
	font-family: 'Malgun Gothic'
}
textarea:focus{
	outline: none;
}
.list_btn{
	margin-top:30px;
	text-align:center;
}

.list_btn button{
	width:200px;
	height: 50px;
	background-color: #01a1dd;
	font-weight: bold;
	font-size: 22px;
}

.apv_btn, .none_apv_btn{
	width:200px;
	height: 50px;
	background-color: #01a1dd;
	font-weight: bold;
	font-size: 22px;
	color: white;
	float: center;
	text-align:center;
	border:0;
	border-radius: 3px;
	margin:10px;
	cursor: pointer;
}

.none_apv_btn{
	background-color: #bf4040;
}
.btn_area{
	text-align: center;
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
button:focus{outline:none;}
</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	reloadList();
}); //ready end

function reloadList(){
	var params = $("#goForm").serialize();
	
	$.ajax({
		url : "Ord_Mang_dtls",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawList(res.list);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
}
function drawList(list){
	var html ="";
	for(var d of list){
		html += "<tr>";
		html += "<td>"+d.ITEM_NO+"</td>";
		html += "<td>"+d.ITEM_NAME+"</td>";
		html += "<td>"+d.CNT+"</td>";
		html += "<td>"+d.PRICE+"</th>";
		if(d.EXPIRY_DATE == null){
			html += "<td></td>"
		}else{
			html += "<td>"+d.EXPIRY_DATE+"</td>"
		}
		html += "</tr>";
		
	}
	$("tbody").html(html);
}
</script>
<style type="text/css"></style>
</head>
<body>
   <!-- 상단 -->
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
         		발주관리</a>
	         <div class="sub">
	            <a href="#">
	            	발주요청조회</a>
	             <a href="#">
	            	발주완료조회</a>
	         </div>
          </li>
         </div>
         
         <div class="menu_b">
         <li>
         	<a class="main_menu" href="#">
         		발송관리</a>
	         <div class="sub">
	            <a href="#">
	            	발송요청조회</a>
	             <a href="#">
	            	발송완료조회</a>
	         </div>
          </li>
         </div>
         
         <div class="menu_c">
         <li>
         	<a class="main_menu" href="#">
         		환불관리</a>
	         <div class="sub">
	            <a href="#">
	            	환불요청조회</a>
	             <a href="#">
	            	환불완료조회</a>
	         </div>
          </li>
         </div>
         
         <div class="menu_d">
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
         
         <div class="menu_e">
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
         
            <div class="menu_f">
	         <li>
			<a class="main_menu" href="#"> 
		        		카테고리관리</a>
		          	<div class="sub">
					<a href="#">
		            	공지카테고리</a>
		            <a href="#">
		            	품목카테고리</a>
		            <a href="#">
		            	메뉴카테고리</a>
		            </div>
	          </li>
         </div>
         
         <div class="menu_g">
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
          <div class="menu_h">
         	<li>
         		<a class="main_menu" href="#"> 
         			공지사항</a>
	        </li>
         </div>
         <div class="menu_i">
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
          <div class="menu_j">
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
<form action = "#" id = "goForm" method = "post">
	<input type = "hidden" id = "oNo" name = "oNo" value="${param.oNo}"/>
	<input type = "hidden" id = "page" name = "page" value = "${param.page}"/>
	<input type = "hidden" name = "search_filter" value = "${param.search_filter}"/>
	<input type = "hidden" name="search_old_txt" id="search_old_txt" value="${param.search_input}"/>
</form>
<div class="content_area">
<div class="content">
<h1>주문조회</h1>
<div class="ord_area">
<button class="history_btn">전체이력</button>
<h2>주문서</h2>
<ul class="ord_info">
<li><strong>주문번호 : </strong>${param.oNo}</li>
<li><strong>주문날짜 : </strong>${param.oEd}</li>
<li><strong>지점명 : </strong>${param.bN}</li>
<li class="apv_info"><strong>처리상태 : </strong><span class="apv_stat" style="color:red">${param.cN}</span></li>
<c:choose>
<c:when test ="${param.pD ne 'undefined'}"><li class="apv_date_info"><strong>처리날짜 : </strong>${param.pD}</li></c:when>
</c:choose>
</ul>
<table cellspacing="0">
	<colgroup>
		<col width="20%">
		<col width="20%">
		<col width="20%">
		<col width="20%">
		<col width="20%">
	</colgroup>
	<thead><tr>
		<th scope="col" style="border-left: none;">품목코드</th>
		<th scope="col">품목명</th>
		<th scope="col">수량(개)</th>
		<th scope="col">가격(원)</th>
		<th scope="col">유통기한</th>
	</tr>
</thead>
<tbody></tbody>
</table>
<ul class="tot_price">
<li><strong>전체 상품 금액 : </strong>158000원</li>
</ul>
<div class="rsn_area">
	<div class="rsn_title">승인거부 시 사유 작성란(필수)</div>
	<div class="rsn_content_area">
	<c:choose>
	<c:when test="${param.nAr eq 'undefined'}"><textarea class="rsn_content"></textarea></c:when>
	<c:otherwise>
	<textarea class="rsn_content" disabled=disabled>${param.nAr}</textarea>
	</c:otherwise>
	</c:choose>
</div>
</div>
<div class="btn_area">
	<button class="apv_btn">승인</button>
	<button class="none_apv_btn">승인거부</button>
</div>
</div>
<div class="ref_area">
<h2>환불요청서</h2>
<ul class="ref_info">
<li><strong>접수번호 : </strong>2021042868313</li>
<li><strong>접수날짜 : </strong>2021-04-28</li>
<li class="apv_info"><strong>처리상태 : </strong><span class="apv_stat" style="color:red">승인대기</span></li>
<li class="apv_date_info"><strong>처리날짜 : </strong>2021-04-29</li>
</ul>
<table cellspacing="0">
	<colgroup>
		<col width="10%">
		<col width="20%">
		<col width="10%">
		<col width="15%">
		<col width="15%">
		<col width="10%">
		<col width="20%">
	</colgroup>
	<tbody>
	<tr>
		<th scope="col" style="border-left: none;">품목코드</th>
		<th scope="col">품목명</th>
		<th scope="col">주문수량(개)</th>
		<th scope="col">가격(원)</th>
		<th scope="col">유통기한</th>
		<th scope="col">환불요청수량</th>
		<th scope="col">환불사유</th>
	</tr>
	<tr>
		<td><a href="#">A-2134</a></td>
		<td>유자청</td>
		<td>1</td>
		<td>5,000</td>
		<td>2022-03-01</td>
		<td>1</td>
		<td>배송상태 불량</td>
	</tr>
	<tr>
		<td><a href="#">D-103</a></td>
		<td>초코칩쿠키</td>
		<td>15</td>
		<td>30,000</td>
		<td>2021-05-30</td>
		<td>3</td>
		<td>일부 깨진 채 배송</td>
	</tr>
	</tbody>
</table>
	<ul class="tot_price">
		<li><strong>총 환불예상 금액 : </strong>11,000원</li>
</ul>
<div class="rsn_area">
	<div class="rsn_title">승인거부 시 사유 작성란(필수)</div>
	<div class="rsn_content_area"><textarea class="rsn_content"></textarea></div>
</div>
<div class="btn_area">
	<button class="apv_btn">승인</button>
	<button class="none_apv_btn">승인거부</button>
</div>
</div>
<div class="list_btn">
<button>목록</button>
</div>
</div>
</div>