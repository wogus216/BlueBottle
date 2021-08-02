<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>본사 메뉴</title>
<style type="text/css">

/*	css color
 *	흰색 white
 *	검은색 black
 *	회색 f2f2f2
 *	파란색 01a1dd;
 */

html,body{
	/*font-size: 0px; 필요 시 다시 살리기*/
    margin: 0px;
    position: relative;
    width: 100%;
    height: 100%;
    min-width: 1280px;
    background-color: #f2f2f2;
}


/* 상단 바 */
.top_menu{
	min-width: 1280px;
	height: 60px;
	text-align: end;
	background-color: white;
	
}
.logo_area{
	display: inline-block;
	cursor: pointer;
	float: left;
}
.logo {
   padding: 13px 30px;
}
/* 상위메뉴 */

.menu_area{
	width: 1600px;
	height: 60px;
}
.menu1_wrap, .menu1_wrap_on{

	display: inline-table;
	cursor: pointer;
}

.menu1_wrap_on > .menu1_title > .menu_depth1{
	color: #01a1dd;
}
.menu1_title {
	display: inline-table;
	width: 128px;
	height: 60px;
	background-color: white;
}

.menu_depth1{
	display: table-cell;
	vertical-align: middle;
	font-size: 17px;
	font-weight: bold;
	text-align: center;
	color: black;
}

.menu_depth1:hover, .menu1_wrap_on:hover{
	background-color: #f2f2f2;
}

.menu1_wrap:hover  > .menu2_wrap, .menu1_wrap_on:hover > .menu2_wrap{
	display: block;
}

/* 하위메뉴 */
.menu2_wrap{
	display: none;
    background-color: white;
    min-width: 128px;
    box-shadow: 0px 8px 16px 0px rgb(0 0 0 / 20%);
    z-index: 1;
    font-size: 15px;
    text-align: center;
    cursor: pointer;
    background-color: #f9f9f9;
}


.menu2_title{
	display: inline-table;
	width: 100%;

}

.menu_depth2_area{
	display: table-cell;
	vertical-align: middle;
	font-size: 15px;
	text-align: center;
	color: black;
}

.menu_depth2{
	padding: 10px;
}
.menu_depth2:hover{
	background-color: #f2f2f2;
}
/* 로그아웃 */
.top_menu > .log_out{
	width: 90px;
    height: 35px;
    color: white;
    font-size: 15px;
    background-color: #01a1dd;
    border: none;
    cursor: pointer;
    float: right;
    font-weight: bold;
    border-radius: 5px;
    margin: 12px 0px 0px 0px;
}

</style>

<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//메뉴 그리기
	reLoadMenu();
	
	//로고 클릭
	$("body").on("click",".logo",function(){
		location.href = "Ord_Mang";
	});
	
	//1뎁스 클릭 시 효과
	$("body").on("click",".menu1_wrap",function(){
		
		$(this).attr("class","menu1_wrap_on");
	});
	

	//2뎁스 호버 시 효과
	$(".top_menu .menu_depth2_area").children().hover(function(){
		$(this).parent().parent().parent().parent().children().eq(0).css("background-color", "#f2f2f2");
	},function(){
		$(this).parent().parent().parent().parent().children().eq(0).css("background-color", "white");
	});
	
	// 1뎁스 클릭 시 메뉴이동
	$(".top_menu").on("click", ".menu_depth1",function(){
		$("#h_menu_form").attr("action",$(this).parent().parent().attr("addr"));
		$(this).parent().parent().css("color","#01a1dd");
		$("#menuNo").val($(this).attr("menuno"));
		console.log($("#menuNo").val());
		$("#h_menu_form").submit();
	});
	
	// 2뎁스 클릭 시 메뉴이동
	$(".top_menu").on("click", ".menu_depth2",function(){
		$("#h_menu_form").attr("action",$(this).attr("addr"));
		$(this).parent().parent().css("color","#01a1dd");
		$("#menuNo").val($(this).attr("menuno"));
		console.log($("#menuNo").val());
		$("#h_menu_form").submit();
	});
	
	//로그아웃
	$("body").on("click", "#log_out",function(){
		location.href = "H_LogOut";
	});
	
}); //ready end


