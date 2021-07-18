<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점주문요청</title>
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


/* 미들 부분 */
.content_area{
	width: 1380px;
	height: 900px;
	margin: 0 auto;
	margin-top: 50px;
}

.content_1{
	display: inline-block;
	vertical-align: top;
	max-width: 640px;
    min-width: 300px;
    margin-left: 30px;
    margin-right: 5px;
    width: 640px;
}
.content_2{
	display: inline-block;
	vertical-align: top;
	max-width: 670px;
    min-width: 300px; 
    width: 670px;
}

/* 게시판 */
h1 {
	 margin-bottom: 40px;
	 font-size: 30px;
}
.title_1, .title_2{
	font-size: 26px;
	font-weight: bold;
	margin-bottom: 20px;
}
.title_2{
	margin-top: 125px;
}

select{
	font-size: 15px;	
	width: 100px;
	height: 40px;
	cursor: pointer;
}
.blank{
	height: 35.5px;
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
	height: 35px;
	border-top: 1px solid #eaeaea;
	border-left: 1px solid #eaeaea;
}

td:first-child{
	border-left: none;
}

.ord_vol{
	height: 25px;
	width: 50px;
	text-align: center;
}
.del_btn{
	cursor: pointer;
}

[name=r]{ 
	margin: 0;
	height: 20px;
	width: 30px;
	vertical-align: middle;
	
}

.tot_ref_price li{
	font-size:19px;
	margin:10px;
	float: right;
}
.tot_ref_price ul{
	max-width: 1000px; 
}

.log_out{
	display:inline-block;
	text-decoration: none;
	color: gray;
	padding:10px 20px;
	line-height: 42px;
}

textarea:focus{
	outline: none;
}


button{
	color: white;
	width: 100px;
	height: 40px;
	text-align:center;
	border:0;
	border-radius: 3px;
	background-color: #01a1dd;
	font-size:18px;
	margin:10px;
	cursor: pointer;
}
button:focus{outline:none;}

input:focus{outline:none;}

.btn_area{
	text-align: center;
}
.ord_req_btn{
	width:200px;
	height: 50px;
	background-color: #01a1dd;
	font-weight: bold;
	font-size: 22px;
	float: right;
	margin: 10px 0px;
}
.search_area, .page_area {
	width: 100%;
	margin-top: 15px;
}
.page_area{
	margin-top: 10px;
}
.search_info,.page_area, .page_btn{
	text-align: center;
}

.search_btn{
	height: 40px;
	margin: 0 ;
	padding: 0;
	vertical-align: bottom;
}

