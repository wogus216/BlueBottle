<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<c:import url="H_Menu.jsp">
	<c:param name="menuno" value="13"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본사 마이페이지</title>
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
/* 타이틀*/

h1 {
 	margin-bottom: 40px;
 	font-size: 30px;
}


/* 이게일반 */
input[type='button']{
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
.btm_btn_area{
	text-align: center;
	margin : 40px;
}

.edit_btn, .none_act_btn{
	width:130px;
	height: 50px;
	background-color: #01a1dd;
	font-weight: bold;
	font-size: 20px;
}

button:focus{outline:none;}


.main_content_area {
	margin : 0px 300px;
}
 .main_content_area > div{
	 display : inline-block;
	 margin : 0px 50px;
 }
 .top_info_area > div {
	 margin : 50px 20px;
 }
.btm_info_area > div{
	margin : 54px 20px;
}

.wrap{
	width: 450px;
	display: inline-block;
}
.left{
	display: inline-block;
    width: 200px;
    height: 100%;
    float: left;
}
.right{
	display: inline-block;
    line-height: 60px;
    font-size: 20px;
}

/* 팝업메시지 */

.bg, .o_bg{
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
.popup_area, .o_popup_area {
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
.popup_head , .o_popup_head{
	height: 30px;
	font-size: 16pt;
	background-color: #01a1dd;
	color:white;
	padding:10px;
	font-weight:bold;
}
.popup_btn, .o_popup_btn{
	text-align:center;
}
.popup_btn input[type='button'] ,
.o_popup_btn input[type='button']{
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
.popup_content, .o_popup_content{
	margin-bottom: 40px;
	margin-top: 50px;
	margin-left:20px;
	text-align:center;
	font-size:20px;
	color: black
}
input[type='button']:focus{outline:none;}

.confirm_pw{
	width: 200px;
	height: 30px;
}

.popup_head > .close_btn,
.o_popup_head > .o_close_btn{
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
	
	/* 신박한 방법 유저번호 받는 방법
	if("${empty data}" == "true"){
		$("#send_form").attr("action","My_Page");
		$("#send_form").submit();
	}
	*/
	//수정버튼
	$(".edit_btn").on("click",function(){
		makePopup("개인정보확인",function(){});
	});
	

	//목록버튼
	$(".list_btn").on("click",function(){
		history.back();
	});
	
	//개인정보 확인
	$("body").on("click", ".confirm_btn" ,function(){
		
		if($.trim($(".confirm_pw").val()) == ""){
			alert("비밀번호를 입력해주세요");
		} else{
			var params = $("#send_form").serialize();

			$.ajax({
				url: "pw_Checks",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res){
					console.log(res);
					
					if(res.msg == "success"){
						$("#send_form").attr("action","My_Page_Edit");
						$("#send_form").submit();
					
					} else{
						ordPopup("", "비밀번호가 일치하지 않습니다.",function(){});
					}
				},
				 error: function(request, status, error){
						console.log(error);
					}
			}); //ajax end
	
		}
		
		});  //개인정보 확인 end
	
	
}); //ready end


/* 팝업 */
function makePopup(title, func) {
	
	var html ="";
	html+= "<div class=\"bg\"></div>";	
	html+= "<div class=\"popup_area\">";	
	html+= "<div class=\"popup_head\">"+ title +"";	
	html+= 		"<input type=\"button\" value=\"X\" class=\"close_btn\">";	
	html+= "</div>";	
	html+= "<div class=\"popup_content\">";
	html+= 		"<input type=\"password\" id=\"hPw\" name=\"hPw\" placeholder=\"비밀번호를 입력해주세요\"  class=\"confirm_pw\">";	
	html+= "</div>";	
	html+= 		"<div class=\"popup_btn\">";	
	html+= 			"<input type=\"button\" value=\"확인\"  class=\"confirm_btn\"style=\"background-color: rgb(41, 128, 185)\">";	
	html+= 			"<input type=\"button\"  value=\"취소\" style=\"background-color: rgb(190, 190, 190)\">";	
	html+= 	 	"</div>";
	html+= "</div>";	
	
	$(".content_area").prepend(html);
	$(".popup_area").hide().show();
	
	$(".popup_btn, .close_btn").on("click",function(){
		if(func !=null){
			func.call();
		}
			closePopup();
		});
	
	
	}
	
function ordPopup(title, contents, func) {
	var html ="";
	
	html+= "<div class=\"o_bg\"></div>";	
	html+= "<div class=\"o_popup_area\">";	
	html+= "<div class=\"o_popup_head\">"+ title +"";	
	html+= 		"<input type=\"button\" value=\"X\" class=\"o_close_btn\">";		
	html+= "</div>";	
	html+= "<div class=\"o_popup_content\">"+ contents +"</div>";	
	html+= 		"<div class=\"o_popup_btn\">";	
	html+= 			"<input type=\"button\" value=\"확인\"  class=\"o_confirm_btn\"style=\"background-color: rgb(41, 128, 185)\">";	
	html+= 	 	"</div>";	
	html+= "</div>";	
	
	$("body").prepend(html);
	$(".o_popup_area").hide().show();
	
	$(".o_popup_btn, .o_close_Btn").on("click",function(){
		if(func !=null){
			func.call();
		}
			oClosePopup();
		});

	}

function closePopup() {
	$(".bg, .popup_area").fadeOut(function(){
		$(".bg, .popup_area").remove();
	}); //popup_btn end
}	

function oClosePopup() {
	$(".o_bg, .o_popup_area").fadeOut(function(){
		$(".o_bg, .o_popup_area").remove();
	}); //popup_btn end
}	
</script>
</head>
<body>
<form action="#" id="send_form" method="post">
<!--컨텐츠 -->
<div class="content_area">
<div class="content">
<h1>마이페이지</h1>
<input type="hidden" id="uNo" name="uNo" value="${sUSERNo}"/>
<!-- 본문 -->
	<div class="main_content_area">
		<div class="wrap">
			<div class="left">
				<div class="user_no"><h3>사용자 번호</h3></div>
			</div>
			<div class="right">
				<div class="user_no">${data.UNO}</div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="dep_nm"><h3>부서명</h3></div>
			</div>
			<div class="right">
				<div class="dep_nm">${data.DNM}</div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="id"><h3>ID</h3></div>
			</div>
			<div class="right">
				<div class="id">${data.ID}</div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="user_name"><h3>사용자명</h3></div>
			</div>
			<div class="right">
				<div class="user_name">${data.UNM}</div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="phone_num"><h3>휴대폰 번호</h3></div>
			</div>
			<div class="right">
				<div class="phone_num">${data.PNUM}</div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="enroll_date"><h3>등록일</h3></div>
			</div>
			<div class="right">
				<div class="enroll_date">${data.ENROLL}</div>
			</div>
		</div>
	</div>
<!-- 버튼 -->
		<div class="btm_btn_area">
			<input type="button" class="edit_btn" value="수정" >
		</div>
	</div>
</div>
</form>
</body>
</html>