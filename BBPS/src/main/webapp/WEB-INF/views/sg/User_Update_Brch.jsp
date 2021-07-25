<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본사사용자수정</title>
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
/* 품목등록 */

h1 {
 margin-bottom: 40px;
 font-size: 30px;
}


/* 이게일반 */
input[type='button'] {
	color: white;
	width: 150px;
	height: 50px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:20px;
	margin:10px;
	cursor: pointer;
	outline:none;
	font-weight: bold;
}
.edit_area{
	text-align: center;
}

.edit_btn{
	background-color: #01a1dd;
}

.cnl_btn{
background-color: #b3b3b3;
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
 margin : 51px 20px;
 }
.btm_info_input_area > div{
margin : 38px 20px;
}
.btm_info_input_area input {
height : 35px;
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
    float: right;
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
$(document).ready(function(){
	$("#updateForm").on("keypress", "input", function(event){
		if(event.keyCode ==13 ){
			return false;
		}
	});
	
	$("#cnlBtn").on("click", function () {
		$("#updateForm").attr("action", "User_Detail_Brch");
		$("#updateForm").submit();
	});
	
	$("#updateBtn").on("click", function () {
		if($.trim($("#bPw").val()) == ""){
			makePopup("PW","비밀번호를 입력해주세요.",function(){});
			$("#bPw").focus();
		} else if($.trim($("#bPwRe").val()) != $.trim($("#bPw").val())){
			makePopup("PW","비밀번호가 일치하지 않습니다.",function(){});
			$("#bPw").val("");
			$("#bPwRe").val("");
			$("#bPw").focus();
		} else {
			var params = $("#updateForm").serialize();
			
			$.ajax({
				url:"User_Update_Brchs", //접속주소
				type:"post", //전송방식 : get, post
				dataType:"json",//받아올데이터형식
				data:params, //보낼 데이터(문자열 형태)
				success : function (res) {//성공 시 다음함수 실행
				if(res.msg == "success"){
					$("#updateForm").attr("action", "User_Detail_Brch");
					$("#updateForm").submit();
				}else if(res.msg == "failed"){
					makePopup("","수정에 실패하였습니다.",function(){});
				}else {
					makePopup("","수정 중 문제가 발생하였습니다.",function(){});
				}
				
				},
				error : function (request, status, error) { //실패 시 다음함수 실행
					console.log(error);
				}
				
			}); // ajax end
		}
		
	});//updateBtn end
	
	
	
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
<h1>사용자 수정</h1>

<form action="#" id="updateForm" method="post">
	<input type="hidden" id="uNo" name="uNo"  value="${data.BRCH_NO}"/>
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />

<!-- 본문 -->
<div class="main_content_area">
<div class="wrap">
	<div class="left">
		<div class="brch_no"><h3>지점번호</h3></div>
	</div>
	<div class="right">
		<div class="brch_no">${data.BRCH_NO}</div>
	</div>
	<div class="wrap">
		<div class="left">
			<div class="id"><h3>ID</h3></div>
		</div>
		<div class="right">
			<div class="id_input">
			<input type="text" id="bId" name="bId" value="${data.ID}"/>
			</div>
		</div>
	</div>
	<div class="wrap">
		<div class="left">
			<div class="now_pw"><h3>현재 PW</h3></div>
		</div>
		<div class="right">
			<div class="now_pw">${data.PW}</div>
		</div>
	</div>
	<div class="wrap">
		<div class="left">
			<div class="new_pw"><h3>새 PW</h3></div>
		</div>
		<div class="right">
			<div class="new_pw">
			<input type="password" id="bPw" name="bPw" />
			</div>
		</div>
	</div>
	<div class="wrap">
		<div class="left">
			<div class="new_pw_ok"><h3>새 PW 확인</h3></div>
		</div>
		<div class="right">
			<div class="new_pw_ok">
			<input type="password" id="bPwRe" name="bPwRe"/>
			</div>
		</div>
	</div>
	<div class="wrap">
		<div class="left">
			<div class="brch_name"><h3>지점명</h3></div>
		</div>
		<div class="right">
			<div class="brch_name">
			<input type="text" id="bNm" name="bNm" value="${data.BRCH_NAME}"/>
			</div>
		</div>
	</div>
	<div class="wrap">
		<div class="left">
			<div class="post_num"><h3>우편번호</h3></div>
		</div>
		<div class="right">
			<div class="post_num">
			<input type="text" id="bPost" name="bPost" value="${data.POST_NUM}"/>
			</div>
		</div>
	</div>
	<div class="wrap">
		<div class="left">
			<div class="dft_address"><h3>기본주소</h3></div>
		</div>
		<div class="right">
			<div class="dft_address">
			<input type="text" id="bDft" name="bDft" value="${data.DFT_ADDRESS}"/>
			</div>
		</div>
	</div>
	<div class="wrap">
		<div class="left">
			<div class="dtl_address"><h3>상세주소</h3></div>
		</div>
		<div class="right">
			<div class="dtl_address">
			<input type="text" id="bDtl" name="bDtl" value="${data.DTL_ADDRESS}"/>
			</div>
		</div>
	</div>
	<div class="wrap">
		<div class="left">
			<div class="call_num"><h3>전화번호</h3></div>
		</div>
		<div class="right">
			<div class="call_num">
			<input type="text" id="bCall" name="bCall" value="${data.CALL_NUM}"/>
			</div>
		</div>
	</div>
	<div class="wrap">
		<div class="left">
			<div class="mgr_name"><h3>점장명</h3></div>
		</div>
		<div class="right">
			<div class="mgr_name">
			<input type="text" id="mgrNm" name="mgrNm" value="${data.MGR_NAME}"/>
			</div>
		</div>
	</div>
	<div class="wrap">
		<div class="left">
			<div class="mgr_phone_num"><h3>점장휴대전화번호</h3></div>
		</div>
		<div class="right">
			<div class="mgr_phone_num">
			<input type="text" id="mgrPhone" name="mgrPhone" value="${data.MGR_PHONE_NUM}"/>
			</div>
		</div>
	</div>
</div>	
</div>
</form>
<!-- 버튼 -->
	<div class="edit_area">
	<input type="button" class="edit_btn" id="updateBtn" value="수정">
	<input type="button" class="cnl_btn" id="cnlBtn" value="취소">
	</div>
</div>
</div>
</body>
</html>