.page_btn button{
	color: black;
	width: 40px;
	height: 40px;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin:10px 3px;
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
	$(".history_btn").on("click",function(){
		var params = $("#goForm").serialize();
		
		$.ajax({
			url : "ord_history",
			type : "post",  
			dataType :"json",
			data : params,
			success : function(res){
				if(res.msg == "success"){
					$("#goForm").submit();
				}
			},
			error : function(request,status,error){
				console.log(error);
			}
		});
		historyPopup(function(){
		});
	});
	$(".list_btn").on("click",function(){
		location.href="Ord_Mang";
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
					location.href="Ord_Mang";
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

function historyPopup(func){
	var html ="";
	html+= "<div class=\"bg\"></div>";	
	html+= "<div class=\"popup_area\">";	
	html+= "<div class=\"popup_head\">전체 이력조회";	
	html+= 		"<button class=\"close_btn\" >X</button>";	
	html+= "</div>";	
	html+= "<div class=\"popup_content\">"
	html+= "<table cellspacing=\"0\">";
	html+= "<colgroup>";
	html+=		"<col width=\"25%\">";
	html+=		"<col width=\"25%\">";
	html+=		"<col width=\"25%\">";
	html+=		"<col width=\"25%\">";
	html+= "</colgroup>";
	html+= "<thead><tr style=\"background-color: #eee;\">";
	html+=		"<th scope=\"col\">번호</th>";
	html+=		"<th scope=\"col\">처리상태</th>";
	html+=		"<th scope=\"col\">처리날짜</th>";
	html+=		"<th scope=\"col\">처리자명</th>";
	html+=	"</tr>";
	html+=	"</theade>";
	html+=	"<tbody>"+drawHistory(res.popupList)+"</tbody>";
	html+= "</table>";
	html+=	"</div>";	
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
		var i=1;
		html += "<tr>";
		html += "<td>"+i+">";
		html += "<td>주문요청</td>";
		html += "<td>"+popupList.ORD_ENROLL_DATE+"</td>";
		html += "<td></td>";
		html += "</tr>";
		html += "<tr>";
		i+=1;
		html += "<td>"+i+">";
		if(popupList.ORD_CODE_NAME=="주문취소"){
			html += "<td>주문취소</td>";
			html += "<td>"+popupList.ORD_ENROLL_DATE+"</td>";
			html += "<td></td>";
			html += "<tr>";
		}else if(popupList.ORD_CODE_NAME=="주문승인거부"){
			html += "<td>주문승인거부</td>";
		}else{
			html += "<td>주문승인</td>";
		}
		html += "<td>"+popupList.ORD_PROCESS_DATE+"</td>";
		html += "<td>"+popupList.ORD_USER_NAME+"</td>";
		html += "</tr>";
			
		i+=1;
		html += "<td>"+i+">";
		html += "<td>발송</td>";
		html += "<td>"+popupList.ORD_PROCESS_DATE+"</td>";
		html += "<td>"+popupList.SEND_USER_NAME+"</td>";
		html += "</tr>";
			
		if(popupList.REF_CODE_NAME!=null){
			i+=1;
			html += "<tr>";
			html += "<td>"+i+">";
			html += "<td>환불요청</td>";
			html += "<td>"+popupList.REF_ENROLL_DATE+"</td>";
			html += "<td></td>";
			html += "</tr>";
		}
		if(popupList.REF_CODE_NAME=="환불요청취소"){
			html += "<td>환불요청취소</td>";
			html += "<td>"+popupList.REF_PROCESS_DATE+"</td>";
			html += "<td></td>";
			html += "<tr>";
		}else if(popupList.REF_CODE_NAME=="환불승인거부"){
			html += "<td>환불승인거부</td>";
		}else{
			html += "<td>환불승인</td>";
		}
		html += "<td>"+popupList.REF_PROCESS_DATE+"</td>";
		html += "<td>"+popupList.REF_USER_NAME+"</td>";
		html += "</tr>";

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
   <div class="top">
     <ul>
         <li>
         <a href="#">
         <img class="logo" alt="logo" src="logo.png" width="250px"></a>
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
         	<a class="main_menu" style="padding: 20px 40px;" href="#">
         			주문관리 </a>
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
	          	<div class="sub">
	            </div>
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
<div class="content_1">
<h1>주문요청</h1></br>
<div class="title_1">주문 가능 품목 리스트</div>
	<select class="cate">
				<option value="0" selected="selected">카테고리</option>
				<option value="1">음료</option>
				<option value="2">제과</option>
				<option value="3">기타</option>
	</select>
<table cellspacing="0">
	<colgroup>
		<col width="13%">
		<col width="13%">
		<col width="23%">
		<col width="13%">
		<col width="16%">
		<col width="10%">
		<col width="10%">
	</colgroup>
	<tbody>
	<tr>
		<th scope="col">카테고리</th>
		<th scope="col">품목코드</th>
		<th scope="col">품목명</th>
		<th scope="col">가격(원)</th>
		<th scope="col">유통기한</th>
		<th scope="col">최소수량</th>
		<th scope="col">담기</th>
	</tr>
	<tr>
		<td>음료</td>
		<td>D-001</td>
		<td>커피원두(에티오피아)</td>
		<td>12,000</td>
		<td>2022-01-01</td>
		<td>3</td>
		<td><input name="r" type="checkbox"></td>
		
	</tr>
	<tr>
		<td>빵</td>
		<td>B-001</td>
		<td>휘낭시에</td>
		<td>1,100</td>
		<td>2022-01-01</td>
		<td>10</td>
		<td><input name="r" type="checkbox"></td>
	</tr>
	<tr>
		<td>음료</td>
		<td>D-023</td>
		<td>우유</td>
		<td>1,400</td>
		<td>2022-01-01</td>
		<td>3</td>
		<td><input name="r" type="checkbox"></td>
	</tr>
	<tr>
		<td>음료</td>
		<td>D-014</td>
		<td>레몬청</td>
		<td>2,400</td>
		<td>2022-01-01</td>
		<td>1</td>
		<td><input name="r" type="checkbox"></td>
	</tr>
	<tr>
		<td>기타</td>
		<td>E-002</td>
		<td>냅킨</td>
		<td>8,700</td>
		<td>2022-01-01</td>
		<td>2</td>
		<td><input name="r" type="checkbox"></td>
	</tr>
	<tr>
		<td>기타</td>
		<td>E-004</td>
		<td>빨대</td>
		<td>4,300</td>
		<td>2022-01-01</td>
		<td>2</td>
		<td><input name="r" type="checkbox"></td>
	</tr>
	<tr>
		<td>음료</td>
		<td>D-029</td>
		<td>초코시럽</td>
		<td>1,900</td>
		<td>2022-01-01</td>
		<td>1</td>
		<td><input name="r" type="checkbox"></td>
	</tr>
	</tbody>
</table>
<div class="search_area">
		<div class="search_info">
			<select class="search_filter">
				<option value="0" selected="selected">품목코드</option>
				<option value="1">품목명</option>
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
<div class="content_2">
<div class="title_2">담은 목록</div>
<div class="blank"></div>
<table cellspacing="0" >
	<colgroup>
		<col width="13%">
		<col width="13%">
		<col width="19%">
		<col width="12%">
		<col width="14%">
		<col width="9%">
		<col width="12%">
		<col width="6%">
	</colgroup>
	<tbody>
	<tr>
		<th scope="col">카테고리</th>
		<th scope="col">품목코드</th>
		<th scope="col">품목명</th>
		<th scope="col">가격(원)</th>
		<th scope="col">유통기한</th>
		<th scope="col">최소수량</th>
		<th scope="col">수량</th>
		<th scope="col"></th>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td><input class="ord_vol" type="number" maxlength="5" /></td>
		<td><input class="del_btn" type="button" value="X" /></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td><input class="ord_vol" type="number" maxlength="5" /></td>
		<td><input class="del_btn" type="button" value="X" /></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td><input class="ord_vol" type="number" maxlength="5" /></td>
		<td><input class="del_btn" type="button" value="X" /></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td><input class="ord_vol" type="number" maxlength="5" /></td>
		<td><input class="del_btn" type="button" value="X" /></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td><input class="ord_vol" type="number" maxlength="5" /></td>
		<td><input class="del_btn" type="button" value="X" /></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td><input class="ord_vol" type="number" maxlength="5" /></td>
		<td><input class="del_btn" type="button" value="X" /></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td><input class="ord_vol" type="number" maxlength="5" /></td>
		<td><input class="del_btn" type="button" value="X" /></td>
	</tr>
	</tbody>
</table>
<ul class="tot_ref_price">
	<li><strong>총 주문 금액 : </strong>0원</li>
</ul>
<div class="btn_area">
	<button class="ord_req_btn">주문요청</button>
</div>
</div>
</div>
</body>
</html>