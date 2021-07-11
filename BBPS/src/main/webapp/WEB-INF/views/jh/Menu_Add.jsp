<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 

<c:import url="H_Menu.jsp"></c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록</title>
<style type="text/css">
 #att {
	
} 
/* 컨텐츠 부분 */

.content_Area{
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
/* 메뉴등록 */

h1 {
 margin-bottom: 40px;
 font-size: 30px;
}

.row_Add{
	background-color: #01a1dd;
	float: right;
}
.row_Del{
	background-color: #bf4040;
	margin-right:0px;
	float: right;
}

.m_Cate{
	width: 200px;
	height: 50px;
	font-size: 18px;
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
	font-size:18px;
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

.menu_Img{
	width: 100px;
	padding-bottom: 20px;
}


/* 버튼 */
button{
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

button:focus{outline:none;}


.submit_area{
	text-align: center;
}

.submit,.cnl{
	width:200px;
	height: 50px;
	background-color: #01a1dd;
	font-weight: bold;
	 font-size: 22px;
}
.cnl{
	background-color: #b3b3b3;
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
.popup_Area {
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
.popup_Head{
	height: 30px;
	font-size: 16pt;
	background-color: #01a1dd;
	color:white;
	padding:10px;
	font-weight:bold;
}
.popup_Btn{
	text-align:center;
}
.popup_Btn button{
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
.popup_Content{
	margin-bottom:80px;
	margin-top:20px;
	margin-left:20px;
	text-align:center;
	font-size:18px;
	color: black
}
button:focus{outline:none;}

.close_Btn{
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
		history.back();
	});
	
	//행추가
	$(".row_Add").on("click",function(){
		add();
	});
	
	//행삭제
	$(".row_Del").on("click",function(){
		del();
	});
	
	//엔터 방지
	$(".submit").on("Keypress","input",function(){
		if(event.keyCode == 13){
			return false;
		}
	});
	
	//파일 추가 
	$("#file_Btn").on("click",function(){
		$("#att").click();
	});
	
	
	
	$("#att0").on("change", function(){
		//역슬래시를 문자열로 쓰기위해서는 두개를 사용해야 문자열로 처리된다.
		$("#fileName").html($(this).val().substring($(this).val().lastIndexOf("\\") +1 ));
	});
	
	
	
	//추가완료 버튼
	$(".submit").on("click",function(){
		var fileForm = $("#fileForm");
		
		fileForm.ajaxForm({
			beforeSubmit: function(){
				if($.trim($("#m_Name").val()) == ""){
					makePopup("", "메뉴이름을 입력해주세요",function(){});
					return false; // ajaxForm 실행 불가
					
				} else if($.trim($("#m_Cate").val()) == "카테고리명"){
					makePopup("", "카테고리를 선택",function(){}); 
					return false; // ajaxForm 실행 불가
					
				} else if($.trim($("#m_Price").val()) == ""){
					makePopup("", "가격을 입력해주세요",function(){}); 
					return false; // ajaxForm 실행 불가
				} 
			},
			success: function(res){
				if(res.result == "SUCCESS"){
					//올라간 파일명 저장
					if(res.fileName.length > 0){
							$("#m_File").val(res.fileName[0]);
							console.log($("#m_File").val(res.fileName[0]))
							makePopup("", "파일 올라갔습니다.",function(){});
					}
				//글 저장
				var params = $("#add_Form").serialize();
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
		 			makePopup("", "파일 업로드 중 문제 발생",function(){});
				} 
			},		
			error: function(){
				makePopup("", "파일 업로드 중 문제 발생",function(){});
			}
		}); //ajaxForm end
		
		fileForm.submit();
	}); //추가완료 end 
	
});//ready end
	/* 팝업 */
	function makePopup(title, contents, func) {
		var html ="";
		html+= "<div class=\"bg\"></div>";	
		html+= "<div class=\"popup_Area\">";	
		html+= "<div class=\"popup_Head\">"+ title +"";	
		html+= 		"<button class=\"close_Btn\">X</button>";	
		html+= "</div>";	
		html+= "<div class=\"popup_Content\">"+ contents +"</div>";	
		html+= 		"<div class=\"popup_Btn\">";	
		html+= 			"<button class=\"confirm_Btn\"style=\"background-color: rgb(41, 128, 185)\">확인</button>";	
		html+= 	 	"</div>";
		html+= "</div>";	
		
		$("body").prepend(html);
		$(".popup_Area").hide().show();
		
		$(".popup_Btn, .close_Btn").on("click",function(){
			if(func !=null){
				func.call();
			}
			closePopup();
			});
		}

	function closePopup() {
		$(".bg, .popup_Area").fadeOut(function(){
			$(".bg, .popup_Area").remove();
		}); //popup_Btn end
	}	
	/* 행추가 */
	function add(){
		var trCnt = $("#add_Tb tbody tr").length;
		
		if(trCnt < 5){
			var add ="";
				// " + + "
				add+=" <tr>";
				add+="		<td><input type=\"text\" id=\"m_Name\" name=\"m_Name\"></td>";
				add+="		<td>";
				add+="			<select class=\"m_Cate\" name =\"m_Cate\">";
				add+="				<option selected=\"selected\">카테고리명</option>";
				add+="				<option value=\"0\">음료</option>";
				add+="				<option value=\"1\">제과</option>";
				add+="				<option value=\"2\">굿즈</option>";
				add+="				<option value=\"3\">원두</option>";
				add+=" 			</select>";
				add+=" 		</td>";
				add+= "		<td><input type=\"text\" id=\"m_Price\" name=\"m_Price\"></td>";
				add+= "		<td><input type=\"button\" value=\"첨부파일선택\" id=\"file_Btn\"></td>";
				add+= "		<td><input type=\"text\" id=\"m_Note\" name=\"m_Note\"></td>";
				add+= "		<td><input type=\"hidden\" id=\"userNo\" name=\"userNo\" value=\"${sUSERNo}\"/></td>";
				add+= "		<td><input type=\"hidden\" id=\"m_File\" name=\"m_File\"/></td>";
				add+= "</tr>";
				
				$("body #add_Tb tbody").append(add);
			}else{
				makePopup("", "최대 5개까지만 가능합니다.",function(){
				});
			}
	}
	/* 행삭제 */
	function del(){
		$("#add_Tb tbody tr:last").remove();
	}
	
	
</script>
</head>
<body>
<form action="#" id="edit_Form" method="post">
	<input type="hidden" name="menuNo" value="${data.MNO}">
	<input type="hidden" name="page" value="${param.page}">
	<input type="hidden" name="search_Filter" value="${param.search_Filter}">
	<input type="hidden" name="search_input" value="${param.search_input}">
</form>

<!--컨텐츠 -->
	<div class="content_Area">
		<div class="content">
			<h1>POS 메뉴등록</h1>
		<div class="btn_Area">
			<button class="row_Del">행삭제</button>
			<button class="row_Add">행추가</button>
		</div>
	<form id="fileForm" action="fileUploadAjax"
		method="post" enctype="multipart/form-data">
		<input type="file" name="att" id="att"/>
	</form>
	<form action="#" id="add_Form" method="post">
	<table id="add_Tb" cellspacing="0">
		<colgroup>
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope=col style= "border-left: none;">메뉴이름</th>
				<th scope=col>카테고리</th>
				<th scope=col>가격(원)</th>
				<th scope=col>이미지</th>
				<th scope=col>비고</th>
			</tr>
		</thead>
		<tbody>
			 <tr>
				<td><input type="text" id="m_Name" name="m_Name"></td>
				<td>
					<select class="m_Cate" name ="m_Cate">
						<option selected="selected">카테고리명</option>
						<option value="0">음료</option>
						<option value="1">제과</option>
						<option value="2">굿즈</option>
						<option value="3">원두</option>
					</select>
				</td>
				<td><input type="text" id="m_Price" name="m_Price"></td>
				<td><input type="button" value="첨부파일선택" id="file_Btn"></td>
				<td><input type="text" id="m_Note" name="m_Note"></td>
				<td><input type="hidden" id="userNo" name="userNo" value="${sUSERNo}"/></td>
				<td><input type="hidden" id="m_File" name="m_File"/></td>
			</tr> 
		</tbody>
		</table>
		<!--  
			<input type="hidden" id="userNo" name="userNo" value="${sUSERNo}"/> 	
			<input type="hidden" id="m_File" name="m_File"/> 
		-->
		</form>
			<div class="submit_area">
				<button class="cnl">취소</button>
				<button class="submit">완료</button>
			</div>
		</div> <!--content end  -->
	</div>  <!--content_Area end  -->
</body>
</html>