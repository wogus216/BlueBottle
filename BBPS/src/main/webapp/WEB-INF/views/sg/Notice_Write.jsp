<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../jh/H_Menu.jsp">
	<c:param name="menuno" value="11"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본사공지사항추가</title>
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
 
 .cate{
  position :relative;
	margin: 10px 0;
 width: 100px;
 height: 30px;
 }
 
 .title_input{
  width: 100%;
 height: 50px;
margin: 10px 0;
 }
 
 .txt_content_input{
position: relative;
    margin: 10px 0;
    width: 100%;
 overflow: scroll;
 resize: none;
 }

.file_add{
margin : 20px 0px;
}
.submit {
	text-align:center;
}
.submit_btn{
	width:150px;
	height: 50px;
	font-weight: bold;
	 font-size: 20px;
	 color: white;
	text-align:center;
	border: 0;
	border-radius: 3px;
	margin:10px;
	cursor: pointer;
	background-color: #01a1dd;
	outline:none;
}
.list_btn {
	width : 100px;
	height : 40px;
	background-color: #b3b3b3;;
	font-weight: bold;
	 font-size: 18px;
	 color: white;
	text-align:center;
	border: 0;
	border-radius: 3px;
	margin:10px;
	cursor: pointer;
	outline:none;
}
button:focus{outline:none;}

#att {
	display: none;
}
#listBtn {
float: right;
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
	
	$("#cateNo").on("change",function(){
		console.log($("#cateNo").val());
		$("#nCate").val($("#cateNo").val());
		
		});
	
	$("#fileBtn").on("click", function () {
		$("#att").click();
	});
	
	$("#att").on("change", function () {
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\")+1));
	});
	
	$("#listBtn").on("click", function () {
		$("#goForm").submit();
	});
	
	$("#addForm").on("keypress", "input", function (event) {
		if(event.keyCode == 13){
			return false;
		}
	});
	
	
	$("#addBtn").on("click", function () {
		var fileForm = $("#fileForm");
		
		fileForm.ajaxForm({
			beforeSubmit : function () {
				$("#nCon").val(CKEDITOR.instances['nCon'].getData());
				
				if($.trim($("#nCate").val()) == ""){
					makePopup("카테고리","카테고리를 선택해 주세요.",function(){});
					$("#nCate").focus();
					return false; //ajaxForm 실행 불가
				}else if ($.trim($("#nTitle").val()) == ""){
					makePopup("제목","제목을 입력해 주세요.",function(){});
					$("#nTitle").focus();
					return false;
				} else if ($.trim($("#nCon").val()) == ""){
					makePopup("내용","내용을 입력해 주세요.",function(){});
					$("#nCon").focus();
					return false;
				}
				
			},
			success : function (res) {
				if(res.result == "SUCCESS"){
					//올라간 파일명 저장
					if(res.fileName.length > 0){
						$("#nFile").val(res.fileName[0]);
						makePopup("","등록되었습니다.",function(){});
					}
					//글저장
					var params = $("#addForm").serialize();
					
					$.ajax({
						url:"Notice_Writes", //접속주소
						type:"post", //전송방식 : get, post
						dataType:"json",//받아올데이터형식
						data:params, //보낼 데이터(문자열 형태)
						success : function (res) {//성공 시 다음함수 실행
							if (res.msg == "success") {
								console.log(res);
								location.href = "Notice";
							} else if(res.msg == "failed") {
								makePopup("","작성에 실패하였습니다.",function(){});
							} else {
								makePopup("","작성중 문제가 발생하였습니다.",function(){});
							}
						},
						error : function (request, status, error) { //실패 시 다음함수 실행
							console.log(error); //값이 돌아오지 않던지 애초에 터졌든지에 대한 에러
						}
					});
					
				} else {
					makePopup("","파일업로드 중 문제 발생",function(){});
				}
			},
			error : function () {
				makePopup("","파일업로드 중 문제 발생",function(){});
			}
		}); //ajaxForm end
		
		fileForm.submit();
	}); //addBtn click end
}); //document ready end

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
<form id="fileForm" action="fileUploadAjax" 
	method="post" enctype="multipart/form-data">
	<input type="file" name="att" id="att" />
</form>
<form action="Notice" id="goForm" method="post">
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	
</form>
<form action="#" id="addForm" method="post">
<select class="cate" id="cateNo" name="cateNo" >
	<option value="0">전체</option>
	<option value="1">이벤트</option>
	<option value="2">주문</option>
	<option value="3">재고</option>
	<option value="4">시스템</option>
	<option value="5">기타</option>
</select>
<input type="text" id="nTitle" name="nTitle" class="title_input" placeholder="제목을 입력하시오.">
<textarea class="txt_content_input" rows="40" cols="40" id="nCon" name="nCon"></textarea>
<input type="button" value="첨부파일" id="fileBtn" class="file_add"/>
<span id="fileName"></span>
<input type="hidden" name="nFile" id="nFile"/>
<input type="hidden" name="nCate" id="nCate"/>
<input type="hidden" id="uNo" name="uNo" value="${sUSERNo}"/>
</form>
<div class="submit">
<input type="button" value="등록" id="addBtn" class="submit_btn" />
</div>
<input type="button" value="목록" id="listBtn" class="list_btn"/>
</div>
</div>
</body>
</html>