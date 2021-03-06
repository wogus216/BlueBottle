<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../jh/H_Menu.jsp">
	<c:param name="menuno" value="2"></c:param>
</c:import> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 상단 바 */
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
/* 품목등록 */

h1 {
 margin-bottom: 40px;
 font-size: 30px;
}

.btn_area{
	text-align: right;
	margin-bottom: 20px;
}

.row_add, .row_del{
	background-color: #01a1dd;
	float: right;
	margin:10px 5px 10px 5px;
}
.row_del{
	background-color: #bf4040;
	float: right;
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
	font-size:15px;
	padding:10px;
	border-top: 1px solid #eaeaea;
	border-left: 1px solid #eaeaea;
}

 td:first-child{
	border-left: none;
}
input{
	width:200px;
	height:40px;

}
.start_date{ /* 수정필요 메타명 */
	width: 200px;
	font-size: 15px;
	height: 40px;
}
/* 이게일반 */
.row_del,.row_add{
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


/*최하단 목록,취소 버튼*/
.submit_area{
	text-align: center;
}

.submit{
	width: 180px;
	height: 50px;
	background-color: #01a1dd;
	font-weight: bold;
	font-size: 22px;
	cursor: pointer;
	color: white;	
	text-align:center;
	border:0;
	border-radius: 3px;
	margin:0px;
	outline:none;
	margin:20px;
}

.cnl_btn{
	width: 180px;
	height: 50px;
	background-color: #b3b3b3;
	font-weight: bold;
	font-size: 22px;
	cursor: pointer;
	color: white;	
	text-align:center;
	border:0;
	border-radius: 3px;
	margin:0px;
	outline:none;
	margin:20px;
}


/* 팝업 */

.popup_Content table{
	width: 100%;
    background: #ffffff;
	margin: 10px 0;
	border-top: 2px solid #01a1dd;
	border-bottom: 2px solid #d9d9d9;
}

.popup_Content th{
	background: #e8e8e8;
    padding: 0px;
    border-bottom: 1px solid #ffffff;
    border-left: 1px solid #ffffff;
    font-size:15px;
}


.popup_Content td{
	font-size:15px;
	padding:0px;
	border-top: 1px solid #eaeaea;
	border-left: 1px solid #eaeaea;
}



.popup_Content thead{
	display : table;
	table-layout : fixed;
	width : 100%;
}

.popup_Content tbody{
	display : block;
	max-height : 120px;
	width : 100%px;
	overflow : auto;
	overflow-x : hidden;
}

.popup_Content tr{
	display : table;
	table-layout : fixed;
	width : 100%;
}

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
	width: 500px;
	height: 300px;
	background-color: #ffffff;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	position: absolute;
	top: calc(50% - 150px); /*높이의 반만큼 뺌*/
	left: calc(50% - 250px); /*너비의 반만큼 뺌*/
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
.popup_Btn input[type='button']{
	color: white;
	width: 120px;
	height: 30px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:15px;
	margin:10px;
	cursor: pointer;
}
.popup_Content{
	width : 460px;
	height : 145px;
	margin-bottom:30px;
	margin-top:20px;
	margin-left:20px;
	margin-right:20px;
	text-align:center;
	font-size:18px;
	color: black
}
input[type='button']:focus{outline:none;}

.popup_Head > .close_Btn{
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
<script type="text/javascript">
var cnt_tr = 1; //행 개수 카운트
var today = new Date(); //오늘날짜 체크

var dd = today.getDate(); // 현재 기준 하루 전까지 min으로 잡을 예정이므로
var mm = today.getMonth()+1;
var yyyy = today.getFullYear();
	if(dd < 10){
		dd = "0" + dd;
	}
	if(mm < 10){
		mm = "0" + mm;
	} //1월인 경우 01로 표기

	today = yyyy+"-"+mm+"-"+dd;
	
$(document).ready(function(){
	
	//document.getElementById("stockExpiryDate").valueAsDate = new Date();
	document.getElementById("stockExpiryDate").setAttribute("min",today);
	
	
	$(".row_add").on("click",function(){
		add_tb();
	});
	
	$(".row_del").on("click",function(){
		del_tb();
	});
	
	
	$(".cnl_btn").on("click",function(){
		$("#goForm").submit();
	});
	
	$(".submit").on("click",function(){
		
		var cnt = 0; //추가수량 빈 값이 있는지 확인
		
		$(".stockCnt").each(function(){
			if($(this).val() == ""){
				cnt++;
			}
		});
		
		if(cnt > 0){
			makePopup("재고추가","추가수량을 입력해주세요.",function(){});
		   $(".stockCnt").focus;
		}else{
			
		   var params = $("#tb_Form").serialize();
		   console.log($("#tb_Form").serialize());
		   
		   
		    $.ajax({
		      url : "Stock_Adds",//접속주소
		      type : "post", //전송방식 : get,post // >>문자열을 줬지만 알아서 포스트 형식으로 
		      dataType :"json", //받아올 데이터 형식
		      data : params,///보낼데이터(문자열 형태)
		      success : function(res){
		         if(res.msg == "success"){
		            $("#tb_Form").attr("action","Stock_Dtl");
		            $("#tb_Form").submit();
		            $("#goForm").attr("action","Stock_Dtl");
					$("#goForm").submit();
		         }else if (res.msg == "failed"){
		        	 makePopup("재고추가","재고 추가에 실패하였습니다.",function(){});
		         }else {
		        	 makePopup("재고추가","재고 추가 중 문제가 발생하였습니다.",function(){});
		         }
		      },
		      error : function(request,status,error){
		         console.log(error);
		      }
		   }); 
		}
	});
	
	$(".stockExpiryDate").val(today);
	
	 $(document).on("click",".nullcheckbox",function(){
		if ($(this).is(":checked") == true){
		
		$(this).parent().parent().children().eq(3).children().attr("readonly",true);
		$(this).parent().parent().children().eq(3).children().prop("value",'2999-01-01');
		
	}else if($(this).is(":checked") == false){
		
		$(this).parent().parent().children().eq(3).children().attr("readonly",false);
		$(this).parent().parent().children().eq(3).children().prop("value",today);
		}
	});
}); //ready end

function add_tb(){
	
	var today1 = new Date(); //오늘날짜 체크

	var dd1 = today1.getDate(); // 현재 기준 하루 전까지 min으로 잡을 예정이므로
	var mm1 = today1.getMonth()+1;
	var yyyy1 = today1.getFullYear();
		if(dd1 < 10){
			dd1 = "0" + dd1;
		}
		if(mm1 < 10){
			mm1 = "0" + mm1;
		} //1월인 경우 01로 표기

		today1 = yyyy1+"-"+mm1+"-"+dd1;
	
	if(cnt_tr < 15){
	
	cnt_tr ++;
	
	var insertTr = "";
	
	insertTr += "<tr>";
	insertTr += "<td>"+${param.itemNo}+"<input type = \"hidden\" name = \"itemNo\" value = \""+${param.itemNo}+"\"/></td>";
	insertTr += "<td>${param.itemName}</td>";
	insertTr += "<td><input type=\"number\" class = \"stockCnt\" name = \"stockCnt\" min = 1 maxlength=\"10\"></td>";
	insertTr += "<td><input type=\"date\" class = \"stockExpiryDate\" id = \"stockExpiryDate\" name = \"stockExpiryDate\" min = \""+today1+"\" value = \""+today1+"\" max = \"2999-01-01\"/></td>";
	insertTr += "<td><input type =\"checkbox\" class = \"nullcheckbox\"/></td>";
	insertTr += "</tr>";
	
	
	$("tbody").append(insertTr);
	
	}else{
		makePopup("재고추가","최대 행입니다.",function(){});
	}
}

function del_tb(){
	
	if(cnt_tr > 1){
		cnt_tr --;
		$("tbody tr:last").remove();
	}else{
		cnt_tr = 1;
		makePopup("재고추가","첫 번째 행입니다.",function(){});
	}
}


//팝업
function makePopup(title, contents, func) {
	var html ="";
	html+= "<div class=\"bg\"></div>";	
	html+= "<div class=\"popup_Area\">";	
	html+= "<div class=\"popup_Head\">"+ title +"";	
	html+= 		"<input type=\"button\" value=\"X\" class=\"close_Btn\">";
	html+= "</div>";	
	html+= "<div class=\"popup_Content\">"+ contents +"</div>";	
	html+= 		"<div class=\"popup_Btn\">";	
	html+= 			"<input type=\"button\" value=\"확인\"  class=\"confirm_Btn\"style=\"background-color: rgb(41, 128, 185)\">";	
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

</script>
</head>
<body>
<!-- 상단 -->
   <div class="top"></div>

<!--컨텐츠 -->
<div class="content_area">
<div class="content">
<form action = "Stock_Dtl" id = "goForm" method = "post">
<input type="hidden"  id="menuNo" name="menuNo" value="${param.menuNo}">
<input type = "hidden" id = "uNo" name = "uNo" value = "${sUSERNo}"/>
<input type = "hidden" name ="itemNo" value = "${param.itemNo}"/>
<input type = "hidden" name = "page" value = "${param.page}"/> <!-- 파람 붙여줘야 전 페이지에서 온 걸 받는 것 // 페이지는 목록에서 준 것 컨트롤러에서 주는 것이 아님 그래서 파람 있어야함 -->
<input type = "hidden" name ="itemName" value = "${param.itemName}"/>
<input type = "hidden" name = "search_filter" value = "${param.search_filter}"/>
<input type = "hidden" name = "search_input" value = "${param.search_input}"/>
</form>
<h1>재고등록</h1>
<div class="btn_area" style = "height:40px;">
<input type = "button" class="row_del" style= "margin:0px 0px 0px 10px;" value = "행삭제"/>
<input type = "button" class="row_add" style= "margin:0px 10px 0px 0px;" value = "행추가"/>
</div>
<form action = "#" id = "tb_Form" method = "post">
<input type = "hidden" id = "uNo" name = "uNo" value = "${sUSERNo}"/>
<table cellspacing="0">
	<colgroup>
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
	</colgroup>
	<thead>
	<tr >
		<th scope=col style= "border-left: none;">품목코드</th>
		<th scope=col>품목명</th>
		<th scope=col>추가수량</th>
		<th scope=col>유통기한</th>
		<th scope=col>유통기한 없는 경우</th>
	</tr>
	</thead>
	<tbody>
	<tr>
	<td>${param.itemNo}<input type = "hidden" name = "itemNo" value = "${param.itemNo}"/></td>
	<td>${param.itemName}</td>
	<td><input type="number" class = "stockCnt"  name = "stockCnt" min = 1 maxlength="10"></td>
	<td><input type="date" class = "stockExpiryDate" id = "stockExpiryDate" name = "stockExpiryDate"/></td>
	<td><input type ="checkbox" class = "nullcheckbox"/></td>
	</tr>
	</tbody>
</table>
</form>
	<div class="submit_area">
	<input type ="button" class="submit" value = "완료"/>
	<input type ="button" class="cnl_btn" value = "취소"/>
	</div>
</div>
</div>

</body>
</html>