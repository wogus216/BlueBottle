<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<c:import url="../jh/H_Menu.jsp">
	<c:param name="menuno" value="11"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본사공지사항상세조회</title>
<style type="text/css">

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

/* 타이틀 */

h1 {
 margin-bottom: 40px;
 font-size: 30px;
}
 

 

.top_tb{
position: relative;
    width: 100%;
    height: 35px;
}

 table{
    width: 100%;
    max-width: 100%;
    height: 100%;
    border-spacing: 0;
    border-collapse: collapse;
    table-layout: fixed;
 }
.tb1{
    border-top: 2px solid #ccc;
    border-bottom: 2px solid #ccc;
 }
.tb1 > .tbody{
     display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
 }
 .tb1 > .td{
    border-bottom: 1px solid #ccc;
    text-align: center;
 }
 .tb1 > .tr{
     display: table-row;
    vertical-align: inherit;
    border-color: inherit;
 }
 
 
  .txt_content{
position: relative;
width: 100%;
 }
 

.btm_btn_area button:focus{
outline:none;
}

.list_btn{
float : left;
color: white;
text-align:center;
border: 0;
border-radius: 3px;
margin:10px 0px;
cursor: pointer;
background-color: #01a1dd;
outline:none;
width:100px;
height: 40px;
font-weight: bold;
font-size: 18px;
}


 .btm_btn_area {
 display: inline-block;
 width: 100%;
 }
 
 
.edit_btn_area {
display: inline-block;
float: right;
}

 .edit_btn{
	color: white;
	text-align:center;
	border: 0;
	border-radius: 3px;
	margin:10px 0px;
	cursor: pointer;
	background-color: #01a1dd;
	outline:none;
	width:100px;
	height: 40px;
	font-weight: bold;
	font-size: 18px;
}
 .del_btn{
	color: white;
	background-color: #b3b3b3;
    width: 100px;
    height: 40px;
    font-weight: bold;
    font-size: 18px;
    text-align:center;
	border: 0;
	border-radius: 3px;
	margin:10px 0px;
	cursor: pointer;
	outline:none;
 }

 .btm_tb{
 margin-top : 30px;
 border: 1px solid #ccc;
 text-align: center;
 }
 
 
 
 /* 팝업메시지 */

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
	color: black; 
}

input[type='button']:focus{outline:none;}

.popup_head > .close_btn{
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
 
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	$("#listBtn").on("click", function() {
		$("#goForm").attr("action", "Notice");
		$("#goForm").submit();
	});
	 
	$("#updateBtn").on("click", function () {
		$("#goForm").attr("action", "Notice_Update");
		$("#goForm").submit();
	});
	
	
	$("#deleteBtn").on("click", function () {
		if(confirm("삭제하시겠습니까?")){
			//makePopup("삭제","삭제하시겠습니까?",function(){})
			var params = $("#goForm").serialize();
			
			$.ajax({
				url:"Notice_Deletes", //접속주소
				type:"post", //전송방식 : get, post
				dataType:"json",//받아올데이터형식
				data:params, //보낼 데이터(문자열 형태)
				success : function (res) {//성공 시 다음함수 실행
					if (res.msg == "success") {
						location.href = "Notice";
					} else if(res.msg == "failed") {
						makePopup("","삭제에 실패하였습니다.",function(){});
					} else {
						makePopup("","삭제 중 문제가 발생하였습니다.",function(){});
					}
				},
				error : function (request, status, error) { //실패 시 다음함수 실행
					console.log(error); //값이 돌아오지 않던지 애초에 터졌든지에 대한 에러
				}
			});
		}
	});
});

/* 팝업 */
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
	html+= 			"<input type=\"button\"  value=\"취소\" class=\"close_btn\" style=\"background-color: rgb(190, 190, 190)\">";	
	html+= 	 	"</div>";
	html+= "</div>";	
	
	$("body").prepend(html);
	$(".popup_area").hide().show();
	
	$(".popup_btn .close_btn").on("click",function(){
		if(func !=null){
			func.call();
		}
			closePopup();
		});
	
	$(".popup_head .close_btn").on("click",function(){
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

<!--컨텐츠 -->
<div class="content_area">
<div class="content">
<h1>공지사항</h1>
<form action="#" id="goForm" method="post">
	<input type="hidden" name="nNo" value="${data.TXT_NO}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
</form>
<div class="titile"><h2>${data.TITLE}</h2></div>
<div class="top_tb">
<table class="tb1">
<tbody>
<tr>
<td>${data.TXT_NO}</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>${data.USER_NAME}</td>
<td>&nbsp;</td>
<td>${data.S_DT}</td>
<td>&nbsp;</td>
<td>조회수</td>
<td></td>
</tr>
</tbody>
</table>
</div>


<div class="txt_content">
<br/>
${data.CONTENT}
<br/>
<c:if test="${!empty data.ATT_FILE}">
<!-- set : 변수 -->
<%--
<c:set var="len" value="${fn:length(data.B_FILE)}"></c:set>
첨부파일 : <!-- a의 download : 해당 주소를 다운로드 하겠다. 값이 있는 경우 해당 이름으로 다운받겠다. -->
<a href="resources/upload/${data.B_FILE}" download="${fn:substring(data.B_FILE,20, len)}">
${fn:substring(data.B_FILE,20, len)}</a><br/>
 --%>
 첨부파일 :<a href="resources/upload/${data.ATT_FILE}" download="${data.ATT_UFILE}">
${data.ATT_UFILE}</a><br/>
 </c:if>
</div>


<div class="btm_tb">
</div>

<div class="btm_btn_area" style = "margin-top : 30px;">
<input type="button" value="목록" id="listBtn" class="list_btn" />
	<div class="edit_btn_area">
<input type="button" value="수정" class="edit_btn" id="updateBtn" />
<input type="button" value="삭제" class="del_btn" id="deleteBtn" />
	</div>
</div>



</div>
</div>
</body>
</html>

