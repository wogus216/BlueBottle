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
<title>수정</title>
<style type="text/css">

/* 컨텐츠 부분 */

#att{
	display: none;
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
/* 메뉴수정 */

h1 {
 margin-bottom: 40px;
 font-size: 30px;
}

.row_submit{
	background-color: #01a1dd;
	float: right;
}
.row_cnl{
	background-color: #bf4040;
	margin-right:0px;
	float: right;
}

table {
    width: 100%;
    table-layout: fixed;
    background: #ffffff;
	margin: 10px 0;
	border-top: 2px solid #01a1dd;
	border-bottom: 2px solid #d9d9d9;
	text-align: center;
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
input{
	text-align: center;
	width:180px;
	height:40px;
	font-size:18px;

}

#m_img{
	width: 100px;
	padding-bottom: 20px;
}

#fileBtn{
	color: black;
    width: 150px;
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
	
	//이미지 파일 선택
	$("#fileBtn").on("click",function(){
		$("#att").click();
	});
	
	//이미지 변경 시 다시 띄우기
	$("#att").on("change", function(){
		//역슬래시를 문자열로 쓰기위해서는 두개를 사용해야 문자열로 처리된다.
		console.log($(this).val());
		console.log($(this).val().substring($(this).val().lastIndexOf("\\") +1));
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\") +1 ));
	
		var fileForm = $("#fileForm");
		
		fileForm.ajaxForm({
			
			success: function(res){
				if(res.result == "SUCCESS"){
					//올라간 파일명 저장
					if(res.fileName.length > 0){
						
							$("#m_file").val(res.fileName[0]);
							console.log($("#m_file").val(res.fileName[0]))
							makePopup("", "이미지가 변경 되었습니다.",function(){});
					
						}
				//글 저장
				var params = $("#edit_form").serialize();
				console.log(params)
				$.ajax({
				url: "Menu_Imgs",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res){
					console.log(res)
				
					if(res.msg == "success"){
						$("#edit_form").attr("action","Menu_Edit");
						$("#edit_form").submit();
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
		 			makePopup("", "파일 업로드 중 문제 발생",function(){});
				} 
			},		
			error: function(){
				makePopup("", "파일 업로드 중 문제 발생",function(){});
			}
		}); //ajaxForm end
		
		fileForm.submit();
	
	}); //이미지 변경 사진 변경해서 띄우기 종료
	
	//취소
	$(".row_cnl").on("click",function(){
		$("#edit_form").attr("action","Menu_Dtl");
		$("#edit_form").submit();
	});
	
	//엔터 방지
	$(".row_submit").on("Keypress","input",function(){
		if(event.keyCode == 13){
			return false;
		}
	});
	
	//완료 버튼
	$(".row_submit").on("click",function(){
		//$("#img_Cnt").attr("value","1");
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\") +1 ));
		var fileForm = $("#fileForm");
		
		
		
		fileForm.ajaxForm({
			beforeSubmit: function(){
			if($.trim($("#m_name").val()) == ""){
				makePopup("", "메뉴이름을 입력해주세요",function(){
					$("#m_name").focus();
					return false; // ajaxForm 실행 불가
				});
			} else if($.trim($("#m_price").val()) == ""){
				makePopup("", "가격을 입력해주세요",function(){
					$("#m_price").focus();
					return false; // ajaxForm 실행 불가
				});
			}
		},	
		success: function(res){
			if(res.result == "SUCCESS"){
				//올라간 파일명 저장
				if(res.fileName.length > 0){
						$("#m_file").val(res.fileName[0]);
						console.log($("#m_file").val(res.fileName[0]))
						makePopup("", "수정완료되었습니다.",function(){});
				
					}
			//글 저장
			var params = $("#edit_form").serialize();
			$.ajax({
				url: "Menu_Edits",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res){
					console.log(res)
				
					if(res.msg == "success"){
						$("#edit_form").attr("action","Menu_Dtl");
						$("#edit_form").submit();
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
			}); //ajax end
			
			}else{
				makePopup("", "파일 업로드 중 문제 발생",function(){});
			 	}
			},
			error: function(){
				makePopup("", "파일 업로드 중 문제 발생",function(){});
			}
		});//ajaxForm end
		
		fileForm.submit();
		
	}); // 완료 end
	
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
<form id="fileForm" action="fileUploadAjax"
		method="post" enctype="multipart/form-data">
		<input type="file" name="att" id="att"/>
</form>
<form action="#" id="edit_form" method="post">
	<input type="hidden" name="menuNo" value="${data.MNO}">
	<input type="hidden" name="page" value="${param.page}">
	<input type="hidden" name="search_Filter" value="${param.search_Filter}">
	<input type="hidden" name="search_input" value="${param.search_input}">
	<input type="hidden" id="cateNo" name="cateNo"value="${param.cateNo}"/>
<!--컨텐츠 -->
	<div class="content_area">
		<div class="content">
			<h1>POS 메뉴조회</h1>
		<div class="btn_Area">
			<input type="button" value="취소" class="row_cnl">
			<input type="button" value="완료" class="row_submit">
		</div>
	
	<table cellspacing="0">
		<colgroup>
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<tr>
			<th scope=col style= "border-left: none;">메뉴번호</th>
			<th scope=col>메뉴이름</th>
			<th scope=col>카테고리</th>
			<th scope=col>가격(원)</th>
			<th scope=col>이미지</th>
			<th scope=col>비고</th>
		</tr>

		<tr>
			<td>${data.MNO}</td>
			<td><input type="text" id="m_name" name="m_name" value="${data.MNAME}"></td>
			<td>${data.CNAME}</td>
			<td><input type="text" id="m_price" name="m_price" value="${data.MPRICE}"></td>
			<td>
				<img id="m_img" name="m_img" src="resources/upload/${data.MIMG}">
				<input type="button" value="이미지파일선택" id="fileBtn"/>
			</td>
			<td><input type="text" id="m_note" name="m_note" value="${data.NOTE}"></td>
		</tr>
		</table>
		<input type="hidden" id="userNo" name="userNo" value="${sUSERNo}"/>
		<input type="hidden" id="m_file" name="m_file" value="${data.MIMG}"/>
		</div> <!--content end  -->
	</div>  <!--content_area end  -->
</form>
</body>
</html>