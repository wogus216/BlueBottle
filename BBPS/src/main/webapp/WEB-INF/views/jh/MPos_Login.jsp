<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, inital-scale=1.0,
								maximum-scale=1.0, user-scalable=no" />
<title>포스 로그인 페이지</title>
<style type="text/css">
/*
  css 색깔
    바탕,로그인 파란 색깔 : #1bc1fe
    팝업 파란 색깔: #01a1dd	
    글자 색깔 : white, black
 */
body{
	background-color: #1bc1fe;
	font-family:system-ui;
	color: white;
	
}
.content{
	margin-top: 50px;
	text-align: center;
}
/* 사진 */
.main_img{
	display: inline-block;
	width: 65vw;
	
}
#img1{
	width : 100%;
	height: 100%;
}
/* 로그인 */
.login_area{
	display: inline-block;
	vertical-align: top;
	width: 25vw;
	min-width: 390px;
	height: 100%;
	text-align: center;
	
	
}
.title{
	font-size: 1.5em;
	margin: 20px 0;
}
.choice_img{
	margin-top: 60px;
	width: 5vw;
	padding: 0 10px;
 	cursor: pointer;
}
.sys_img{
	padding: 0px;
	list-style: none;
 	margin: 0;
 	height: 100px;
	margin-left: 50px;
}
.sys_img li {
	border: 0;
	float: left;
	font-size: 1.2vw;
	width: 30%;
}
.info{
    font-size:  1.5em;
    margin-top: 60px;
}
.log_input{
	list-style: none;
	padding: 0;
}
#bId{
	text-transform: uppercase;
}
.input{
	margin-top: 10px;
	margin-left: 20px;
    font-size: 20px;
    outline: none;
}
.input:focus{
	animation-name: border-focus;
	animation-duration: 1s;
	animation-fill-mode: forwards;
}
@keyframes border-focus{
	from{
		border-radius: 0;
	}
	to {
		border-radius: 15px;
	}
}

.btn_area{
	margin-left: 10px;
}

.submit,.inquiry_btn{
    width: 90px;
    font-size: 20px;
    margin-top: 20px;
    border-radius: 10px;
}

.submit:hover, .inquiry_btn:hover{
	background-color: white;
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
	color: black
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
<script type="text/javascript">
$(document).ready(function(){
	//다시 로그인 페이지
	$("#HQ").on("click",function(){
		location.href = "H_Login";
	});
	//지점 로그인 페이지
	$("#B").on("click",function(){
		location.href = "B_Login";
	});
	
	//포스 로그인 페이지
	$("#POS").on("click",function(){
		location.href = "Login";
	});
	
	//엔터로 로그인
	$("#bPw").on("keypress", function(e){
		if(e.keyCode == '13'){
			
			$(".submit").click();
		}
	});
	
	//팝업
	$(".inquiry_btn").on("click",function(){
		makePopup("", "02-486-6479로 문의주시면 됩니다.",function(){
			
		});
	}); //pos_off end
	
	
	//엔터방지
	$("#loginForm").on("keypress", "input", function(){
		if(event.keyCode== 13){
			return false;
		}
	});
	
	//로그인버튼
	$(".submit").on("click",function(){
		if($.trim($("#bId").val()) == ""){
			
			makePopup("", "아이디를 입력해주세요",function(){});
			$("#bId").focus();
		} else if($.trim($("#bPw").val()) =="") {
			
			makePopup("", "비밀번호를 입력해주세요",function(){});
				$("#bPw").focus();	
		} else{
			
			$("#bId").val($("#bId").val().toUpperCase()); //대문자처리
			var params = $("#loginForm").serialize();
			$.ajax({
				url: "MPos_Logins",
				type: "post", 
				dataType: "json", 
				data : params, 
				success : function(res) { 
				 	if(res.resMsg == "success"){
				 		$("#loginForm").attr("action","MPos");
						$("#loginForm").submit();
					} else{
						makePopup("", "아이디 또는 비밀번호가 일치하지 않습니다.",function(){
							
						});
					}
					console.log(res);
				},
				error: function(request, status, error){ //실패 시 다음 함수 실행
					console.log(error);
					console.log(status);
				}
			});
		}
	});
		
}); //ready end

var imgs = ["resources/images/bb/블루보틀2.jpg","resources/images/bb/블루보틀0.jpg","resources/images/bb/블루보틀5.jpg","resources/images/bb/블루보틀4.jpg"]
var now = 0;
var interval = null;
function start(){
	if(interval == null){
	interval = setInterval(changeImg, 3000);
	}
}
function changeImg(){
	now++;
	
	if(now == imgs.length){
		now = 0;
	}
	document.getElementById("img1").src =imgs[now];
}
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
	html+= 			"<input type=\"button\" value=\"확인\"  class=\"confirm_Btn\"style=\"background-color: rgb(41, 128, 185)\">";	
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
function closePopup() {
	$(".bg, .popup_area").fadeOut(function(){
		$(".bg, .popup_area").remove();
	}); //popup_btn end
}
</script>
</head>
<body>

<div class="content">
	<div class="main_img">
	<img alt="이미지" src="resources/images/bb/블루보틀2.jpg" id="img1" onload="start()"/>
	</div>
	<div class="login_area">
		<div class="title">Blue Bottle</div>
		<div class="choi_area">
			<ul class="sys_img">
				<li>
					<img src="resources/images/bb/user.png" id="HQ" class="choice_img"/><br/>
					<span style="font-size:20px">본사</span>
				</li>
				<li>
					<img src="resources/images/bb/user.png" id="B" class="choice_img"/><br/>
					<span style="font-size:20px">지점</span>
				</li>
				<li>
					<img src="resources/images/bb/pos.PNG" id="POS" class="choice_img"/><br/>
					<span style="font-size:20px">POS</span>
				</li>
			</ul>
		</div>
		<div class="info">이용할 시스템을 클릭하세요</div>
		<form action="#" id="loginForm" method="post">
			<ul class=log_input>
				<li><input type="text" id="bId" name="bId" class="input" maxlength="15" placeholder="아이디를 입력해주세요"/></li>
				<li><input type="password" id="bPw" name="bPw" class="input" maxlength="15" placeholder="비밀번호을 입력해주세요"/></li>
				<li class="btn_area">
					<input type="button" value="문의" class="inquiry_btn"/>
					<input type="button" value="로그인" class="submit">
				</li>
			</ul>
		</form>
	</div>
</div>
</body>
</html>