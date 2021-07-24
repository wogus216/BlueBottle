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
	outline:none;
}
.btm_btn_area{
	text-align: center;
	margin : 40px;
}

.submit_btn{
	background-color: #01a1dd;
}
.cnl_btn{
	background-color:#bf4040;
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
	
	/* 신박한 방법 유저번호 받는 방법
	if("${empty data}" == "true"){
		$("#send_form").attr("action","My_Page");
		$("#send_form").submit();
	}
	*/
	//수정버튼
	$(".submit_btn").on("click",function(){
		
		if($.trim($("#mPw").val()) == ""){
			makePopup("", "새 비밀번호를 입력해주세요",function(){});
			
		} else if($.trim($("#rePw").val()) != $.trim($("#mPw").val())){
			makePopup("", "비밀번호가 일치하지 않습니다.",function(){}); 
			
		} else if($.trim($("#mNm").val()) == ""){
			makePopup("", "이름을 입력해주세요",function(){}); 
			
		} else if($.trim($("#mPNum").val()) == ""){
			makePopup("", "번호를 입력해주세요",function(){}); 
			
		} else{
			var params = $("#update_form").serialize();
			
			$.ajax({
				url: "My_Page_Edits",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res){
					
					if(res.msg == "success"){
						$("#update_form").attr("action","My_Page");
						$("#update_form").submit();
					}
					else if(res.msg == "failed"){
						makePopup("", "수정 중 에러 발생",function(){}); 
					}
					else {
						makePopup("", "수정 중 에러 발생",function(){}); 
					}
				},
				error: function(request, status, error){
					console.log(error);
					console.log(request);
					console.log(status);
				}
			}); //ajax end
		}
	}); //수정 end
	

	//목록버튼
	$(".cnl_btn").on("click",function(){
		$("#update_form").attr("action","My_Page");
		$("#update_form").submit();
	});
	
	
}); //ready end


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
<!--컨텐츠 -->
<div class="content_area">
<div class="content">
<h1>마이페이지</h1>
<form action="#" id="update_form" method="post">
<input type="hidden" id="uNo" name="uNo" value="${sUSERNo}"/>
<!-- 본문 -->
	<div class="main_content_area">
		<div class="wrap">
			<div class="left">
				<div class="user_no">
					<h3>사용자 번호</h3>
				</div>
			</div>
			<div class="right">
				<div class="user_no">
					${data.UNO}
				</div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="dep_nm">
					<h3>부서명</h3>
				</div>
			</div>
			<div class="right">
				<div class="dep_nm">
					${data.DNM}
				</div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="id">
					<h3>ID</h3>
				</div>
			</div>
			<div class="right">
				<div class="id">
					${data.ID}
				</div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="pw">
					<h3>새 비밀번호</h3>
				</div>
			</div>
			<div class="right">
				<div class="pw">
						<input type="password" id="mPw" name="mPw" value="${data.PW}"/>
				</div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="pw">
					<h3>비밀번호 확인</h3>
				</div>
			</div>
			<div class="right">
				<div class="pw">
					<input type="password" id="rePw" name="rePw" value="${data.PW}"/>
				</div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="user_name">
					<h3>사용자명</h3>
				</div>
			</div>
			<div class="right">
				<div class="user_name">
					<input type="text" id="mNm" name="mNm" value="${data.UNM}"/>
				</div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="phone_num">
					<h3>휴대폰 번호</h3>
				</div>
			</div>
			<div class="right">
				<div class="phone_num">
					<input type="text" id="mPNum" name="mPNum" value="${data.PNUM}"/>
				</div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="enroll_date">
					<h3>등록일</h3>
				</div>
			</div>
			<div class="right">
				<div class="enroll_date">
					${data.ENROLL}
				</div>
			</div>
		</div>
	</div>
</form>
<!-- 버튼 -->
		<div class="btm_btn_area">
			<input type="button" class="submit_btn" value="완료" >
			<input type="button" class="cnl_btn" value="취소" >
		</div>
	</div>
</div>
</body>
</html>