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
.top_Menu{
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

.menu_Area{
	width: 1600px;
	height: 60px;
}

.menu1_wrap_on > .menu_depth1{
	color: #01a1dd;
}
.menu1_wrap, .menu1_wrap_on{
	display: inline-table;
	cursor: pointer;
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
.log_Out{
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
    margin-top: 12px;
}



</style>

<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//메뉴 그리기
	reLoadMenu();
	//1뎁스 클릭시 효과 변화

	
	
	
}); //ready end
function menuFunction(){
	$(".menu1_wrap").on("click",".menu_depth1",function(){
		$(".menu1_wrap_on").attr("class","menu1_wrap");
		$(this).parent().parent().attr("class","menu1_wrap_on");
		$(".menu_depth1").css("color", "black");
		$(this).css("color", "#01a1dd");
	
	});
	
	$(".menu_depth2").on("click",function(){
	});
	
	//2뎁스 호버 시 효과
	$(".menu_depth2_area").children().hover(function(){
		$(this).parent().parent().parent().parent().children().eq(0).css("background-color", "#f2f2f2");
	},function(){
		$(this).parent().parent().parent().parent().children().eq(0).css("background-color", "white");
	});
	
	
	//로그아웃
	$("#log_Out").on("click",function(){
		location.href = "H_LogOut";
	});
	
}


function reLoadMenu(){
	var params = $("#h_Menu_Form").serialize();
	
	//ajax
	$.ajax({
		url: "H_Menus",
		type: "post",
		data : params, 
		success: function(res){
			console.log(res);
			drawMenu(res.menu);
			menuFunction();
		},
		error : function(request, status, error){
			console.log(error);
			console.log(request);
			console.log(status);
		}
	});
	
}


function drawMenu(menu){
	var html = "";
	//	" +  + "
	
	html += "<div class=\"logo_area\">";
	html += "	<img class=\"logo\" alt=\"logo\" src=\"resources/images/bb/logo.png\" width=\"250px\">";
	html += "  </div>";
	for(var i =0; i < menu.length; i++){
		if(menu[i].DEPTH == 1 && menu[i].SUB == 1){
					html += "<div class=\"menu1_wrap\" menuno=\"" + menu[i].SITE_MENU_NO + "\">";
					html +="	<div class=\"menu1_title\">";
					html +=			"<div class=\"menu_depth1\">" + menu[i].SITE_MENU_NAME + "</div>";
					html +=		"</div>";
		}
		
		else if(menu[i].DEPTH == 1 && menu[i].SUB == 0){
					html += "<div class=\"menu1_wrap\" menuno=\"" + menu[i].SITE_MENU_NO + "\">";
					html +="	<div class=\"menu1_title\">";
					html +=			"<div class=\"menu_depth1\">" + menu[i].SITE_MENU_NAME + "</div>";
					html +=		"</div>";
					
			for(var j = menu.length -1; j > i;	j--){
				if(menu[i].SITE_MENU_NO == menu[j].TOP){
					//if(menu[j].SITE_MENU_NO == $("#menuno").val()){
						if(menu[j].DEPTH == 2){
							html +="<div class=menu2_wrap " + menu[j].SITE_MENU_NO + "\">";
							}
							html +=		"<div class=menu2_title>";
							html +=			"<div class=menu_depth2_area \" >";
									if(menu[i].SITE_MENU_NO == 2){
							html +=			"<div class=\"menu_depth2\">" + menu[j].SITE_MENU_NAME + "</div>";
							html +=			"<div class=\"menu_depth2\">" + menu[j-1].SITE_MENU_NAME + "</div>";
									} 
									else if(menu[i].SITE_MENU_NO == 5){
							html +=			"<div class=\"menu_depth2\">" + menu[j].SITE_MENU_NAME + "</div>";
							html +=			"<div class=\"menu_depth2\">" + menu[j-1].SITE_MENU_NAME + "</div>";
							html +=			"<div class=\"menu_depth2\">" + menu[j-2].SITE_MENU_NAME + "</div>";
									}
							html +=			"</div>";
							html +=		"</div>";
							html +=	  "</div>";
							html +="</div>";
							//}
						}
					}
				}
			html +="</div>";
		}
			
		html +="<input type=\"button\" value=\"로그아웃\" class=\"log_Out\"/ id=\"log_Out\">";
	$(".top_Menu").html(html);
}


</script>

</head>
<body>
<form action="#" id="h_Menu_Form" method="post">
		<input type="hidden"  id="hUserNo" name="hUserNo" value="${hUserNo}">
		<input type="hidden"  id="hDt" name="hDt" value="${hDt}">
</form>

         	<!-- 탑메뉴 -->
 	<div class="top_Menu">
    
		<!-- 
	       		<div class="logo_area">
		         	<img class="logo" alt="logo" src="resources/images/bb/logo.png" width="250px">
		        </div>
		  <div class="menu1_wrap">	  
	          <div class="menu1_title">
		         	<div class="menu_depth1">주문관리</div>
		      </div>
	      </div>
	      
	      <div class="menu1_wrap">	  
	          <div class="menu1_title">
	         		<div class="menu_depth1">품목관리</div>
		      </div>
		       <div class=menu2_wrap>
						<div class=menu2_title>
							 <div class=menu_depth2_area>
							   <div class="menu_depth2_1">품목목록</div>
							   <div class="menu_depth2">폐기목록</div>
							 </div>
						</div>
			  </div>
	      </div>
	      
	       <div class="menu1_wrap">	  
	          	<div class="menu1_title">
	         		<div class="menu_depth1">카테고리관리</div>
		      	</div>
		       <div class=menu2_wrap>
						<div class=menu2_title>
							<div class="menu_depth2_area">
								<div class="menu_depth2_1">공지카테고리</div>
								<div class="menu_depth2">품목카테고리</div>
								<div class="menu_depth2">메뉴카테고리</div>
							</div>
						</div>
			  </div>
	      </div>
	      <div class="menu1_wrap">	  
	          <div class="menu1_title">
	         		<div class="menu_depth1">POS관리</div>
		      </div>
	      </div>
	      
	      <div class="menu1_wrap">	  
	          <div class="menu1_title">
	         		<div class="menu_depth1">매출목록</div>
		      </div>
	      </div>
	      
	      <div class="menu1_wrap">	  
	          <div class="menu1_title">
	         		<div class="menu_depth1">공지사항</div>
		      </div>
	      </div>
	      
	       <div class="menu1_wrap">	  
	          <div class="menu1_title">
	        		 <div class="menu_depth1">사용자관리</div>
		      </div>
	      </div>
	      
	       <div class="menu1_wrap">	  
	          <div class="menu1_title">
	        		 <div class="menu_depth1">마이페이지</div>
		      </div>
	      </div>
			
	     	<input type="button" value="로그아웃" class="log_out"/>
	       -->
	 </div>
	 

</html>