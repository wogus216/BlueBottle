<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<c:import url="H_Menu.jsp">
	<c:param name="menuno" value="9"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록</title>
<style type="text/css">
.file_form_wrap {
	
	display: none;
		
} 
/* 컨텐츠 부분 */

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

/* 버튼 */
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

input[type='button']:focus{outline:none;}


.submit_area{
	text-align: center;
}

.submit,.cnl{
	width:200px;
	height: 50px;
	background-color: #1bc1fe;
	font-weight: bold;
	 font-size: 22px;
}
.cnl{
	background-color: #b3b3b3;
}

/* 입력폼 */
.container{
	display: flex;
	flex-direction: column;
	height: 500px;
	align-items: center;
	justify-content: center;
	font-size: 20px;
}
input{
	width: 350px;
	margin: 15px 0;
	outline: none;
	text-align: center;
	font-size: 20px;
	height: 30px;
	
}
.m_cate{
	width: 358px;
    height: 36px;
    margin: 15px 0;
    font-size: 18px;
}
input:focus{
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

#fileName{
	text-align: center;
}
#file_btn{

	width: 358px;
    background-color: darkgray;
   	margin: 10px 0 0 0;
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
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	//취소
	$(".cnl").on("click",function(){
		$("#edit_form").attr("action", "Menu_List");
		$("#edit_form").submit();
	});
	
	
	//엔터 방지
	$(".submit").on("Keypress","input",function(){
		if(event.keyCode == 13){
			return false;
		}
	});
	
	//파일 추가 
		$("#file_btn").on("click",function(){
			$("#att").click();
		});

	
	
	$("#att").on("change", function(){
		//역슬래시를 문자열로 쓰기위해서는 두개를 사용해야 문자열로 처리된다.
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\") +1 ));
	});
	
	
	
	//추가완료 버튼
	$(".submit").on("click",function(){
		var fileForm = $("#fileForm");
		
		fileForm.ajaxForm({
			beforeSubmit: function(){
				if($.trim($("#m_name").val()) == ""){
					makePopup("", "메뉴이름을 입력해주세요",function(){});
					return false; // ajaxForm 실행 불가
					
				} else if($.trim($("#m_cate").val()) == "카테고리명"){
					makePopup("", "카테고리를 선택",function(){}); 
					return false; // ajaxForm 실행 불가
					
				} else if($.trim($("#m_price").val()) == ""){
					makePopup("", "가격을 입력해주세요",function(){}); 
					return false; // ajaxForm 실행 불가
				} 
			},
			success: function(res){
				if(res.result == "SUCCESS"){
					//올라간 파일명 저장
					if(res.fileName.length > 0){
						
							$("#m_file").val(res.fileName[0]);
							console.log($("#m_file").val(res.fileName[0]))
							makePopup("", "메뉴등록되었습니다.",function(){});
					
						}
				//글 저장
				var params = $("#add_form").serialize();
				console.log(params)
				$.ajax({
				url: "Menu_Adds",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res){
					console.log(res)
				
					if(res.msg == "success"){
						location.href = "Menu_List";
					} 
					else if(res.msg == "failed"){
							makePopup("", "작성 실패.",function(){});
					} 
					else{
							makePopup("", "수정 중 에러 발생",function(){});
					 }
				  },
				  error: function(request, status, error){
						console.log(error);
					}
				});
			}else{
		 			makePopup("", "파일 업로드 중 문제 발생1",function(){});
				} 
			},		
			error: function(){
				makePopup("", "파일 업로드 중 문제 발생2",function(){});
			}
		}); //ajaxForm end
		
		fileForm.submit();
	}); //추가완료 end 
	
});//ready end
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
<form action="#" id="edit_form" method="post">
	<input type="hidden" name="posMenuNo" value="${data.MNO}">
	<input type="hidden" id="cateNo" name="cateNo"value="${param.cateNo}"/>
	<input type="hidden" name="page" value="${param.page}">
	<input type="hidden" name="search_Filter" value="${param.search_Filter}">
	<input type="hidden" name="search_input" value="${param.search_input}">
	<input type="hidden" name="cate" value="${param.cate}">
</form>

<!--컨텐츠 -->
	<div class="content_area">
		<div class="content">
			<h1>POS 메뉴등록</h1>
<!--파일 업로드 -->
	<div class="file_form_wrap">
		<form id="fileForm" action="fileUploadAjax"
			method="post" enctype="multipart/form-data">
			<input type="file" name="att" id="att" />
		</form>
	</div>
<!--메뉴 넣기 -->
	<form action="#" id="add_form" method="post">
	
		<div class="container">
			<div>메뉴이름<div>
			<input type="text" id="m_name" name="m_name" placeholder="메뉴이름를입력해주세요"/>
			<div>카테고리</div>
					<select class="m_cate" name ="m_cate">
						<option selected="selected">카테고리명</option>
						<option value="0">음료</option>
						<option value="1">제과</option>
						<option value="2">굿즈</option>
						<option value="3">원두</option>
					</select>
			
			<div>메뉴가격</div>
			<input type="text" id="m_price" name="m_price" placeholder="가격을입력해주세요"/>
			<div>비고</div>
			<input type="text" id="m_Note" name="m_Note"></div>
			<div>이미지</div>
			<input type="button" value="첨부파일선택" id="file_btn"/>
			<div id="fileName"></div>
			<input type="hidden" id="userNo" name="userNo" value="${sUSERNo}"/>
			<input type="hidden" id="m_file" name="m_file"/>
		</div>
	</div>
		</form>
			<div class="submit_area">
				<input type="button" class="cnl" value="취소">
				<input type="button" class="submit" value="완료">
			</div>
		</div> <!--content end  -->
	</div>  <!--content_area end  -->
</body>
</html>