function reLoadMenu(){
	var params = $("#h_menu_form").serialize();
	
	//ajax
	$.ajax({
		url: "H_Menus",
		type: "post",
		data : params, 
		success: function(res){
			console.log(res);
			drawMenu(res.menu);
			
		},
		error : function(request, status, error){
			console.log(error);
			console.log(request);
			console.log(status);
		}
	});
	
}
//메뉴 그리기
function drawMenu(menu){
	var html = "";
	//	" +  + "
	
	html += "<div class=\"logo_area\">";
	html += "	<img class=\"logo\" alt=\"logo\" src=\"resources/images/bb/logo.png\" width=\"250px\">";
	html += "  </div>";
	for(var i =0; i < menu.length; i++){
		//메뉴 1뎁스 이면서 하위메뉴가 없는 경우
		if(menu[i].DEPTH == 1 && menu[i].SUB == 1){
				if(menu[i].SITE_MENU_NO == "${param.menuno}"){
					html += "<div class=\"menu1_wrap_on\" menuno=\"" + menu[i].SITE_MENU_NO + "\" addr = \""+menu[i].MADDR + "\">";
				}
				else{
					html += "<div class=\"menu1_wrap\" menuno=\"" + menu[i].SITE_MENU_NO + "\" addr = \""+menu[i].MADDR + "\">";
				}
					html +="	<div class=\"menu1_title\">";
					html +=			"<div class=\"menu_depth1\" menuno=\"" + menu[i].SITE_MENU_NO + "\">" + menu[i].SITE_MENU_NAME + "</div>";
					html +=		"</div>";
				}
		//메뉴 1뎁스 이면서 하위메뉴가 있는 경우
		else if(menu[i].DEPTH == 1 && menu[i].SUB == 0){
			if(menu[i].SITE_MENU_NO == "${param.menuno}"){
					html += "<div class=\"menu1_wrap_on\" menuno=\"" + menu[i].SITE_MENU_NO + "\" addr = \""+menu[i].MADDR + "\">";
				}
				else{
					html += "<div class=\"menu1_wrap\" menuno=\"" + menu[i].SITE_MENU_NO + "\" addr = \""+menu[i].MADDR + "\">";
				}
					html +="	<div class=\"menu1_title\">";
					html +=			"<div class=\"menu_depth1\" menuno=\"" + menu[i].SITE_MENU_NO + "\">" + menu[i].SITE_MENU_NAME + "</div>";
					html +=		"</div>";
			for(var j = menu.length -1; j > i;	j--){
				if(menu[i].SITE_MENU_NO == menu[j].TOP){
						if(menu[j].DEPTH == 2){
							html +="<div class=\"menu2_wrap\" menuno=\"" + menu[j].SITE_MENU_NO + "\"  addr = \""+menu[i].MADDR + "\">";
							}
							html +=		"<div class=\"menu2_title\">";
							html +=			"<div class= \"menu_depth2_area \">";
									if(menu[i].SITE_MENU_NO == 2 && $("#Dt").val() == "0"){
							html +=			"<div class=\"menu_depth2\" menuno=\"" + menu[j + 1].SITE_MENU_NO + "\" addr = \""+menu[i].MADDR + "\">" + menu[j-1].SITE_MENU_NAME + "</div>";
							html +=			"<div class=\"menu_depth2\" menuno=\"" + menu[j].SITE_MENU_NO + "\" addr = \""+menu[j].MADDR + "\">" + menu[j].SITE_MENU_NAME + "</div>";
									}
									else if(menu[i].SITE_MENU_NO == 2 && $("#Dt").val() != "0" ){
							html +=			"<div class=\"menu_depth2\"  menuno=\"" + menu[j].SITE_MENU_NO + "\" addr = \""+menu[j].MADDR + "\">" + menu[j].SITE_MENU_NAME + "</div>";
									} 
									else if(menu[i].SITE_MENU_NO == 5){
							html +=			"<div class=\"menu_depth2\" menuno=\"" + menu[j-2].SITE_MENU_NO + "\" addr = \""+menu[j-2].MADDR + "\">" + menu[j-2].SITE_MENU_NAME + "</div>";
							html +=			"<div class=\"menu_depth2\" menuno=\"" + menu[j-1].SITE_MENU_NO + "\" addr = \""+menu[j-1].MADDR + "\">" + menu[j-1].SITE_MENU_NAME + "</div>";
							html +=			"<div class=\"menu_depth2\" menuno=\"" + menu[j].SITE_MENU_NO + "\" addr = \""+menu[j].MADDR + "\">" + menu[j].SITE_MENU_NAME + "</div>";
									}
							html +=			"</div>";
							html +=		"</div>";
							html +=	  "</div>";
							html +="</div>";
							
						}
					}
				}
			html +="</div>";
		}
			
		html +="<input type=\"button\" value=\"로그아웃\" class=\"log_out\"/ id=\"log_out\">";
	
		$(".top_menu").html(html);
		console.log("${param.menuno}");
		
}


</script>

</head>
<body>
<form action="#" id="h_menu_form" method="post">
		<!-- 부서번호 -->
		<input type="hidden"  id="Dt" name="Dt" value="${sDEPNo}">
		<!-- 유저번호 -->
		<input type="hidden"  id="uNo" name="uNo" value="${sUSERNo}">
		<!-- 권한번호 -->
		<input type="hidden"  id="auNo" name="auNo" value="${sAUTHNo}">
		<!-- 메뉴번호 -->
		<input type="hidden"  id="menuNo" name="menuNo"/>
</form>

         	<!-- 탑메뉴 -->
 	<div class="top_menu"></div>
	 

</html>