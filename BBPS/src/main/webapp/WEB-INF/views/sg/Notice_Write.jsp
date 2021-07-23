<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본사공지사항추가</title>
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
					alert("카테고리를 선택해 주세요.");
					$("#nCate").focus();
					return false; //ajaxForm 실행 불가
				}else if ($.trim($("#nTitle").val()) == ""){
					alert("제목을 입력해 주세요.");
					$("#nTitle").focus();
					return false;
				} else if ($.trim($("#nCon").val()) == ""){
					alert("내용을 입력해 주세요.");
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
								alert("작성에 실패하였습니다.")
							} else {
								alert("작성중 문제가 발생하였습니다.");
							}
						},
						error : function (request, status, error) { //실패 시 다음함수 실행
							console.log(error); //값이 돌아오지 않던지 애초에 터졌든지에 대한 에러
						}
					});
					
				} else {
					alert("파일업로드 중 문제 발생")
				}
			},
			error : function () {
				alert("파일업로드 중 문제 발생")
			}
		}); //ajaxForm end
		
		fileForm.submit();
	}); //addBtn click end
}); //document ready end


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
</form>
<div class="submit">
<input type="button" value="등록" id="addBtn" class="submit_btn" />
</div>
<input type="button" value="목록" id="listBtn" class="list_btn"/>
</div>
</div>
</body>
</html>