<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>지점메뉴</title>
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
.logo_Area{
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
.menu1_Wrap, .menu1_Wrap_on{

	display: inline-table;
	cursor: pointer;
}

.menu1_Wrap_on > .menu1_Title > .menu_Depth1{
	color: #01a1dd;
}
.menu1_Title {
	display: inline-table;
	width: 128px;
	height: 60px;
	background-color: white;
}

.menu_Depth1{
	display: table-cell;
	vertical-align: middle;
	font-size: 17px;
	font-weight: bold;
	text-align: center;
	color: black;
}


.menu_Depth1:hover, .menu1_Wrap_on:hover{
	background-color: #f2f2f2;
}

.menu1_Wrap:hover  > .menu2_Wrap, .menu1_Wrap_on:hover > .menu2_Wrap{
	display: block;
}

/* 하위메뉴 */
.menu2_Wrap{
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


.menu2_Title{
	display: inline-table;
	width: 100%;

}

.menu_Depth2_Area{
	display: table-cell;
	vertical-align: middle;
	font-size: 15px;
	text-align: center;
	color: black;
}

.menu_Depth2{
	padding: 10px;
}
.menu_Depth2:hover{
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
	
	//1뎁스 클릭 시 효과
	$("body").on("click",".menu1_Wrap",function(){
		
		$(this).attr("class","menu1_Wrap_on");
	});
	
	//2뎁스 호버 시 효과
	$(".top_Menu .menu_Depth2_Area").children().hover(function(){
		$(this).parent().parent().parent().parent().children().eq(0).css("background-color", "#f2f2f2");
	},function(){
		$(this).parent().parent().parent().parent().children().eq(0).css("background-color", "white");
	});
	
	//메뉴이동
	$(".top_Menu").on("click", ".menu_Depth1",".menu_Depth2",function(){
		$("#b_Menu_Form").attr("action",$(this).parent().parent().attr("addr"));
		
		$("#b_Menu_Form").submit();
	});
	
	//로그아웃
	$("body").on("click", "#log_Out",function(){
		location.href = "H_LogOut";
	});
}); //ready end

function reLoadMenu(){
	var params = $("#b_Menu_Form").serialize();
	
	//ajax
	$.ajax({
		url: "B_Menus",
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

function drawMenu(menu){
	var html = "";
	//	" +  + "
	console.log(menu.length);
	html += "<div class=\"logo_Area\">";
	html += "	<img class=\"logo\" alt=\"logo\" src=\"resources/images/bb/logo.png\" width=\"250px\">";
	html += "  </div>";
	for(var i =0; i < menu.length; i++){
		if(menu[i].DEPTH == 1 && menu[i].SUB == 1){
				/* if(menu[i].SITE_MENU_NO == "${param.menuno}"){
					html += "<div class=\"menu1_Wrap_on\" menuno=\"" + menu[i].SITE_MENU_NO + "\" addr = \""+menu[i].MADDR + "\">";
				}  ELSE 추가 해야함*/
				
					html += "<div class=\"menu1_Wrap\" menuno=\"" + menu[i].SITE_MENU_NO + "\" addr = \""+menu[i].MADDR + "\">";
					html +="	<div class=\"menu1_Title\">";
					html +=			"<div class=\"menu_Depth1\">" + menu[i].SITE_MENU_NAME + "</div>";
					html +=		"</div>";
				}
		
		else if(menu[i].DEPTH == 1 && menu[i].SUB == 0){
			/* if(menu[i].SITE_MENU_NO == "${param.menuno}"){
					html += "<div class=\"menu1_Wrap_on\" menuno=\"" + menu[i].SITE_MENU_NO + "\" addr = \""+menu[i].MADDR + "\">";
				} ELSE 추가 해야함 */
					html += "<div class=\"menu1_Wrap\" menuno=\"" + menu[i].SITE_MENU_NO + "\" addr = \""+menu[i].MADDR + "\">";
					html +="	<div class=\"menu1_Title\">";
					html +=			"<div class=\"menu_Depth1\">" + menu[i].SITE_MENU_NAME + "</div>";
					html +=		"</div>";
			for(var j = 0; j < menu.length-1 ; j++){
				if(menu[i].SITE_MENU_NO == menu[j].TOP){
				console.log("야호")
						if(menu[j].DEPTH == 2){
							html +="<div class=\"menu2_Wrap\" menuno=\"" + menu[j].SITE_MENU_NO + "\"  addr = \""+menu[i].MADDR + "\">";
							}
							html +=		"<div class=\"menu2_Title\">";
							html +=			"<div class= \"menu_Depth2_Area \">";
									if(menu[i].SITE_MENU_NO == 14){
							html +=			"<div class=\"menu_Depth2\">" + menu[j].SITE_MENU_NAME + "</div>";
							html +=			"<div class=\"menu_Depth2\">" + menu[j+1].SITE_MENU_NAME + "</div>";
							html +=			"<div class=\"menu_Depth2\">" + menu[j+2].SITE_MENU_NAME + "</div>";
							html +=			"<div class=\"menu_Depth2\">" + menu[j+3].SITE_MENU_NAME + "</div>";
									} 
									else if(menu[i].SITE_MENU_NO == 19){
							html +=			"<div class=\"menu_Depth2\">" + menu[j].SITE_MENU_NAME + "</div>";
							html +=			"<div class=\"menu_Depth2\">" + menu[j+1].SITE_MENU_NAME + "</div>";
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
			
		html +="<input type=\"button\" value=\"로그아웃\" class=\"log_Out\"/ id=\"log_Out\">";
	
		$(".top_Menu").html(html);
		console.log(menu[5].SITE_MENU_NO);
		console.log("${param.menuno}");
}
</script>

</head>
<body>
<form action="#" id="b_Menu_Form" method="post">
		<input type="hidden"  id="BrchNo" name="BrchNo" value="${sBRCHNo}">
		<input type="hidden"  id="BrNm" name="BrNm" value="${sBRCHNm}">
</form>
         	<!-- 탑메뉴 -->
 	<div class="top_Menu">
    
    <!-- 
	       		<div class="logo_Area">
		         	<img class="logo" alt="logo" src="resources/images/bb/logo.png" width="250px">
		        </div>
		  <div class="menu1_Wrap">	  
	          <div class="menu1_Title">
		         	<div class="menu_Depth1">재고관리</div>
		      </div>
		       <div class=menu2_Wrap>
						<div class=menu2_Title>
							 <div class=menu_Depth2_Area>
							   <div class="menu_Depth2">재고목록</div>
							   <div class="menu_Depth2">입고목록</div>
							   <div class="menu_Depth2">사용목록</div>
							   <div class="menu_Depth2">폐기목록</div>
							 </div>
						</div>
			  </div>
	      </div>
	      
	      <div class="menu1_Wrap">	  
	          <div class="menu1_Title">
	         		<div class="menu_Depth1">주문관리</div>
		      </div>
		       <div class=menu2_Wrap>
						<div class=menu2_Title>
							 <div class=menu_Depth2_Area>
							   <div class="menu_Depth2">주문요청</div>
							   <div class="menu_Depth2">주문목록</div>
							 </div>
						</div>
			  </div>
	      </div>
	      
	      <div class="menu1_Wrap">	  
	          <div class="menu1_Title">
	         		<div class="menu_Depth1">매출</div>
		      </div>
	      </div>
	      
	      <div class="menu1_Wrap">	  
	          <div class="menu1_Title">
	         		<div class="menu_Depth1">공지사항</div>
		      </div>
	      </div>
	      
	       <div class="menu1_Wrap">	  
	          <div class="menu1_Title">
	        		 <div class="menu_Depth1">마이페이지</div>
		      </div>
	      </div>
	      <input type="button" value="로그아웃" class="log_out"/>
	      -->    	
	 </div>
	 

</html>