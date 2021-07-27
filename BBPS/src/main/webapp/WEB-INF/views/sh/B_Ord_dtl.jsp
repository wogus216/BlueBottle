<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점주문상세조회</title>
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

.list_btn button, .apv_com, .send_com{
	width: 180px;
	height: 50px;
	background-color: #01a1dd;
	font-weight: bold;
	font-size: 22px;
}

.list_btn{
	margin-top:100px;
}
.ord_cnl_btn, .ref_btn, .ref_cnl_btn, .stor_btn, .cnl_list_bnt, .ref_list_btn{
	width: 180px;
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

.ord_cnl_btn, .ref_cnl_btn{
	background-color: #bf4040;
}
.btn_area{
	text-align: center;
}
input[type=button]{
	color: white;
	width: 180px;
	height: 50px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:22px;
	margin:10px;
	cursor: pointer;
	background-color: #01a1dd;
	outline:none;
	font-weight: bold;
}
button:focus{outline:none;}
/* 팝업 */
.popup_area body {
	margin: 0px;
}
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
.popup_area{
	display: inline-block;
	width: 600px;
	height: 360px;
	background-color: #ffffff;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	position: absolute;
	top: calc(50% - 180px); /*높이의 반만큼 뺌*/
	left: calc(50% - 300px); /*너비의 반만큼 뺌*/
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
.popup_btn input{
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
	margin:20px;
	font-size:18px;
}
.popup_area table {
    width: 100%;
    table-layout: fixed;
    background: #ffffff;
	border-top: 2px solid;
	border-bottom: 2px solid;
	text-align:center;
}

.popup_area td:first-child{
	border-left: none;
}
.close_btn{
	width: 25px;
	height: 25px;
	background-color: #01a1dd;
	float: right;
	margin: 0px;
	font-size: 25px;
	cursor: pointer;
}
.ord_cnl_com_btn, .ref_cnl_com_btn, .stor_com_btn{
	cursor : default;
}
</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(".list_btn").on("click",function(){
		location.href="B_Ord_List";
	});
	$(".cnl_list_bnt").on("click",function(){
		location.href="B_Ord_List";
	});
	$(".ref_list_bnt").on("click",function(){
		location.href="B_Ord_List";
	});
	$(".ord_cnl_btn").on("click",function(){
		if(confirm("주문을 취소하시겠습니까?")){ //팝업 변경 필요
		$(".submit_btn").on("click",function(){
		var params = $("#goForm").serialize();
		
		$.ajax({
			url : "ord_cnl",
			type : "post",  
			dataType :"json",
			data : params,
			success : function(res){
				if(res.msg == "success"){
					alert("주문이 취소되었습니다.");
					$("#goForm").submit();
				}else if (res.msg == "failed"){
					alert("주문취소에 실패하였습니다.");
				}else {
					alert("주문취소 중 문제가 발생하였습니다.")
				}
			},
			error : function(request,status,error){
				console.log(error);
			}
		});
		});
		}
	});
	$(".ref_cnl_btn").on("click",function(){
		if(confirm("환불을 취소하시겠습니까?")){ //팝업 변경 필요
		var params = $("#goForm").serialize();
		
		$.ajax({
			url : "ref_cnl",
			type : "post",  
			dataType :"json",
			data : params,
			success : function(res){
				if(res.msg == "success"){
					alert("환불이 취소되었습니다.");
					$("#goForm").submit();
				}else if (res.msg == "failed"){
					alert("환불취소에 실패하였습니다.");
				}else {
					alert("환불취소 중 문제가 발생하였습니다.")
				}
			},
			error : function(request,status,error){
				console.log(error);
			}
		});
		}
	});
	$(".stor_btn").on("click",function(){
		if(confirm("입고하시겠습니까?")){ //팝업 변경 필요
		var params = $("#goForm").serialize();
		
		$.ajax({
			url : "ord_item_stor",
			type : "post",  
			dataType :"json",
			data : params,
			success : function(res){
				if(res.msg == "success"){
					alert("입고가 완료되었습니다.");
					$("#goForm").submit();
				}else if (res.msg == "failed"){
					alert("입고에 실패하였습니다.");
				}else {
					alert("입고 중 문제가 발생하였습니다.")
				}
			},
			error : function(request,status,error){
				console.log(error);
			}
		});
		}
	});
	$(".ref_btn").on("click",function(){
		$("#search_input").val($("#search_old_txt").val());
		$("#goForm").attr("action","B_Ref");
		$("#goForm").submit();
	});
}); //ready end

