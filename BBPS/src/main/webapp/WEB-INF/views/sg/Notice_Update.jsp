<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../jh/H_Menu.jsp">
	<c:param name="menuno" value="11"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본사공지사항수정</title>
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

/* 타이틀 */

h1 {
 margin-bottom: 40px;
 font-size: 30px;
}
 

 
 .title_input{
  width: 100%;
 height: 50px;
margin: 10px 0;
 }
 .top_tb{
position: relative;
    width: 100.5%;
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
 .txt_content_input{
position: relative;
    margin: 10px 0;
    width: 100%;
 overflow: scroll;
 resize: none;
 }

.file_add{
margin : 10px 0px;
}

.submit_area {
	text-align:center;
	margin : 15px 0px;
}
.submit_btn {
	color: white;
	text-align:center;
	border: 0;
	border-radius: 3px;
	margin:10px;
	cursor: pointer;
	background-color: #01a1dd;
	outline:none;
	width:150px;
	height: 50px;
	background-color: #01a1dd;
	font-weight: bold;
	font-size: 22px;
}
.cnl_btn{
	color: white;
	background-color: #b3b3b3;
    width: 150px;
    height: 50px;
    font-weight: bold;
    font-size: 22px;
    text-align:center;
	border: 0;
	border-radius: 3px;
	margin:10px;
	cursor: pointer;
	outline:none;
}
.submit_area button:focus{outline:none;}
	 
 .btm_tb{
 margin : 10px 0px;
 position: relative;
width: 100%;
  height: 30px;
 }
 .tb2{
    text-align: center;
    border: 2px solid #ccc;
}
 .tb2 > .tbody{
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
 }
 .tb2 > .tr{
    border-bottom: 1px solid #ccc;
 }
 .tb2 > .th{
 background-color: #000000;
 }
 
 .off_btn {
	display: none;
}

#att {
	display: none;
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
src= "resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">

$(document).ready(function () {
	CKEDITOR.replace("nCon", {
		resize_enabled : false,
		languge : "ko",
		enterMode : "2",
		width : "1255",
		height : "500"
	});
	
	$("#fileBtn").on("click", function () {
		$("#att").click();
	});
	
	$("#att").on("change", function () {
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\")+1));
	});
	
	$("#fileDelBtn").on("click", function () {
		$("#fileName").html("");
		$("#nFile").val("");
		$("#fileBtn").attr("class","");
		$(this).remove();
	});
	
	$("#backBtn").on("click", function () {
		history.back();
	});
	
	$("#updateForm").on("keypress", "input", function (event) {
		if(event.keyCode == 13){
			
			return false;
		}
	});
	
	
	$("#updateBtn").on("click", function () {
		var fileForm = $("#fileForm");

		fileForm.ajaxForm({
			beforeSubmit : function () {
				$("#nCon").val(CKEDITOR.instances['nCon'].getData());
				
				if ($.trim($("#nTitle").val()) == ""){
					makePopup("제목","제목을 입력해주세요.",function(){});
					$("#nTitle").focus();
					return false;
				} else if ($.trim($("#nCon").val()) == ""){
					makePopup("내용","내용을 입력해주세요.",function(){});
					$("#nCon").focus();
					return false;
				}
				
			},
			success : function (res) {
				if(res.result == "SUCCESS"){
					//올라간 파일명 저장
					if(res.fileName.length > 0){
						$("#nFile").val(res.fileName[0]);
					}
					//글수정
					var params = $("#updateForm").serialize();
					
					$.ajax({
						url:"Notice_Updates", //접속주소
						type:"post", //전송방식 : get, post
						dataType:"json",//받아올데이터형식
						data:params, //보낼 데이터(문자열 형태)
						success : function (res) {//성공 시 다음함수 실행
							if (res.msg == "success") {
								$("#updateForm").attr("action", "Notice_Detail");
								$("#updateForm").submit(); 
							} else if(res.msg == "failed") {
								makePopup("","수정에 실패하였습니다.",function(){});
							} else {
								makePopup("","수정 중 문제가 발생하였습니다.",function(){});
							}
						},
						error : function (request, status, error) { //실패 시 다음함수 실행
							console.log(error); //값이 돌아오지 않던지 애초에 터졌든지에 대한 에러
						}
					});
					
				} else {
					makePopup("","파일 업로드 중 문제 발생",function(){});
				}
			},
			error : function () {
				makePopup("","파일 업로드 중 문제 발생",function(){});
			}
		}); //ajaxForm end
		
		fileForm.submit();
		
	}); //updateBtn end
	
});//document ready end


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
<!-- 상단 -->
  <div class="top">
     
   </div>

<!--컨텐츠 -->
<div class="content_area">
<div class="content">
<h1>공지사항</h1>
<form id="fileForm" action="fileUploadAjax" 
	method="post" enctype="multipart/form-data">
	<input type="file" name="att" id="att" />
</form>
<form action="#" id="updateForm" method="post">
<input type="hidden" name="page" value="${param.page}" />
<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
<input type="hidden" name="nNo" value="${data.TXT_NO}" />
<input type="text" id="nTitle" name="nTitle" class="title_input" placeholder="제목을 입력하시오."
 value="${data.TITLE}" /><br/>
<div class="top_tb">
<table class="tb1">
<tbody>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>${data.USER_NAME}</td>
<td>${data.S_DT}</td>
<td>597&nbsp;</td>
</tr>
</tbody>
</table>
</div>
<textarea class="txt_content_input" id="nCon" name="nCon" rows="40" cols="40">
${data.CONTENT}</textarea>
<input type="hidden" id="nFile" name="nFile" value="${data.ATT_FILE}" />
<c:choose>
	<c:when test="${!empty data.ATT_FILE}">
		<input type="button" class="off_btn" value="첨부파일선택" id="fileBtn" />
	</c:when>
	<c:otherwise>
		<input type="button" value="첨부파일선택" id="fileBtn" class="file_add"/>
	</c:otherwise>
</c:choose>
<span id="fileName">${data.ATT_UFILE}</span>
<c:if test="${!empty data.ATT_FILE}">
	<input type="button" value="파일삭제" id="fileDelBtn"/>
</c:if>
</form>
<div class="submit_area">
	<input type="button" value="수정" id="updateBtn" class="submit_btn"/>
	<input type="button" value="취소" id="backBtn" class="cnl_btn" />
</div>
<div class="btm_tb">
<table class="tb2">
<tbody>
<tr>
<th>&nbsp;윗글</th>
<td>&nbsp;해당 글이 없습니다.</td>
</tr>
<tr>
<th>&nbsp;아랫글</th>
<td>&nbsp;</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>

</body>
</html>