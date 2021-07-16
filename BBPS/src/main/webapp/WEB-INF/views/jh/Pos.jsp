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
	width: 680px;
	display: inline-block;

}
.ord_area {
	display: inline-block;
	width: 100%;
	height: 450px;
}
.ord_stat {
   width: 100%;
}
.ord_div,.ord_img{
	display: inline-block;
}
.ord_img{
	vertical-align: bottom;
}
#ord_cnt{
	width: 100px;
    height: 62px;
    font-size: 16px;
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

.choice_cnl{
	width: 80px;
    height: 60px;
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
.pay_method input:active{
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
	var cnt = 0;
	
	reloadList();
	ord_pay();
	$(".pos_off_btn").on("click",function(){
		makePopup("POS종료", "POS를 종료하시겠습니까?",function(){
		});
	}); //pos_off end
	
	//현재주문 상황
	$("body").on("click",".menu_btn",function(){
		console.log(cnt);
		if(cnt < 7){
			
			$("#menuNo").val($(this).attr("mno"));
			reloadOrd();
			cnt++;
			
		
			
		}else{
			ordPopup("", "더이상 품목추가는 불가합니다.",function(){
			});
		}
		
		//$("#menuNo").val($(this).val(".menu_no"));
		//$(".table_num").show();
	
	}); // 계산기
	
	$(".ord_area").on("change","select",function(){
		
	});

	//주문 취소
	$(".ord_area").on("click",".choice_cnl",function(){
		$(this).parent().parent().remove();
		cnt--;
	});

	
	$(".table_num").on("click", ".confirm",function(){
		
		$(".table_num").hide();
	}); // 계산기
	
	//카테고리 선택
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
		reloadList();
	});
	
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
	order+= 		"<div class=\"ord_stat\">";
	order+= 			"<div class=\"ord_img\" mNo=\""+ ord.MNO +"\">";
	order+= 				"<img src=\"resources/upload/"+ord.MIMG+"\" class=\"choice_img\">";
	order+= 			"</div>";
	order+= 			"<div class=\"ord_div\">";
	order+= 				"<input type=\"text\" value=\""+ ord.MNAME + "\" class=\"choice_menu\">";
	order+= 			"</div>";
	order+= 			"<div class=\"ord_div\">";
	order+= 				"<input type=\"text\" value=\""+ ord.MPRICE + "\" class=\"choice_price\">";
	order+= 			"</div >";
	order+= 			"<div class=\"ord_div\">";
	order+= 				"<select id=\"ord_cnt\" name=\"ord_cnt\">";
	order+= 					"<option value=\"1\" selected=\"selected\">1</option>";
	order+= 					"<option value=\"2\">2</option>";
	order+= 					"<option value=\"3\">3</option>";
	order+= 					"<option value=\"4\">4</option>";
	order+= 					"<option value=\"5\">5</option>";
	order+= 					"<option value=\"6\">6</option>";
	order+= 					"<option value=\"7\">7</option>";
	order+= 					"<option value=\"8\">8</option>";
	order+= 					"<option value=\"9\">9</option>";
	order+= 					"<option value=\"10\">10</option>";
	order+= 				"</select>";
	order+= 			"</div>";
	order+= 			"<div class=\"ord_div\">";
	order+= 				"<input type=\"button\" value=\"취소\" class=\"choice_cnl\">";
	order+= 			"</div >";
	order+= 		"</div>";
	
	$(".ord_area").append(order);
	ordCnt();
}

function ordCnt(){
	var cnt = 0 ;
	$("#ord_area .ord_stat").each(function(){
		//	$(this).금액 벨류랑 셀렉 밸류
	});
	
}

//결제
function ord_pay(){
	var pay ="";

	//"+ +"
	pay+= "<tr class=\"pay_info\">";
	pay+= "	 <td>30000원</td>";
	pay+= "	 <td rowspan=\"3\">"+  +"개</td>";
	pay+= "	 <td rowspan=\"3\">24000원</td>";
	pay+= "</tr>";
	pay+= "<tr class=\"pay_change\">";
	pay+= "	 <td>거스름돈</td>";
	pay+= "</tr>";
	pay+= "<tr class=\"change_price\">";
	pay+= "	 <td>6000원</td>";
	pay+= "</tr>";
	pay+= "<tr class=\"pay_method\">";
	pay+= "	<td>";
	pay+= "		<input type=\"button\" value=\"현금결제\" class=\"pay\" />";
	pay+= "	</td>";
	pay+= "	<td>";
	pay+= "		<input type=\"button\" value=\"카드결제\" class=\"pay\" />";
	pay+= "	</td>";
	pay+= "	<td>";
	pay+= "		<input type=\"button\" value=\"환불\" class=\"pay\" />";
	pay+= "	</td>";
	pay+= "</tr>";
	
	$(".table_pay tbody").html(pay);
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

function ordPopup(title, contents, func) {
	var html ="";
	html+= "<div class=\"bg\"></div>";	
	html+= "<div class=\"popup_area\">";	
	html+= "<div class=\"popup_head\">"+ title +"";	
	html+= 		"<input type=\"button\" value=\"X\" class=\"close_Btn\">";		
	html+= "</div>";	
	html+= "<div class=\"popup_content\">"+ contents +"</div>";	
	html+= 		"<div class=\"popup_btn\">";	
	html+= 			"<input type=\"button\" value=\"확인\"  class=\"confirm_btn\"style=\"background-color: rgb(41, 128, 185)\">";	
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
					<div class="ord_area"></div>
					<table class="table_pay" border="2" cellspacing="0">
					<colgroup>
						<col width="220px">
						<col width="220px">
						<col width="220px">
					</colgroup>
					<tbody>
					<!-- 
						<tr class="pay_price">
							<td>받은금액</td>
							<td>총수량</td>
							<td>주문금액</td>
						</tr>
						<tr class="pay_info">
							<td>30000원</td>
							<td rowspan="3">5개</td>
							<td rowspan="3">24000원</td>
						</tr>
						<tr class="pay_change">
							<td>거스름돈</td>
						</tr>
						<tr class="change_price">
							<td>6000원</td>
						</tr>
						<tr class="pay_method">
							<td>
								<input type="button" value="현금결제" class="pay" />
							</td>
							<td>
								<input type="button" value="카드결제" class="pay" />
							</td>
							<td>
								<input type="button" value="환불" class="pay" />
							</td>
						</tr>
								 -->
					</tbody>
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
				<div class="menu_area">
					
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
		</form>
		</div>
</body>
</html>