function makePopup(title, contents, func){
	var html ="";
	
	html+= "<div class=\"bg\"></div>";	
	html+= "<div class=\"popup_area\">";	
	html+= "<div class=\"popup_head\">"+title +"";	
	html+= 		"<button class=\"close_btn\" >X</button>";	
	html+= "</div>";	
	html+= "<div class=\"popup_content\">"+contents+"</div>";	
	html+= 		"<div class=\"popup_btn\">";	
	html+= 			"<button class=\"submit_btn\">확인</button>";	
	html+= 			"<button class=\"cnl_btn\">취소</button>";		
	html+= 	 	"</div>";	
	html+= "</div>";	
	
	$("body").prepend(html);
	$(".popup_area").hide().show();
	
	$(".cnl_btn, .close_btn").on("click",function(){
		if(func !=null){
			func.call();
		}
		closePopup();
		});
	}
function closePopup() {
	$(".bg, .popup_area").fadeOut(function(){
		$(".bg, .popup_area").remove();
	}); //popup_Btn end
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
<form action = # id = "goForm" method = "post">
	<input type = "hidden" id = "oNo" name = "oNo" value="${data.ORD_NO}"/>
	<input type = "hidden" id = "erDate" name = "erDate" value="${data.ENROLL_DATE}"/>
	<input type = "hidden" id = "page" name = "page" value = "${param.page}"/>
	<input type = "hidden" name = "search_filter" value = "${param.search_filter}"/>
	<input type = "hidden" name="search_old_txt" id="search_old_txt" value="${param.search_input}"/>
</form>
<div class="content_area">
<div class="content">
<h1>주문조회</h1>
<div class="ord_area">
<ul class="ord_info">
<li><strong>주문번호 : </strong>${data.ORD_NO}</li>
<li><strong>주문날짜 : </strong>${data.ENROLL_DATE}</li>
<li class="apv_info"><strong>처리상태 : </strong><span class="apv_stat" style="color:red">${data.CODE_NAME}</span></li>
<c:choose>
<c:when test ="${data.PROCESS_DATE ne null}"><li class="apv_date_info"><strong>처리날짜 : </strong>${data.PROCESS_DATE}</li></c:when>
</c:choose>
</ul>
<form action = "#" id = "sendForm" method = "post">
<table cellspacing="0">
	<colgroup>
		<col width="20%">
		<col width="20%">
		<col width="20%">
		<col width="20%">
		<col width="20%">
	</colgroup>
<thead>
	<tr>
		<th scope="col" style="border-left: none;">품목코드</th>
		<th scope="col">품목명</th>
		<th scope="col">수량(개)</th>
		<th scope="col">가격(원)</th>
		<th scope="col">유통기한</th>
	</tr>
</thead>
<tbody>
 	<c:forEach var="data1" items="${list}">
 		<tr>
		<td>${data1.ITEM_NO}
		<input type = "hidden" id = "iNo" name = "iNo" value="${data1.ITEM_NO}"/>
		</td>
		<td>${data1.ITEM_NAME}</td>
		<td>${data1.CNT}</td>
		<td>${data1.PRICE}</td>
		<c:choose>
			<c:when test="${data1.EXPIRY_DATE eq null}"><td></td></c:when>
			<c:otherwise>
				<td>${data1.EXPIRY_DATE}</td>
			</c:otherwise>
		</c:choose>
		</tr>
	</c:forEach>
</tbody>
</table>
</form>
<ul class="tot_price">
<li><strong>전체 상품 금액 : </strong>${data.TOT_PRICE} 원</li>
</ul>
<c:if test="${data.CODE_NAME eq '주문승인거부'}">
<div class="rsn_area">
	<div class="rsn_title">승인거부 사유</div>
	<div class="rsn_content_area">
		<textarea class="rsn_content" id = "oRsn" name="oRsn" disabled=disabled>${data.NONE_APV_RSN}</textarea>
</div>
</div>
</c:if>
<div class="btn_area">
<c:if test="${data.CODE_NAME eq '주문요청'}">
	<input type="button" class="ord_cnl_btn" value="주문취소"/>
	<input type="button" class="cnl_list_bnt" value="목록"/>
</c:if>
<jsp:useBean id="today" class="java.util.Date"/>
<fmt:parseDate var="send_date" value="${data.SEND_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/>

<fmt:parseNumber value="${today.time/(1000*60*60*24)}" integerOnly="true" var="nowday" scope="request"/>	
<fmt:parseNumber value="${send_date.time/(1000*60*60*24)}" integerOnly="true" var="sendday" scope="request"/>	
<c:if test="${data.CODE_NAME eq '발송완료'}">
	<c:if test="${data2.CODE_NAME eq null}">
	<c:if test="${nowday-sendday <= 7}">
		<input type="button" class="ref_btn" value="환불요청"/>
	</c:if>
	</c:if>
	<c:choose>
	<c:when test="${data.STOR_FLAG eq 1}">
	<input type="button" class="stor_btn" value="입고"/>
	</c:when>
	<c:otherwise>
	<input type="button" class="stor_com_btn" style="background-color: #b3b3b3;" value="입고"/>
	</c:otherwise>
	</c:choose>
</c:if>
</div>
</div>
<c:choose>
<c:when test="${data2.REF_NO ne null}">
<div class="ref_area">
<h2>환불요청서</h2>
<ul class="ref_info">
<li><strong>접수번호 : </strong>${data2.REF_NO}</li>
<li><strong>접수날짜 : </strong>${data2.ENROLL_DATE}</li>
<li class="apv_info"><strong>처리상태 : </strong><span class="apv_stat" style="color:red">${data2.CODE_NAME}</span></li>
<c:choose>
<c:when test ="${data2.PROCESS_DATE ne null}"><li class="apv_date_info"><strong>처리날짜 : </strong>${data2.PROCESS_DATE}</li></c:when>
</c:choose>
</ul>
<table cellspacing="0">
   <colgroup>
      <col width="15%">
      <col width="15%">
      <col width="15%">
      <col width="15%">
      <col width="15%">
      <col width="25%">
   </colgroup>
   <thead>
   <tr>
      <th scope="col" style="border-left: none;">품목코드</th>
      <th scope="col">품목명</th>
      <th scope="col">주문수량(개)</th>
      <th scope="col">환불요청수량</th>
      <th scope="col">가격(원)</th>
      <th scope="col">환불사유</th>
   </tr>
   </thead>
   <tbody>
       <c:forEach var="data" items="${list2}">
          <tr>
            <td>${data.ITEM_NO}</td>
            <td>${data.ITEM_NAME}</td>
            <td>${data.CNT}</td>
            <td>${data.RCNT}</td>
            <td>${data.REF_PRICE}</td>
            <td>${data.RSN}</td>
         </tr>
      </c:forEach>
   </tbody>
</table>
   <ul class="tot_price">
      <li><strong>총 환불예상 금액 : </strong>${data2.TOT_PRICE} 원</li>
</ul>
<c:if test="${data2.CODE_NAME eq '환불승인거부'}">
<div class="rsn_area">
   <div class="rsn_title">승인거부 사유</div>
   <div class="rsn_content_area">
   <textarea class="rsn_content" id = "rRsn" disabled=disabled>${data2.NON_APV_RSN}</textarea>
</div>
</div>
</c:if>
<div class="btn_area">
   <c:if test="${data.CODE_NAME eq '환불요청'}">
   <input type="button" class="ref_cnl_btn" style="background-color: #b3b3b3;" value="환불요청취소"/>
   </c:if>
   <c:if test="${data.CODE_NAME eq '환불요청취소'}">
   <input type="button" class="ref_cnl_com_btn" style="background-color: #b3b3b3;" value="환불요청취소완료">
   </c:if>
</div>
</div>
</c:when>
</c:choose>
<c:if test="${data.CODE_NAME ne '주문요청'}">
<div class="list_btn">
<input type="button" value="목록">
</div>
</c:if>
</div>
</div>
</body>
</html>