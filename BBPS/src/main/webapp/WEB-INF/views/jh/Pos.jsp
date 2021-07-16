<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pos</title>
<style type="text/css">
/*
	css 컬러
	탑 파란색 : #01a1dd
	카테고리 버튼 파란색 : #1bc1fe
	글씨 색깔: white,black
	브라운 : #cc6600,#e67300
*/

body {
	font-size: 0pt;
	margin: 0;
	padding: 0;
	
}
/* 레이아웃 */
.top {
	min-width: 1280px;
	height: 40px;
	background-color: #01a1dd;
	border-bottom: 2px solid white;
	margin-bottom: 80px;
}
.content{
	margin: 30px auto;
	width: 1500px;
	
}
.mid {
	min-width: 1400px;
	height: 450px;
	
}
.btm{
	min-width: 1400px;
	
}
/* 중간 부분 */
.ord_area {
	display: inline-block;
	height: 450px;
}

.table_menu input{
	cursor: pointer;
}
/* 탑부분 */
.now_ord, .date,.brch,.pos_uesr{
	display: inline-block;
	font-size: 22px;
	line-height: 35px;
	color: white;
	float: left;
}
.now_ord{
	width: 40%;
	
}
.date,.brch{
	width: 15%;
}
.pos_off_btn, .finish_btn{
	width: 150px;
	height: 40px;
	float: right;
	cursor: pointer;
	color: white;
    text-align: center;
    border-radius: 3px;
    font-size: 18px;
    background-color: #e67300;
}
/* 왼쪽 부분 */
.left{
	width: 700px;
	display: inline-block;
}
.table_ord {
   list-style-type: none;
   width: 100%;
}
.table_ord li {
   float: left;
   margin-bottom: 10px;
}
.choice_img{
	width: 60px;
	height: 60px;
}
.choice_menu,.choice_num,.choice_price{
	font-size: 15px;
	height: 54px;
	text-align: center;
}
.choice_num{
	width: 130px;
}
.choice_plus, .choice_minus{
	width: 30px;
	font-size: 20.5px;
}
.table_pay {
	display: inline-block;
	text-align: center;
	font-size: 20px;
	height: 208.4px;
}
.pay{
	height: 82px;
    font-size: 20px;
    width: 100%;
    cursor: pointer;
}
.ta2-1, .ta2-2, .ta2-3 {
	height: 66px;
}
/* 오른쪽부분 */
.right{
	width: 700px;
	float: right;
}
/* 카테고리 */
.menu_cate{
	width: 700px;
	height: 160px;
	float: right;
	display: inline-block;
	margin-bottom: 20px;
}

.cate_btn{
	display: inline-block;
	width: 175px;
	height: 100%;
}
.cate_btn > input {
	width: 175px;
	height: 100%;
	font-size: 40px;
	color: white;
	background-color: #1bc1fe;
	border-color: white;
}
.menu_area {
	display: inline-block;
	vertical-align: top;
	width: 700px;
	height: 500px;
	float: right;
	border: outset;
	overflow-y: auto;  
	
}

.menu_cate > div > input[type='button']{
	border-radius: 15px;
}
.menu_img{
    width: 50%;
    height: 120px;
}
.menu_name{
	font-size: 18px;
	border-radius: 10px;
	width: 80%;
}
.menu_page{
	font-size: 20px;
	margin-top: 10px;
}
.menu_btn{
    text-align: center;
    display: inline-block;
    vertical-align: top;
    width: 32.3%;
    height: 160px;
   	border: outset;
}
.menu_btn > input[type=button]{
	background-color: #cc6600;
	border: none;
	color: white;
    line-height: 30px;
    white-space: nowrap;
    overflow:hidden;
    text-overflow:ellipsis; 
}
/* 버튼효과 */
.menu_name:active{
 	background-color: #1bc1fe;
 	box-shadow: 1px 1px 0px 1px #000000;
 }
.pay-5 input:active{
 	background-color: #1bc1fe;
 } 
.table_num input:active{
 	background-color: #1bc1fe;
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
	text-align:left;
	font-size:18px;
}
input[type='button']:focus{outline:none;}

.popup_head > .close_Btn{
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
/* 계산기 */
.table_num{
	display:none;
	position: absolute;
	width: 700px;
	height: 250px;
	
}
.num, .confirm {
	width: 100%;
	height: 100%;
	font-size: 30px;
	cursor: pointer;
}
</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	reloadList();
	cateCall();
	
	
	$(".pos_off_btn").on("click",function(){
		makePopup("POS종료", "POS를 종료하시겠습니까?",function(){
		});
	}); //pos_off end
	
	$("body").on("click",".menu_btn",function(){
		console.log($(this).attr("mno"));
		$("#menuNo").val($(this).attr("mno"));
		reloadOrd();
		
		//$("#menuNo").val($(this).val(".menu_no"));
		//$(".table_num").show();
	
	}); // 계산기
	
	$(".table_num").on("click", ".confirm",function(){
		
		$(".table_num").hide();
	}); // 계산기
	
});//ready end

