<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pos</title>
<style type="text/css">
body {
	font-size: 0pt;
	margin: 0;
	padding: 0;
	
}
/* 레이아웃 */
.top {
	min-width: 1980px;
	height: 40px;
	background-color: #01a1dd;
	border-bottom: 2px solid white;
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
.menu_area {
	display: inline-block;
	vertical-align: top;
	height: 500px;
	float: right;
	overflow-y: auto;  
	
}
.table_menu  input{
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
	width: 47%;
	
}
.date,.brch{
	width: 15%;
}
.pos_Off_Btn, .finish_Btn{
	color: white;
	width: 150px;
	height: 40px;
	float: right;
	cursor: pointer;
	color: black;
	font-size: 18px;
}
/* 왼쪽 부분 */
.left{
	width: 700px;
	display: inline-block;
}
.table_ord {
   list-style-type: none;
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
.menu_Cate{
	width: 700px;
	float: right;
	margin-bottom: 20px;
}
.menu_Cate{
	display: inline-block;
	height: 250px;
}
.cate_Drink,.cate_Pastry,.cate_Goods,.cate_Bean{
	width: 175px;
	display: inline-block;
	height: 100%;
}
.menu_Cate > div > input {
	width: 175px;
	height: 100%;
	font-size: 40px;
	color: white;
	background-color: #1bc1fe;
	border-color: white;
}
.table_menu{
	border-collapse:collapse;
    width: 650px;
    height: 100%;
    text-align: center;
    margin: 0 30px;
  
}
.menu_img{
	width: 55%;
	height: 80px;
}
.menu_name{
	font-size: 20px;
	border-radius: 10px;
	width: 100%;
}
.menu_page{
	font-size: 20px;
	margin-top: 10px;
}
.menu_Btn{
    text-align: right;
}
.menu_Btn > input[type=button]{
	background-color: #cc6600;
	border: none;
	color: white;
    line-height: 30px;
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
	text-align:left;
	font-size:18px;
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
	
	$(".pos_Off_Btn").on("click",function(){
		makePopup("POS종료", "POS를 종료하시겠습니까?",function(){
		});
	}); //pos_off end
	
	$(".table_menu").on("click", "tr",function(){
		$(".table_num").show();
	}); // 계산기
	
	$(".table_num").on("click", ".confirm",function(){
		$(".table_num").hide();
	}); // 계산기
	
});//ready end
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
	html+= 			"<button style=\"background-color: rgb(190, 190, 190)\">취소</button>";	
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
	$(".confirm_Btn").on("click",function(){
		location.href = "Pos_LogOut";
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
	<div class="top">
		<div class="now_ord">현재주문</div>
		<div class="date">2021년05월09일</div>
		<div class="brch">성수 1호점</div>
		<div class="pos_uesr">사용자: 권재현</div>
		<input type="button" value="종료" class="pos_Off_Btn"/>
		<input type="button" value="마감" class="finish_Btn"/>
	</div>
		<div class=content>
			<div class="left">
					<div class="ord_area">
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
					</div>
					<table class="table_pay" border="2" cellspacing="0">
					<colgroup>
						<col width="220px">
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
						<td><input type="button" value="현금결제"
							class="pay" /></td>
						<td><input type="button" value="카드결제"
							class="pay" /></td>
						<td><input type="button" value="복합결제"
							class="pay" /></td>
					</tr>
				</table>
			</div>
			<div class="right">
				<div class="menu_Cate">
						<div class="cate_Drink">
							<input type="button" value="DRINK"/>
						</div>
						<div class="cate_Pastry">
							<input type="button" value="PASTRY"/>
						</div>
						<div class="cate_Goods">
							<input type="button" value="GOODS"/>
						</div>
						<div class="cate_Bean">
							<input type="button" value="BEAN"/>
						</div>
				</div>
				<div class="menu_area">
						<table class="table_menu" border="3" cellspacing="1">
							<tr>
								<td>
									<img src="resources/images/bb/espresso.png" class="menu_img"><br/>
									<div class="menu_Btn">
										<input type="button" value="에스프레소" class="menu_name">
									</div>
								</td>
								<td>
									<img src="resources/images/bb/americano.png" class="menu_img"><br/>
									<div class="menu_Btn">
										<input type="button" value="아메리카노 " class="menu_name">
									</div>
								</td>
								<td>
									<img src="resources/images/bb/dripCoffee.png" class="menu_img"><br/>
									<div class="menu_Btn">
										<input type="button" value="드립커피" class="menu_name">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<img src="resources/images/bb/latte.png" class="menu_img"><br/>
									<div class="menu_Btn">
										<input type="button" value="라떼" class="menu_name">
									</div>
								</td>
								<td>
									<img src="resources/images/bb/cappuccino.png" class="menu_img"><br/>
									<div class="menu_Btn">	
										<input type="button" value="카푸치노 " class="menu_name">
									</div>
								</td>
								<td>
									<img src="resources/images/bb/lemon.png" class="menu_img"><br/>
									<div class="menu_Btn">
										<input type="button" value="레몬유자피즈" class="menu_name">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<img src="resources/images/bb/choco.png" class="menu_img"><br/>
									<div class="menu_Btn">
										<input type="button" value="핫초코" class="menu_name">	
									</div>
								</td>
								<td>
									<img src="resources/images/bb/cake.png" class="menu_img"><br/>
									<div class="menu_Btn">
										<input type="button" value="케이크" class="menu_name">
									</div>
								</td>
								<td>
									<img src="resources/images/bb/sandwich.png" class="menu_img"><br/>
									<div class="menu_Btn">
										<input type="button" value="샌드위치" class="menu_name" >
									</div>
								</td>
							</tr>
							<tr>
							<td>
								<img src="resources/images/bb/choco.png" class="menu_img"><br/>
								<div class="menu_Btn">
									<input type="button" value="핫초코" class="menu_name">	
								</div>
							</td>
							<td>
								<img src="resources/images/bb/cake.png" class="menu_img"><br/>
								<div class="menu_Btn">
									<input type="button" value="케이크" class="menu_name">
								</div>
							</td>
							<td>
								<img src="resources/images/bb/sandwich.png" class="menu_img"><br/>
								<div class="menu_Btn">
									<input type="button" value="샌드위치" class="menu_name" >
								</div>
							</td>
						</tr>
						</table>
			 </div>
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
	</div>
</body>
</html>