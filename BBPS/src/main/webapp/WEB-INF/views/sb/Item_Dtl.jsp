<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../jh/H_Menu.jsp">
	<c:param name="menuno" value="2"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
h1 {
 margin-bottom: 40px;
 font-size: 30px;
}

.edit_btn{
	background-color: #01a1dd;
	float: right;
}
.del_btn{
	background-color: #bf4040;
	float: right;
}

.Item_Name,.del_btn,.edit_btn{
	vertical-align: middle;
}

.btn_area{
	margin-bottom: 20px;
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

/*팝업디자인*/
.popup_Content table{
	width: 100%;
    background: #ffffff;
	margin: 10px 0;
	border-top: 2px solid #01a1dd;
	border-bottom: 2px solid #d9d9d9;
}

.popup_Content th{
	background: #e8e8e8;
    padding: 0px;
    border-bottom: 1px solid #ffffff;
    border-left: 1px solid #ffffff;
    font-size:15px;
}


.popup_Content td{
	font-size:15px;
	padding:0px;
	border-top: 1px solid #eaeaea;
	border-left: 1px solid #eaeaea;
}


.popup_Content thead{
	display : table;
	table-layout : fixed;
	width : 100%;
}

.popup_Content tbody{
	display : block;
	max-height : 120px;
	width : 100%px;
	overflow : auto;
	overflow-x : hidden;
}

.popup_Content tr{
	display : table;
	table-layout : fixed;
	width : 100%;
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
.popup_Area {
	display: inline-block;
	width: 400px;
	height: 250px;
	background-color: #ffffff;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	position: absolute;
	top: calc(50% - 125px); /*높이의 반만큼 뺌*/
	left: calc(50% - 200px); /*너비의 반만큼 뺌*/
	z-index: 300;
}
.popup_Head{
	height: 30px;
	font-size: 16pt;
	background-color: #01a1dd;
	color:white;
	padding:10px;
	font-weight:bold;
}
.popup_Btn{
	text-align:center;
}
.popup_Btn input[type='button']{
	color: white;
	width: 120px;
	height: 30px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:15px;
	margin:10px;
	cursor: pointer;
}
.popup_Content{
	margin-bottom:80px;
	margin-top:20px;
	margin-left:20px;
	margin-right:20px;
	text-align:center;
	font-size:18px;
	color: black
}
input[type='button']:focus{outline:none;}

.popup_Head > .close_Btn{
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


/* 일반버튼 */
.del_btn,.edit_btn{
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

.del_btn{
	background-color: #bf4040;
}

/* 가격 히스토리 테이블 스크롤 생성*/
.price_history thead{
	display : table;
	table-layout : fixed;
	width : 1250px;
}

.price_history tbody{
	display : block;
	max-height : 287px;
	width : 1250px;
	overflow : auto;
	overflow-x : hidden;
}

.price_history tr{
	display : table;
	table-layout : fixed;
	width : 1250px;
}

/* 최하단 목록 버튼*/
.list_btn_area{
	text-align:center;
}

.list_btn {
	width:200px;
	height: 50px;
	background-color: #01a1dd;
	font-weight: bold;
	font-size: 22px;
	color: white;
	text-align:center;
	border:0;
	border-radius: 3px;
	margin:10px;
	cursor: pointer;
	outline:none;
}

</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	drawhistoryList();

	$(".edit_btn").on("click",function(){
		$("#goForm").attr("action","Item_Edit");
		$("#goForm").submit();
	});
	
	$(".list_btn").on("click",function(){
		$("#goForm").submit();
	});
	
	$(".del_btn").on("click",function(){
		makePopup("품목삭제","삭제 하시겠습니까?",null);
			$(".confirm_Btn").on("click",function(){
				var params = $("#goForm").serialize();
				
				$.ajax({
					url : "Item_Del",
					type : "post",  
					dataType :"json",
					data : params,
					success : function(res){
						if(res.msg == "success"){
							makechkPopup("품목삭제","삭제에 성공하였습니다.",function(){
								$("#goForm").submit();
							});
						}else if (res.msg == "failed"){
							makechkPopup("품목삭제","삭제에 실패하였습니다.",null);
						}else {
							makechkPopup("품목삭제","삭제 중 문제가 발생하였습니다.",null);
						}
					},
					error : function(request,status,error){
						console.log(error);
					}
				});
			});
		
		
	});
	
}); //ready end

function drawhistoryList(){
	var params = $("#goForm").serialize();
	
	$.ajax({
		url : "Item_Dtl_Price_History",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawpricehistory(res.pricehistorylist);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
	
}

function drawpricehistory(pricehistorylist){
	var html = "";
	
	for(var d of pricehistorylist){
		html += "<tr>";
		html += "<td>"+d.ENROLL_DATE+"</td>";
		html += "<td>"+d.OLD_PRICE+"</td>";
		html += "<td>"+d.NEW_PRICE+"</td>";
		html += "<td>"+d.ID+"</td>";
		html += "</tr>";
	}
	
	$(".price_history tbody").html(html);
}

//팝업
function makePopup(title, contents, func) {
	var html ="";
	html+= "<div class=\"bg\"></div>";	
	html+= "<div class=\"popup_Area\">";	
	html+= "<div class=\"popup_Head\">"+ title +"";	
	html+= 		"<input type=\"button\" value=\"X\" class=\"close_Btn\">";
	html+= "</div>";	
	html+= "<div class=\"popup_Content\">"+ contents +"</div>";	
	html+= 		"<div class=\"popup_Btn\">";	
	html+= 			"<input type=\"button\" value=\"확인\"  class=\"confirm_Btn\"style=\"background-color: rgb(41, 128, 185);margin: 5px;\">";	
	html+=			"<input type=\"button\" value=\"취소\"  class=\"cnl_Btn\"style=\"background-color: rgb(190, 190, 190);margin: 5px;\">";	
	html+= 	 	"</div>";	
	html+= "</div>";	
	
	$("body").prepend(html);
	$(".popup_Area").hide().show();
	
	$(".popup_Btn, .close_Btn").on("click",function(){
		if(func !=null){
			func.call();
		}
		closePopup();
		});
	
}

//확인만 하면 되는 팝업
function makechkPopup(title, contents, func) {
	var html ="";
	html+= "<div class=\"bg\"></div>";	
	html+= "<div class=\"popup_Area\">";	
	html+= "<div class=\"popup_Head\">"+ title +"";	
	html+= 		"<input type=\"button\" value=\"X\" class=\"close_Btn\">";
	html+= "</div>";	
	html+= "<div class=\"popup_Content\">"+ contents +"</div>";	
	html+= 		"<div class=\"popup_Btn\">";	
	html+= 			"<input type=\"button\" value=\"확인\"  class=\"chk_confirm_Btn\"style=\"background-color: rgb(41, 128, 185);margin: 5px;\">";	
	html+= 	 	"</div>";	
	html+= "</div>";	
	
	$("body").prepend(html);
	$(".popup_Area").hide().show();
	
	$(".chk_confirm_Btn, .close_Btn").on("click",function(){
		if(func !=null){
			func.call();
		}
		closePopup();
		});
}

function closePopup() {
	$(".bg, .popup_Area").fadeOut(function(){
		$(".bg, .popup_Area").remove();
	}); //popup_Btn end
}
</script>
</head>
<body>
   <div class="top"> </div>
<form action = "Item_List" id = "goForm" method = "post">
<input type="hidden"  id="menuNo" name="menuNo" value="${param.menuNo}">
<input type = "hidden" id = "uNo" name = "uNo" value = "${sUSERNo}"/>
<input type = "hidden" name ="itemNo" value = "${data.ITEM_NO}"/>
<input type = "hidden" name = "page" value = "${param.page}"/> <!-- 파람 붙여줘야 전 페이지에서 온 걸 받는 것 // 페이지는 목록에서 준 것 컨트롤러에서 주는 것이 아님 그래서 파람 있어야함 -->
<input type = "hidden" name = "search_filter" value = "${param.search_filter}"/>
<input type = "hidden" name = "search_input" value = "${param.search_input}"/>
</form>
<div class="content_area">
<div class="content">
<h1>품목조회</h1>
<div class="btn_area">
<span class = "Item_Name">품목번호 : ${data.ITEM_NO}</span>
<c:if test="${auth eq 2}" >
<input type = "button" class="del_btn" style="margin-right: 0px;" value = "삭제"/>
<input type = "button" class="edit_btn" value = "수정"/>
</c:if>
</div>
<table cellspacing="0">
	<colgroup>
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
	</colgroup>
	<tr>
		<th scope=col style= "border-left: none;">카테고리</th>
		<th scope=col>품목명</th>
		<th scope=col>가격(원)</th>
		<th scope=col>최소주문단위</th>
		<th scope=col>완제품여부</th>
	</tr>
	<tr>
		<td>${data.CATE_NAME}</td>
		<td>${data.ITEM_NAME}</td>
		<td>${data.PRICE}</td>
		<td>${data.MIN_ORD_UNIT}</td>
		<td>
			<c:choose>
				<c:when test = "${data.COM_PROD_FLAG eq 0}">Y</c:when>
				<c:when test = "${data.COM_PROD_FLAG eq 1}">N</c:when>
			</c:choose>
		</td>
	</tr><!-- 완제품인 상품은 Y로 출력 -->
</table>
<div class=price_history>
<h3>가격변동내역</h3>
<table cellspacing="0">
	<colgroup>
		<col width="25%" />
		<col width="25%" />
		<col width="25%" />
		<col width="25%" />
	</colgroup>
	<thead>
	<tr>
		<th scope=col style= "border-left: none;">변동날짜</th>
		<th scope=col>변동전 가격</th>
		<th scope=col>변동후 가격</th>
		<th scope=col>변경자</th>
	</tr>
	</thead>
	<tbody></tbody>
</table>
</div>
<div class="list_btn_area">
<input class = "list_btn"type ="button" style = "margin:50px 0 50px 0;" value = "목록"/>
		</div>
</div>
</div>
</body>
</html>