function reloadList(){
	var params = $("#menu_form").serialize();
	console.log(params);
	$.ajax({
		url: "Poss",
		type: "post", 
		dataType: "json",
		data : params, 
		success : function(res) {
			
			console.log(res);
			drawMenu(res.list);
			
		},
		error: function(request, status, error){ 
			console.log(error);
		}
	});
}

function reloadOrd(){
	var params = $("#ord_form").serialize();
	
	console.log(params);
	$.ajax({
		url: "PosOrd",
		type: "post",
		dataType: "json",
		data: params,
		success: function(res){
			console.log(res.ord);
			inputOrd(res.ord);
			
		},
		error: function(request, status, error){
			console.log(error)
		}
	});
}


function drawMenu(list){
	var menu ="";
	
	// "+ + "
	for(var m of list){
		
		menu+= "<div class=\"menu_btn\" mno=" + m.MNO +">";
		menu+= "	<img src=\"resources/upload/"+m.MIMG +"\" class=\"menu_img\" name=\"menu_img\"><br/>";
		menu+= "	<input type=\"button\" value=\""+ m.MNAME +"\" class=\"menu_name\" name=\"menu_name\">";
		menu+= "</div>";
	}
	
	$(".menu_area").html(menu);
}

//현재 주문 넣기
function inputOrd(ord){
	var order ="";
	// "+ + "
	
	order+= "<ul mNo=\""+ ord.MNO +"\" class=\"table_ord\" cellspacing=\"0\">";                                                         
	order+= 		"<li>";
	order+= 			"<img src=\"resources/upload/"+ord.MIMG+"\" class=\"choice_img\">";
	order+= 		"</li>";
	order+= 		"<li>";
	order+= 			"<input type=\"text\" value=\""+ ord.MNAME + "\" class=\"choice_menu\">";
	order+= 		"</li>";
	order+= 		"<li>";
	order+= 			"<input type=\"text\" value=\""+ ord.MPRICE + "\" class=\"choice_price\">";
	order+= 		"</li>";
	order+= 		"<li>";
	order+= 			"<input type=\"text\" value=1 class=\"choice_num\">";
	order+= 		"</li>";
	order+= 		"<li>";
	order+= 			"<input type=\"button\" value=\"+\" class=\"choice_plus\">";
	order+=		 "<br/>";
	order+= 			"<input type=\"button\" value=\"-\" class=\"choice_minus\">";
	order+= 		"</li>";
	order+= "</ul>";
	
	
	
	$(".table_ord").append(order);
}
//메뉴 카테고리 벨류 넣기
function cateCall(){
	//drink 클릭
	$(".cate_btn").on("click", "input[type='button']",function(){
		if($(this).val() == "DRINK"){
			$("#cateNo").val(0);
		} 
		else if($(this).val() == "PASTRY"){
			$("#cateNo").val(1);
		}
		else if($(this).val() == "GOODS"){
			$("#cateNo").val(2);
		}
		else{
			$("#cateNo").val(3);
		}
		
		$("#menu_form").attr("action","Pos");
		$("#menu_form").submit();
	});
}
function makePopup(title, contents, func) {
	var html ="";
	html+= "<div class=\"bg\"></div>";	
	html+= "<div class=\"popup_area\">";	
	html+= "<div class=\"popup_head\">"+ title +"";	
	html+= 		"<input type=\"button\" value=\"X\" class=\"close_Btn\">";		
	html+= "</div>";	
	html+= "<div class=\"popup_content\">"+ contents +"</div>";	
	html+= 		"<div class=\"popup_btn\">";	
	html+= 			"<input type=\"button\" value=\"확인\"  class=\"confirm_btn\"style=\"background-color: rgb(41, 128, 185)\">";	
	html+= 			"<input type=\"button\"  value=\"취소\" style=\"background-color: rgb(190, 190, 190)\">";	
	html+= 	 	"</div>";	
	html+= "</div>";	
	
	$("body").prepend(html);
	$(".popup_area").hide().show();
	
	$(".popup_btn, .close_Btn").on("click",function(){
		if(func !=null){
			func.call();
		}
		closePopup();
		});
	$(".confirm_btn").on("click",function(){
		location.href = "Pos_LogOut";
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
<form action="Pos" id="ord_form" method="post">
	<input type="hidden" id="menuNo" name="menuNo"/>
</form>
	<div class="top">
		<div class="now_ord">현재주문</div>
		<div class="date">2021년05월09일</div>
		<div class="brch">${sBRCHNm}</div>
		<div class="pos_uesr">사용자: 권재현</div>
		<input type="button" value="종료" class="pos_off_btn"/>
		<input type="button" value="마감" class="finish_btn"/>
	</div>
		<div class=content>
	<form action="#" id="menu_form" method="post">
		<input type="hidden" id="cateNo" name="cateNo" value="${param.cateNo}"/> 
		<input type="hidden" id="menuCnt" name="menuCnt" /> 
			<div class="left">
					<div class="ord_area">
						<ul class="table_ord" cellspacing="0">
						<!--  
								<li>
									<img src="resources/images/bb/espresso.png" class="choice_img" >
								</li>
								<li>
									<input type="text" value="에스프레소" class="choice_menu">
								</li>
								<li>
									<input type="text" value="5000" class="choice_price">
								</li>
								<li>
									<input type="text" value=1 class="choice_num">
								</li>
								<li>		
									<input type="button" value="+" class="choice_plus">
									<br/>
									<input type="button" value="-" class="choice_minus">
								</li>	
						</ul>
						<ul class="table_ord" cellspacing="0">
								<li>
									<img src="resources/images/bb/espresso.png" class="choice_img" >
								</li>
								<li>
									<input type="text" value="에스프레소" class="choice_menu">
								</li>
								<li>
									<input type="text" value="5000" class="choice_price">
								</li>
								<li>
									<input type="text" value=1 class="choice_num">
								</li>
								<li>		
									<input type="button" value="+" class="choice_plus">
									<br/>
									<input type="button" value="-" class="choice_minus">
								</li>	
						</ul>
						<ul class="table_ord" cellspacing="0">
								<li>
									<img src="resources/images/bb/espresso.png" class="choice_img" >
								</li>
								<li>
									<input type="text" value="에스프레소" class="choice_menu">
								</li>
								<li>
									<input type="text" value="5000" class="choice_price">
								</li>
								<li>
									<input type="text" value=1 class="choice_num">
								</li>
								<li>		
									<input type="button" value="+" class="choice_plus">
									<br/>
									<input type="button" value="-" class="choice_minus">
								</li>	
						</ul>
						<ul class="table_ord" cellspacing="0">
								<li>
									<img src="resources/images/bb/espresso.png" class="choice_img" >
								</li>
								<li>
									<input type="text" value="에스프레소" class="choice_menu">
								</li>
								<li>
									<input type="text" value="5000" class="choice_price">
								</li>
								<li>
									<input type="text" value=1 class="choice_num">
								</li>
								<li>		
									<input type="button" value="+" class="choice_plus">
									<br/>
									<input type="button" value="-" class="choice_minus">
								</li>	
						</ul>
						<ul class="table_ord" cellspacing="0">
								<li>
									<img src="resources/images/bb/espresso.png" class="choice_img" >
								</li>
								<li>
									<input type="text" value="에스프레소" class="choice_menu">
								</li>
								<li>
									<input type="text" value="5000" class="choice_price">
								</li>
								<li>
									<input type="text" value=1 class="choice_num">
								</li>
								<li>		
									<input type="button" value="+" class="choice_plus">
									<br/>
									<input type="button" value="-" class="choice_minus">
								</li>	
								-->
						</ul>
					</div>
					<table class="table_pay" border="2" cellspacing="0">
					<colgroup>
						<col width="220px">
						<col width="220px">
					</colgroup>
					<tr class="pay-1">
						<td>받은금액</td>
						<td>총수량</td>
						<td>주문금액</td>
					</tr>
					<tr class="pay-2">
						<td>30000원</td>
						<td rowspan="3">5개</td>
						<td rowspan="3">24000원</td>
					</tr>
					<tr class="pay-3">
						<td>거스름돈</td>
					</tr>
					<tr class="pay-4">
						<td>6000원</td>
					</tr>
					<tr class="pay-5">
						<td>
							<input type="button" value="현금결제" class="pay" />
						</td>
						<td>
							<input type="button" value="카드결제" class="pay" />
						</td>
					</tr>
				</table>
			</div>
			<div class="right">
				<div class="menu_cate">
						<div class="cate_btn">
							<input type="button" value="DRINK"/>
						</div>
						<div class="cate_btn">
							<input type="button" value="PASTRY"/>
						</div>
						<div class="cate_btn">
							<input type="button" value="GOODS"/>
						</div>
						<div class="cate_btn">
							<input type="button" value="BEAN"/>
						</div>
				</div>
				<div class="menu_area"></div>
			 <table class="table_num" border="2" cellspacing="0">
					<colgroup>
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<tbody>
						<tr class="num-1">
							<td><input type="button" value="1" class="num" onclick="num(1)"></td>
							<td><input type="button" value="2" class="num" onclick="num(2)"></td>
							<td><input type="button" value="3" class="num" onclick="num(3)"></td>
							<td><input type="button" value="할인" class="num" onclick="c()"></td>
							<td><input type="button" value="clear" class="num" onclick="c()"></td>
						</tr>
						<tr class="num-2">
							<td><input type="button" value="4" class="num" onclick="num(4)"></td>
							<td><input type="button" value="5" class="num" onclick="num(5)"></td>
							<td><input type="button" value="6" class="num" onclick="num(6)"></td>
							<td><input type="button" value="0" class="num" onclick="num(00)"></td>
							<td><input type="button" value="확인" class="confirm" onclick="num(확인)"></td>
						</tr>
						<tr class="num-3">
							<td><input type="button" value="7" class="num" onclick="num(7)"></td>
							<td><input type="button" value="8" class="num" onclick="num(8)"></td>
							<td><input type="button" value="9" class="num" onclick="num(9)"></td>
							<td colspan="2"><input type="button" value="00" class="num" onclick="num(0)"></td>
						</tr>
					</tbody>
			</table>
			</div>
		</form>
		</div>
</body>
</html>