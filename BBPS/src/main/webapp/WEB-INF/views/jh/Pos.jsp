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
.ord_cnt{
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
.cash_pay,.card_pay,.ref{
	height: 82px;
    font-size: 20px;
    width: 100%;
    cursor: pointer;
}
.ta2-1, .ta2-2, .ta2-3 {
	height: 66px;
}
.recNum{
	border: none;
	font-size: 20px;
    text-align: center;
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
	float: right;

}

.menu_cate > div > input[type='button']{
	border-radius: 15px;
}
.menu_img{
    width: 50%;
    
    height: 120px;
}
.menu_name, .menu_name_off{
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
.menu_btn > .menu_name{
	background-color: #cc6600;
	border: none;
	color: white;
    line-height: 30px;
    white-space: nowrap;
    overflow:hidden;
    text-overflow:ellipsis; 
}

.menu_btn > .menu_name_off{
	background-color: #f2f2f2;
	border: none;
	color: black;
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
	margin-bottom: 80px;
	margin-top: 20px;
	margin-left: 20px;
	text-align: center;
	font-size: 18px;
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
<script type="text/javascript"
	src="resources/script/jquery/jquery.slimscroll.js"></script>
<script type="text/javascript">
var ordCnt = "" ; //주문 개수 
var ordMoney= "" ; // 주문 금액
var ordPrice =  0; // 금액 * 갯수
var ordResCnt = 0 ; //총 주문 갯수
var ordResPay = 0 ; // 총 주문금액
var payMoney = 0; // 받은 금액
var changeMoney = 0; // 거스름돈
var today = new Date(); 
var year =  today.getFullYear(); //월
var month =  today.getMonth() + 1; //월
var date =  today.getDate() ; //날짜
var ordNum = 1;
var cnlNm = ""; //취소 시 주문 번호
var recMoney = 0; // 받은 금액 
$(document).ready(function(){

	reloadList();
	ordPay();
	
	//주문 번호 생성
	makeOrdNo(ordNum);

	
	//오늘 날짜
	$(".date").html(year+"년"+month+"월"+date+"일");
	
	$(".pos_off_btn").on("click",function(){
		makePopup("POS종료", "POS를 종료하시겠습니까?",function(){
		});
	}); //pos_off end
	
	//현재주문 상황에 넣기
		var nowCnt = 0; //품목주문개수
	$("body").on("click",".menu_name",function(){
		
		if(nowCnt < 7){
			$("#mNo").val($(this).attr("mno"));
			$(this).attr("class","menu_name_off");
			
			reloadOrd();
			nowCnt++;
			
			console.log("품목주문개수"+nowCnt);
		}else{
			ordPopup("", "더이상 품목추가는 불가합니다.",function(){});
		}
		
	});
	
	//셀렉트에서 주문 갯
		$("body .ord_area").on("focus",".ord_cnt",function(){
		//전 갯수 적용
			if(ordResCnt > 0){
				var preCnt = ($(this).val() * 1); // 변경 전 갯수
				ordResCnt -= preCnt; // 총 갯수에서 제외
				
				ordPrice = ordMoney * preCnt; // 갯수 * 금액
				
				//결제금액 넣어주기
				ordResPay -= ordPrice;
				
				ordPay();
			
				}
		
			}).on("change",".ord_cnt",function(){
				//바뀐 갯수 적용
				var nowCnt = ($(this).val() * 1); // 변경 후 갯수
					ordResCnt += nowCnt; // 총 갯수에서 제외
				
					 ordPrice = ordMoney * nowCnt; // 갯수 * 금액
				
				 //결제금액 넣어주기
				ordResPay += ordPrice;
				ordPay();
				
				$(".ord_cnt").blur(); //focus 제거
		});
		
		//메뉴 스크롤바
		$(".menu_area").slimScroll({
			height: '500px'
		});

	
	//주문 취소
	$(".ord_area").on("click",".choice_cnl",function(){
		var mCnt = 0;
		var mPrice = 0;
		console.log("취소시 총갯수"+ordResCnt);
		console.log("취소시 총금액"+ordResPay);
		//취소 갯수
			 mCnt=$(this).parent().parent().children().eq(3).children().val();
			console.log("mCnt "+mCnt);
		//취소 가격
			 mPrice = $(this).parent().parent().children().eq(2).children().val();
			console.log("mPrice"+mPrice);
		
		//취소 시 갯수 제거
			if(nowCnt != 0){
			ordResCnt -= mCnt;
		
		//취소 시 금액 마이너스
			ordResPay -= mCnt * mPrice 
				
		//주문 제거
			$(this).parent().parent().remove();
		
		//금액 변경 상황 그려주기
			ordPay();
		
		//취소 주문 메뉴
			cnlM =$(this).parent().parent().attr("mno");
		
		//현재 주문개수 빼기
			
				nowCnt--;
			} else{
				// 총주문개수, 결제금액 초기화
				ordResPay = 0;
				ordResCnt = 0;
			}
		
		//주문 입니다 다시 돌려 놓기
		$(".menu_area input[type='button'][mno='" + cnlM + "']").attr("class","menu_name");
		
	});
	
	
		//현금, 카드 결제
		$("body").on("click",".cash_pay, .card_pay",function(){
			$(".table_num").show();
			$(".menu_cate").css("margin-bottom", "100px");
			
			$(".table_num").on("click", "input[type='button']",function(){
				//받은 금액 넣기
				
				if(recMoney == ""){
					recMoney = $(this).val();
					ordPay();
				} else if($(this).val() == "clear"){
					recMoney = "0";	 //클리어
					ordPay();
				} else if($(this).val() == "할인"){
					recMoney = recMoney * 0.5;	//50^할인
					ordPay();
				}
				else{
					recMoney += $(this).val();
					ordPay();
					} 
				
					console.log("숫자"+recMoney);
				});
		});
	
	// 숫자에서 처리 하고 확인
	$(".table_num").on("click", ".confirm",function(){
		
		$(".table_num").hide();
		$(".menu_cate").css("margin-bottom", "20px");
		
		var noCnt = 0; //품목명 빈 값이 있는지 체크할 변수 (빈 값이 존재하는 경우 작업불가 alert)
		
		//거스름 돈
		changeMoney = ordResPay - (recMoney * 1); 
		
		if($(this).val() == "현금결제"){
			//현금 0번
			$("#methodNo").attr("value", 1);
			console.log($("#methodNo").val());
		} else{
			//카드 1번
			$("#methodNo").attr("value", 0);
			console.log($("#methodNo").val());
		}
		
		//주문 품목 전달
	
		if($(".recNum").val() == ""){
			
			ordPopup("", "받은금액을 먼저 입력해주세요.",function(){});
			$(".rec_money").focus;
		} 
		else{
			//주문 금액 넣기
			inputOrdMoney();
				
			//주문 메뉴 넣기
			inputOrdMenu();
		// 총주문개수, 결제금액 초기화
			ordResPay = 0;
			ordResCnt = 0;
		
			ordPopup("", "결제완료되었습니다.",function(){
		
				
			});
			
		}
		
	}); 
	
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
	
	//
	
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
	var params = $("#menu_form").serialize();
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
		
		menu+= "<div class=\"menu_btn\" >";
		menu+= "	<img src=\"resources/upload/"+m.MIMG +"\" class=\"menu_img\" name=\"menu_img\"><br/>";
		menu+= "	<input type=\"button\" mno=" + m.MNO +" value=\""+ m.MNAME +"\" class=\"menu_name\" name=\"menu_name\">";
		menu+= "</div>";
	}
	
	$(".menu_area").html(menu);
}

//주문 번호 만들기
function makeOrdNo(){
	
	$.ajax({
		url: "makeOrdNo",
		type: "post", 
		dataType: "json",
		success : function(res) {
				ordNo(res.ordNum);
		},
		error: function(request, status, error){ 
			console.log(error);
		}
	});
}

function ordNo(ordNum){
	var num = "";
		num+="<input type=\"hidden\" id=\"ordNo\" name=\"ordNo\" value=\""+ ordNum.SNO +"\"/>";
	
		
		$("#menu_form").append(num);
}

//현재 주문 넣기
function inputOrd(ord){
	var order ="";
	
	// "+ + "
	order+= 		"<div class=\"ord_stat\" mNo=\""+ ord.MNO +"\">";
	order+= 			"<div class=\"ord_img\" mNo=\""+ ord.MNO +"\" >";
	order+= 				"<img src=\"resources/upload/"+ord.MIMG+"\" class=\"choice_img\">";
	order+=" <input type=\"hidden\" id=\"menuNo\" name=\"menuNo\" value=\""+ ord.MNO + "\"/>";
	order+= 			"</div>";
	order+= 			"<div class=\"ord_div\">";
	order+= 				"<input type=\"text\" value=\""+ ord.MNAME + "\" class=\"choice_menu\" >";
	order+= 			"</div>";
	order+= 			"<div class=\"ord_div\">";
	order+= 				"<input type=\"text\" value=\""+ ord.MPRICE + "\" class=\"choice_price\">";
	order+= 			"</div >";
	order+= 			"<div class=\"ord_div\">";
	order+= 				"<select class=\"ord_cnt\" name=\"oMCnt\" value=\"\">";
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
	ordRes();
	ordPay();
}

function ordRes(){

	//금액
	$(".ord_area .choice_price").each(function(){		
		ordMoney = ($(this).val() * 1); //int 변환
	});
	//갯수
	$(".ord_area select").each(function(){
		ordCnt = ($(this).val() * 1); //int 변환
	});
	// 총 금액에 넣는 과정 
		if( ordResCnt >= 0){
		// 금액 * 갯수
		ordPrice = ordMoney * ordCnt;
		//결제금액 넣어주기
		ordResPay += ordPrice;
		ordResCnt += ordCnt;
	console.log("개수, 금액, 총금액");
	console.log(ordCnt,ordMoney,ordPrice);
		} 
		else{
			ordResPay = 0;
			ordResCnt = 0;
		}
	
}

//결제
function ordPay(){
	var pay ="";
	
	//"+ +"
	pay+= "<tr class=\"pay_info\">";
	pay+= "	 <td class=\"rec_money\">"+ recMoney +"원</td>";
	pay+= "	 <td rowspan=\"3\">"+ ordResCnt +"개</td>";
	pay+= "	 <td rowspan=\"3\">"+ ordResPay +"원</td>";
	pay+= "</tr>";
	pay+= "<tr class=\"pay_change\">";
	pay+= "	 <td>거스름돈</td>";
	pay+= "</tr>";
	pay+= "<tr class=\"change_price\">";
	pay+= "	 <td>"+ changeMoney  +"</td>";
	pay+= "</tr>";
	pay+= "<tr class=\"pay_method\">";
	pay+= "	<td>";
	pay+= "		<input type=\"button\" value=\"현금결제\" class=\"cash_pay\" />";
	pay+= "	</td>";
	pay+= "	<td>";
	pay+= "		<input type=\"button\" value=\"카드결제\" class=\"card_pay\" />";
	pay+= "	</td>";
	pay+= "	<td>";
	pay+= "		<input type=\"button\" value=\"환불\" class=\"ref\" />";
	pay+= "	</td>";
	pay+= "</tr>";
	
	$(".table_pay tbody").html(pay);
	
}

function inputOrdMoney(){
	
	var params = $("#menu_form").serialize();
	  console.log("주문 금액"+params);
	  
	  $.ajax({
		  
		  	  url : "input_Moneys",//접속주소
		      type : "post", //전송방식 : get,post // >>문자열을 줬지만 알아서 포스트 형식으로 
		      dataType :"json", //받아올 데이터 형식
		      data : params,///보낼데이터(문자열 형태)
		      success : function(res){
		         if(res.msg == "success"){
		        	 $("#menu_form").attr("action","Pos");
					$("#menu_form").submit();
		         }else if (res.msg == "failed"){
		            alert("등록에 실패하였습니다."); // 팝업 변경 필요
		         }else {
		            alert("등록 중 문제가 발생하였습니다."); // 팝업 변경 필요
		         }
		      },
		      error : function(request,status,error){
		         console.log(error);
		      }
		   });
}
//주문 넣는 함수

function inputOrdMenu(){
	
	  var params = $("#menu_form").serialize();
	   console.log("주문 메뉴"+params);
	   $.ajax({
		   
	      url : "input_Menus",//접속주소
	      type : "post", //전송방식 : get,post // >>문자열을 줬지만 알아서 포스트 형식으로 
	      dataType :"json", //받아올 데이터 형식
	      data : params,///보낼데이터(문자열 형태)
	      success : function(res){
	         if(res.msg == "success"){
	        	 $("#menu_form").attr("action","Pos");
				$("#menu_form").submit();
	         }else if (res.msg == "failed"){
	            alert("등록에 실패하였습니다."); // 팝업 변경 필요
	         }else {
	            alert("등록 중 문제가 발생하였습니다."); // 팝업 변경 필요
	         }
	      },
	      error : function(request,status,error){
	         console.log(error);
	      }
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
	<div class="top">
		<div class="now_ord">현재주문</div>
		<div class="date"></div>
		<div class="brch">${sBRCHNm}</div>
		<div class="pos_uesr">사용자: ${sMGRNm}</div>
		<input type="button" value="종료" class="pos_off_btn"/>
		<input type="button" value="마감" class="finish_btn"/>
	</div>
		<div class=content>
<!-- 메뉴  폼 -->
	<form action="#" id="menu_form" method="post">
	<input type="hidden" id="oMNo" name="oMNo"/>
	<input type="hidden" id="mNo" name="mNo"/>
	<input type="hidden" id="methodNo" name="methodNo"/>
	<input type="hidden" id="brchNo" name="brchNo" value="${sBRCHNo}"/>
	<input type="hidden" id="cateNo" name="cateNo" value="${param.cateNo}"/> 
			<div class="left">
					<div class="ord_area"></div>
					<table class="table_pay" border="2" cellspacing="0">
					<colgroup>
						<col width="220px">
						<col width="220px">
						<col width="220px">
					</colgroup>
					<thead>
						<tr>
							<th>받은금액</th>
							<th>총주문개수</th>
							<th>결제금액</th>
						</tr>
					</thead>
					<tbody></tbody>
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
				< 
				<table class="table_num" border="2" cellspacing="0">
					<colgroup>
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<tbody>
						<tr class="num_1">
							<td><input type="button" value="1" class="num" ></td>
							<td><input type="button" value="2" class="num" ></td>
							<td><input type="button" value="3" class="num" ></td>
							<td><input type="button" value="할인" class="num"></td>
							<td><input type="button" value="clear" class="num"></td>
						</tr>
						<tr class="num_2">
							<td><input type="button" value="4" class="num" ></td>
							<td><input type="button" value="5" class="num" ></td>
							<td><input type="button" value="6" class="num" ></td>
							<td><input type="button" value="0" class="num" ></td>
							<td><input type="button" value="확인" class="confirm"></td>
						</tr>
						<tr class="num_3">
							<td><input type="button" value="7" class="num" ></td>
							<td><input type="button" value="8" class="num" ></td>
							<td><input type="button" value="9" class="num" ></td>
							<td colspan="2"><input type="button" value="00" class="num"></td>
						</tr>
					</tbody>
			</table>
			
				<div class="menu_area"></div>
			</div>
		</form>
		</div>
</body>
</html>