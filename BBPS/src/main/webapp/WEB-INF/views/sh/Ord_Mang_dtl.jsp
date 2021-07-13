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
.list_btn, .apv_com, .send_com{
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
.apv_btn, .non_apv_btn, .ref_apv_btn, .non_ref_apv_btn, .send_btn{
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

.non_apv_btn, .non_ref_apv_btn{
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
.popup_btn button{
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
</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".history_btn").on("click",function(){
		historyPopup("전체 이력","test",function(){
		});
	});
	$(".list_btn").on("click",function(){
		location.href="Ord_Mang"
	});
	$(".apv_btn").on("click",function(){
		if(confirm("주문을 승인하시겠습니까?")){ //팝업 변경 필요
		var params = $("#goForm").serialize();
		
		$.ajax({
			url : "ord_apv",
			type : "post",  
			dataType :"json",
			data : params,
			success : function(res){
				if(res.msg == "success"){
					alert("승인되었습니다.");
					$("#goForm").submit();
				}else if (res.msg == "failed"){
					alert("승인에 실패하였습니다.");
				}else {
					alert("승인 중 문제가 발생하였습니다.")
				}
			},
			error : function(request,status,error){
				console.log(error);
			}
		});
		}
	});
	$(".non_apv_btn").on("click",function(){
		if($.trim($("#oRsn").val())=="") {
			alert("승인거부 이유를 입력해주세요.");
			$("#oRsn").focus();
		}else{
		if(confirm("승인거부 처리하시겠습니까?")){ //팝업 변경 필요
			
		var params = $("#OrsnForm").serialize();
		console.log($("#OrsnForm").serialize());
		$.ajax({
			url : "ord_non_apv",
			type : "post",  
			dataType :"json",
			data : params,
			success : function(res){
				if(res.msg == "success"){
					alert("승인거부 처리되었습니다.");
					$("#OrsnForm").submit();
				}else if (res.msg == "failed"){
					alert("승인거부에 실패하였습니다.");
				}else {
					alert("승인거부 중 문제가 발생하였습니다.")
				}
			},
			error : function(request,status,error){
				console.log(error);
			}
		});
		}
	}
	});
	$(".ref_apv_btn").on("click",function(){
		if(confirm("환불을 승인하시겠습니까?")){ //팝업 변경 필요
		var params = $("#goForm").serialize();
		
		$.ajax({
			url : "ref_apv",
			type : "post",  
			dataType :"json",
			data : params,
			success : function(res){
				if(res.msg == "success"){
					alert("승인되었습니다.");
					$("#goForm").submit();
				}else if (res.msg == "failed"){
					alert("승인에 실패하였습니다.");
				}else {
					alert("승인 중 문제가 발생하였습니다.")
				}
			},
			error : function(request,status,error){
				console.log(error);
			}
		});
		}
	});
	$(".non_ref_apv_btn").on("click",function(){
		if($.trim($("#rRsn").val())=="") {
			alert("승인거부 이유를 입력해주세요.");
			$("#rRsn").focus();
		}else{
		if(confirm("승인거부 처리하시겠습니까?")){ //팝업 변경 필요
		var params = $("#RrsnForm").serialize();
		
		$.ajax({
			url : "ref_non_apv",
			type : "post",  
			dataType :"json",
			data : params,
			success : function(res){
				if(res.msg == "success"){
					alert("승인거부 처리되었습니다.");
					$("#RrsnForm").submit();
				}else if (res.msg == "failed"){
					alert("승인거부에 실패하였습니다.");
				}else {
					alert("승인거부 중 문제가 발생하였습니다.")
				}
			},
			error : function(request,status,error){
				console.log(error);
			}
		});
		}
	}
	});
	$(".send_btn").on("click",function(){
		if($.trim($("#expDate").val())=="") {
			alert("유통기한을 입력해주세요.");
			$("#expDate").focus();
		}else{
		if(confirm("발송 처리하시겠습니까?")){ //팝업 변경 필요
		var params = $("#sendForm").serialize();
		console.log($("#sendForm").serialize());

		$.ajax({
			url : "ord_send",
			type : "post",  
			dataType :"json",
			data : params,
			success : function(res){
				if(res.msg == "success"){
					alert("발송 처리되었습니다.");
					$("#sendForm").submit();
				}else if (res.msg == "failed"){
					alert("발송처리에 실패하였습니다.");
				}else {
					alert("발송처리 중 문제가 발생하였습니다.")
				}
			},
			error : function(request,status,error){
				console.log(error);
			}
		});
		}
		}
	});
}); //ready end

function historyPopup(title,contents,func){
	var html ="";
	html+= "<div class=\"bg\"></div>";	
	html+= "<div class=\"popup_area\">";	
	html+= "<div class=\"popup_head\">"+ title +"";	
	html+= 		"<button class=\"close_btn\" >X</button>";	
	html+= "</div>";	
	html+= "<div class=\"popup_content\">"+ contents +"</div>";	
	html+= 		"<div class=\"popup_btn\">";	
	html+= 			"<button class=\"submit_btn\">확인</button>";	
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
	}
function drawList(popupList){
	var html ="";
	for(var d of popupList){
		html += "<tr ord_no = \""+d.ORD_NO+"\">";
		html += "<td>"+d.ORD_NO+"</td>";
		html += "<td>"+d.ENROLL_DATE+"</td>";
		html += "<td>"+d.BRCH_NAME+"</td>";
		html += "<td>"+d.CODE_NAME+"</th>";
		if(d.PROCESS_DATE == null){
			if(data.CODE_NAME=="주문승인"){
			html+= "<td><input id = \"expDate\" name = \"expDate\"/></td>"
			}else{
				html += "<td></td>"
			}
		}else{
		html += "<td>"+d.PROCESS_DATE+"</td>"
		}
		html += "</tr>";
	}
	$("tbody").html(html);
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
<form action = "#" id = "goForm" method = "post">
	<input type = "hidden" id = "oNo" name = "oNo" value="${data.ORD_NO}"/>
	<input type = "hidden" id = "page" name = "page" value = "${param.page}"/>
	<input type = "hidden" name = "search_filter" value = "${param.search_filter}"/>
	<input type = "hidden" name="search_old_txt" id="search_old_txt" value="${param.search_input}"/>
</form>
<div class="content_area">
<div class="content">
<h1>주문조회</h1>
<button class="history_btn">전체이력</button>
<div class="ord_area">
<ul class="ord_info">
<li><strong>주문번호 : </strong>${data.ORD_NO}</li>
<li><strong>주문날짜 : </strong>${data.ENROLL_DATE}</li>
<li><strong>지점명 : </strong>${data.BRCH_NAME}</li>
<li class="apv_info"><strong>처리상태 : </strong><span class="apv_stat" style="color:red">${data.CODE_NAME}</span></li>
<c:choose>
<c:when test ="${data.PROCESS_DATE ne null}"><li class="apv_date_info"><strong>처리날짜 : </strong>${data.PROCESS_DATE}</li></c:when>
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
		<td>${data1.ITEM_NO}</td>
		<td>${data1.ITEM_NAME}</td>
		<td>${data1.CNT}</td>
		<td>${data1.PRICE}</td>
		<c:choose>
			<c:when test="${data1.EXPIRY_DATE eq null}">
				<c:choose>
					<c:when test="${data.CODE_NAME eq '주문승인'}">
					<c:choose>
						<c:when test="${data1.CATE_NO eq 0 or data1.CATE_NO eq 1 or data1.CATE_NO eq 2}">
							<td style="text-align: center;">
							<form action = "#" id = "sendForm" method = "post">
							<input type="date" id="expDate" name="expDate"/>
							<input type = "hidden" id = "oNo1" name = "oNo1" value="${data.ORD_NO}"/>
							</form>
							</td>
						</c:when>
					
					<c:otherwise>
						<td></td>
					</c:otherwise>
					</c:choose>
					</c:when>
					<c:otherwise>
						<td></td>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<td>${data1.EXPIRY_DATE}</td>
			</c:otherwise>
		</c:choose>
		</tr>
	</c:forEach>
</tbody>
</table>
<ul class="tot_price">
<li><strong>전체 상품 금액 : </strong>${data.TOT_PRICE} 원</li>
</ul>
<div class="rsn_area">
	<div class="rsn_title">승인거부 시 사유 작성란(필수)</div>
	<div class="rsn_content_area">
	<c:choose>
	<c:when test="${data.CODE_NAME eq '주문요청'}">
		<form action = "#" id = "OrsnForm" method = "post">
		<textarea class="rsn_content" id = "oRsn" name="oRsn"></textarea>
		<input type = "hidden" id = "oNo" name = "oNo" value="${data.ORD_NO}"/>
		</form>
	</c:when>
	<c:otherwise>
	<textarea class="rsn_content" id = "oRsn" disabled=disabled>${data.NON_APV_RSN}</textarea>
	</c:otherwise>
	</c:choose>
</div>
</div>
<c:choose>
<c:when test="${data.CODE_NAME eq '주문요청'}">
<div class="btn_area">
	<button class="apv_btn">승인</button>
	<button class="non_apv_btn">승인거부</button>
</div>
</c:when>
<c:otherwise>
<div class="btn_area">
<button class="apv_com" style="background-color: #b3b3b3;">승인완료</button>
<c:choose>
<c:when test="${data.CODE_NAME eq '주문승인'}">
<button class="send_btn">발송</button>
</c:when>
<c:otherwise>
<button class="send_com" style="background-color: #b3b3b3;">발송완료</button>
</c:otherwise>
</c:choose>
</div>
</c:otherwise>
</c:choose>
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
<div class="rsn_area">
	<div class="rsn_title">승인거부 시 사유 작성란(필수)</div>
	<div class="rsn_content_area">
	<c:choose>
	<c:when test="${data2.CODE_NAME eq '환불요청'}">
	<form action = "#" id = "RrsnForm" method = "post">
	<textarea class="rsn_content" id = "rRsn" name="rRsn"></textarea>
	<input type = "hidden" id = "oNo" name = "oNo" value="${data.ORD_NO}"/>
	</form>
	</c:when>
	<c:otherwise>
	<textarea class="rsn_content" id = "rRsn" disabled=disabled>${data2.NON_APV_RSN}</textarea>
	</c:otherwise>
	</c:choose>
</div>
</div>
<c:choose>
<c:when test="${data.CODE_NAME eq '환불요청'}">
<div class="btn_area">
	<button class="ref_apv_btn">승인</button>
	<button class="non_ref_apv_btn">승인거부</button>
</div>
</c:when>
<c:otherwise>
<div class="btn_area">
<button class="apv_com" style="background-color: #b3b3b3;">승인완료</button>
</div>
</c:otherwise>
</c:choose>
</div>
</c:when>
</c:choose>
<div class="list_btn">
<button>목록</button>
</div>
</div>
</div>