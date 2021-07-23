<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../jh/H_Menu.jsp">
	<c:param name="menuno" value="5"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POS메뉴카테고리등록</title>
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

h1 {
 margin-bottom: 40px;
 font-size: 30px;
}

table {
    width:800px;
    table-layout: fixed;
    background: #ffffff;
	margin: 10px 0  0 220px;
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

input[type=text]{
	width:200px;
	height:35px;
	font-size: 16px;
	padding-left: 5px;
}

input[type=text]:focus{
	outline:none;
}

/*카테고리 등록*/
.cate_add{
	text-align: center;
	vertical-align: top;
	margin-bottom: 70px;
	height: 55px;
}

.cate_name{
	font-size: 20px;
	font-weight: 900;
	margin-right: 10px;
}

/*등록, 수정, 삭제 버튼*/
.edit_btn, .del_btn, .add_btn, .edit_com_btn, .cnl_btn{
	width: 80px;
	color: white;
    height: 40px;
    text-align: center;
    border: 0;
    border-radius: 3px;
    font-size: 16px;
    margin: 10px;
    cursor: pointer;
    background-color: #01a1dd;
    outline: none;
    font-weight: bold;

}
.edit_btn{
 	background-color: #01a1dd;
}

.del_btn{
	background-color: #bf4040;
	display: show;
}

.add_btn{
	width: 100px;
	height: 47px;
	font-size: 18px;
}
.edit_com_btn{
	background-color: #01a1dd;
}

.cnl_btn{
	background-color: #b3b3b3;
}

.view_tr input[type='text'] {
	border: none;
	pointer-events: none;
}

/* 팝업 */

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

<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	reloadList();
	
	$(".add_btn").on("click",function() {
		if($.trim($("#inputTxt").val()) == "") {
			alert("추가할 카테고리명을 입력하세요.");
		}
		else{
			var params = $("#actionForm").serialize();
			
			$.ajax({
				url: "menuCateAdd",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res) {
					if(res.msg == "success") {
						reloadList();
					}else if(res.msg == "failed") {
						makePopup("오류", "등록에 실패했습니다.", null);
						reloadList();
					}else {
						makePopup("오류", "등록 중 문제가 발생했습니다.", null);
						reloadList();
					}
					$("#inputTxt").val("");
				},
				error: function(request, status, error) {
					console.log(error);
				}
			});
		}
	}); // add_btn click end 
	
	$("tbody").on("click", ".edit_btn", function(){
		$(this).parent().parent().attr("class", "edit_tr");
		$(this).attr("class","edit_com_btn");
		$(this).val("등록");
		$(this).parent().children(".del_btn").attr("class","cnl_btn");
		$(this).parent().children(".cnl_btn").val("취소");
	}); //edit_btn click end
	
	$("tbody").on("click", ".cnl_btn", function() {
		$(this).parent().parent().attr("class", "view_tr");
		$(this).attr("class","del_btn");
		$(this).val("삭제");
		$(this).parent().children(".edit_com_btn").attr("class","edit_btn");
		$(this).parent().children(".edit_btn").val("수정");
		reloadList();
	}); //cnl_btn click end
	
	$("tbody").on("click", ".edit_com_btn", function() {
		$("#cateNo").val($(this).parent().parent().attr("cateNo"));
		$("#cateName").val($(this).parent().parent().children().eq(1).children().val());
		
		
		var params = $("#actionForm").serialize();
		
		$.ajax({
			url: "menuCateUpdate",
			type: "post",
			dataType: "json",
			data: params,
			success: function(res) {
				if(res.msg == "success") {
					reloadList();
				}else if(res.msg == "failed") {
					makePopup("오류", "수정에 실패했습니다.", null);
					reloadList();
				}else {
					makePopup("오류", "수정 중 문제가 발생했습니다.", null);
					reloadList();
				}
			},
			error: function(request, status, error) {
				console.log(error);
			}
		}); //ajax end
		
	}); //edit_com_btn click end
	
	$("tbody").on("click",".del_btn", function() {
	
		$("#cateNo").val($(this).parent().parent().attr("cateNo"));
		
		makePopup("삭제", "해당 카테고리를 삭제하시겠습니까?", function() {
			
			var params = $("#actionForm").serialize();
			
			$.ajax({
				url: "menuCateDelete",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res) {
					if(res.msg == "success") {
						reloadList();
					}else if(res.msg == "failed") {
						makePopup("오류", "삭제에 실패했습니다.", null);
						reloadList();
					}else {
						makePopup("오류", "삭제 중 문제가 발생했습니다.", null);
						reloadList();
					}
				},
				error: function(request, status, error) {
					console.log(error);
				}
			}); //ajax end
			
		}); // makePopup end
		
	}); //del_btn_click end
	
	
}); //ready end

//리스트 데이터 불러오기
function reloadList() {
	
	$.ajax({
		url: "menuCateList",
		type: "post",
		dataType: "json",
		success : function(res) {
			drawList(res.list);
		},
		error : function(request, status, error) {
			console.log(error);
		}
	});	
}

//불러온 리스트 출력
function drawList(list) {
	var html = "";
	
	for(var d of list) {
		html += "<tr class=\"view_tr\" cateNo=\"" + d.CATE_NO + "\"cateName=\"" + d.CATE_NAME + "\">";
		html += "<td>" + d.RNUM + "</td>";
		html += "<td><input type=\"text\" id=\"name\" value=\"" + d.CATE_NAME + "\" /></td>";
		html += "<td><input class=\"edit_btn\" type=\"button\" value=\"수정\"><input class=\"del_btn\" type=\"button\" value=\"삭제\"></td>";   
		html += "</tr>";
	}
	
	$("table tbody").html(html);
}

//팝업
function makePopup(title, contents, func) {
	var html ="";
	html+= "<div class=\"bg\"></div>";	
	html+= "<div class=\"popup_Area\">";	
	html+= "<div class=\"popup_Head\">"+ title +"";	
	html+= 		"<button class=\"close_Btn\" >X</button>";	
	html+= "</div>";	
	html+= "<div class=\"popup_Content\">"+ contents +"</div>";	
	html+= 		"<div class=\"popup_Btn\">";	
	html+= 			"<button class=\"confirm_Btn\"style=\"background-color: rgb(41, 128, 185)\">확인</button>";
	html+= "</div>";	
	html+= "</div>";	
	
	$("body").prepend(html);
	$(".popup_Area").hide().show();
	
	//팝업창 닫기
	$(".close_Btn").on("click",function(){
		closePopup();
	}); 
	
	//확인버튼 
	$(".confirm_Btn").on("click", function() {
		if(func != null){
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

</script>
</head>
<body>
<!--컨텐츠 -->
<div class="content_area">
<div class="content">
<h1>POS메뉴카테고리</h1>
<div class="cate_add">
	<form action="#" id="actionForm" method="post">
		<span class="cate_name">카테고리명</span>
		<input type="text" name="inputTxt" id="inputTxt" />		
		<input type="button" class="add_btn" value="등록" />
		<input type="hidden" id="cateNo" name="cateNo" />
		<input type="hidden" id="cateName" name="cateName" />
	</form> 
</div>
<table>
	<thead>
		<tr>
			<th>NO.</th>
			<th>카테고리명</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
</div>
</div>
</body>
</html>