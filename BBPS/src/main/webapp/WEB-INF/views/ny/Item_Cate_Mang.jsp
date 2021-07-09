<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목카테고리등록</title>
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
.edit_btn, .del_btn, .add_btn, .edit_com_btn{
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
	$(".top_menu").on("click","a",function(){
		$(".top_menu a").attr("style","color: black");
		$(this).css("color", "#01a1dd");
		$(this).parent().parent().children(1).css("color", "#01a1dd");
	}); //top menu click end
	
	$(".sub").hover(function(){
		$("li").css("background-color","white");
		$(this).parent("li").css("background-color","#f1f1f1");
	
	},function(){
			$("li").css("background-color","white");
	}); //sub menu hover end
	
	reloadList();
	
	$(".add_btn").on("click",function() {
		if($.trim($("#inputTxt").val()) == "") {
			alert("추가할 카테고리명을 입력하세요.");
		}
		else{
			var params = $("#actionForm").serialize();
			
			$.ajax({
				url: "cateAdd",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res) {
					if(res.msg == "success") {
						location.href = "Notice_Cate_Mang";
					}else if(res.msg == "failed") {
						alert("등록에 실패하였습니다.");
					}else {
						alert("등록 중 문제가 발생하였습니다.");
					}
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
		$(this).parent().children(".del_btn").css("display", "none");
	}); //edit_btn click end
	
	$("tbody").on("click", ".edit_com_btn", function() {
		$("#cateNo").val($(this).parent().parent().attr("cateNo"));
		$("#cateName").val($(this).parent().parent().children().eq(1).children().val());
		
		
		var params = $("#actionForm").serialize();
		
		$.ajax({
			url: "cateUpdate",
			type: "post",
			dataType: "json",
			data: params,
			success: function(res) {
				if(res.msg == "success") {
					location.href = "Notice_Cate_Mang";
				}else if(res.msg == "failed") {
					alert("수정에 실패하였습니다.");
				}else {
					alert("수정 중 문제가 발생하였습니다.");
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
				url: "cateDelete",
				type: "post",
				dataType: "json",
				data: params,
				success: function(res) {
					if(res.msg == "success") {
						location.href = "Notice_Cate_Mang";
					}else if(res.msg == "failed") {
						alert("삭제에 실패하였습니다.");
					}else {
						alert("삭제 중 문제가 발생하였습니다.");
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
		url: "cateList",
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
		html += "<td>" + d.CATE_NO + "</td>";
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

</script>
</head>
<body>
<!-- 상단 -->
  <div class="top">
     <ul>
         <li>
         <a href="#">
         <img class="logo" alt="logo" src="resources/images/bb/logo.png" width="250px"></a>
         </li>
         
         <div class="top_menu">
         
         <div class="menu_a">
         <li>
         	<a class="main_menu" href="#">
         		발주관리</a>
	         <div class="sub">
	            <a href="#">
	            	발주요청조회</a>
	             <a href="#">
	            	발주완료조회</a>
	         </div>
          </li>
         </div>
         
         <div class="menu_b">
         <li>
         	<a class="main_menu" href="#">
         		발송관리</a>
	         <div class="sub">
	            <a href="#">
	            	발송요청조회</a>
	             <a href="#">
	            	발송완료조회</a>
	         </div>
          </li>
         </div>
         
         <div class="menu_c">
         <li>
         	<a class="main_menu" href="#">
         		환불관리</a>
	         <div class="sub">
	            <a href="#">
	            	환불요청조회</a>
	             <a href="#">
	            	환불완료조회</a>
	         </div>
          </li>
         </div>
         
         <div class="menu_d">
         <li>
         	<a class="main_menu" href="#">
         		재고관리</a>
	          	<div class="sub">
     			<a href="#">		
	            	재고조회</a>
     			<a href="#">
	            	재고등록</a>
	            <a href="#">	
	            	입출고조회</a>
	            <a href="#">
	            	폐기조회</a>
	            </div>
          </li>
         </div>
         
         <div class="menu_e">
	         <li>
			<a class="main_menu" href="#"> 
		        		품목관리</a>
		          	<div class="sub">
					<a href="#">
		            	품목조회</a>
		            <a href="#">
		            	품목등록</a>
		            </div>
	          </li>
         </div>
         
            <div class="menu_f">
	         <li>
			<a class="main_menu" href="#"> 
		        		카테고리관리</a>
		          	<div class="sub">
					<a href="#">
		            	공지카테고리</a>
		            <a href="#">
		            	품목카테고리</a>
		            <a href="#">
		            	메뉴카테고리</a>
		            </div>
	          </li>
         </div>
         
         <div class="menu_g">
         <li>
         	<a class="main_menu" href="#"> 
         		POS관리</a>
	          <div class="sub" >
				<a href="#">
	            	메뉴조회</a>
				<a href="#">
	            	메뉴등록</a>
            </div>	
          </li>
         </div>
          <div class="menu_h">
         	<li>
         		<a class="main_menu" href="#"> 
         			공지사항</a>
	        </li>
         </div>
         <div class="menu_i">
         	<li>
         	<a class="main_menu" href="#"> 
         			사용자관리</a>
         		 <div class="sub" style="min-width: 145px;">
			<a href="#">
	            	사용자조회</a>
	          <a href="#">
	            	사용자등록</a>
            </div>	
	        </li>
         </div>
          <div class="menu_j">
          <li>
          <a class="main_menu" href="#"> 
         		마이페이지</a>
           </li>
         </div>
         <a class="log_out" href="#">
         		로그아웃</a>
      	</div>
      </ul>
   </div>

<!--컨텐츠 -->
<div class="content_area">
<div class="content">
<h1>품목카테고리</h1>
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