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
<title>Insert title here</title><style type="text/css">
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
.selectBox, .tot_price li{
	float:right;
}
.ord_info li, .tot_price li{
	font-size:19px;
	margin:10px;
	
}
.ord_info ul, .tot_price ul{
	max-width: 1000px; 
   
}

.apv_info, .send{
	float:right;
	font-size:19px;
}

.apv_stat{
	 color:red;
}
/* 이게일반 */
.row_add, .row_del,.submit,.cnl_btn{
	color: white;
	width: 100px;
	height: 40px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin:10px;
	cursor: pointer;
	background-color: #01a1dd;
	outline:none;
}

.row_add, .row_del{
	float: right;
}
.row_del{
	background-color: #bf4040;
}

.submit_area{
	text-align: center;
}

.submit{
	width: 180px;
	height: 50px;
	background-color: #01a1dd;
	font-weight: bold;
	 font-size: 22px;
}

.cnl_btn{
	background-color: #b3b3b3;
    width: 180px;
    height: 50px;
    font-weight: bold;
    font-size: 22px;
}

button:focus{outline:none;}

/*라디오버튼(완제품여부) 생김새*/
input[type=radio]{
	margin: 0;
	height: 25px;
	width: 30px;
	vertical-align: middle;
}

#itemCate{
	width : 100px;
	height : 40px;
	text-align: middle;
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

var cnt_tr = 1;

$(document).ready(function(){
	
	$(".row_add").on("click",function(){
		
		$.ajax({
		      url : "Stock_Addcate",//접속주소
		      type : "post", //전송방식 : get,post // >>문자열을 줬지만 알아서 포스트 형식으로 
		      dataType :"json", //받아올 데이터 형식
		      success : function(res){
		    	  add_tb(res.catelist);
		      },
		      error : function(request,status,error){
		         console.log(error);
		      }
		   });
	});
	
	$(".row_del").on("click",function(){
		del_tb();
	});
	
	$(".cnl_btn").on("click",function(){
		location.href = "Item_List";
	});
	
	$(".submit").on("click",function(){
		var nameCnt = 0; //품목명 빈 값이 있는지 체크할 변수 (빈 값이 존재하는 경우 작업불가 alert)
		var priceCnt = 0; //품목가격 빈 값이 있는지 체크할 변수 (빈 값이 존재하는 경우 작업불가 alert)
		var minordCnt = 0; //최소주문단위 빈 값이 있는지 체크할 변수 (빈 값이 존재하는 경우 작업불가 alert)

		$(".itemName").each(function(){
			if($(this).val() == ""){
				nameCnt++;
			}
		});
		
		$(".itemPrice").each(function(){
			if($(this).val() == ""){
				priceCnt++;
			}
		});
		
		$(".itemMinOrdUnit").each(function(){
			if($(this).val() == ""){
				minordCnt++;
			}
		});
		
		if(nameCnt > 0){
			makePopup("품목추가","품목명을 입력해주세요.",function(){});
		   $(".itemName").focus;
		}else if(priceCnt > 0){
			makePopup("품목추가","가격을 입력해주세요.",function(){});
		   $(".itemPrice").focus;
		}else if(minordCnt > 0){
			makePopup("품목추가","최소주문단위를 입력해주세요.",function(){});
		   $(".itemMinOrdUnit").focus;
		}else{
			
		   var params = $("#tb_Form").serialize();
		   
		   $.ajax({
		      url : "Item_Adds",//접속주소
		      type : "post", //전송방식 : get,post // >>문자열을 줬지만 알아서 포스트 형식으로 
		      dataType :"json", //받아올 데이터 형식
		      data : params,///보낼데이터(문자열 형태)
		      success : function(res){
		         if(res.msg == "success"){
		            location.href = "Item_List";
		         }else if (res.msg == "failed"){
		        	 makePopup("품목추가","등록에 실패하였습니다.",function(){});
		         }else {
		        	 makePopup("품목추가","등록 중 문제가 발생하였습니다.",function(){});
		         }
		      },
		      error : function(request,status,error){
		         console.log(error);
		      }
		   });
		}
	});
	
	$("tbody").on("click", "[type='radio']", function() {
		$(this).parent().children("#itemComProdFlag").val($(this).val());
	});
	
}); //ready end

function add_tb(catelist){
	
	if(cnt_tr < 15){
		cnt_tr ++;
		
		var insertTr = "";
		
		insertTr += "<tr>";
		insertTr += "<td>";
		
		insertTr += "<select name = \"itemCate\" id = \"itemCate\">";
			
			for(var d of catelist){
				insertTr += "<option  value = \""+d.CATE_NO+"\">"+d.CATE_NAME+"</option>";
			}
		
		insertTr += "</select>";
		insertTr += "</td>";
		insertTr += "<td><input class = \"itemName\"type=\"text\" name = \"itemName\" maxlength=\"30\"></td>";
		insertTr += "<td><input class = \"itemPrice\"type=\"number\" min = 1 name = \"itemPrice\" maxlength=\"10\"></td>";
		insertTr += "<td><input class = \"itemMinOrdUnit\"type=\"number\" name = \"itemMinOrdUnit\" maxlength=\"10\"></td>";
		insertTr += "<td><input class = \"itemComProdFlag\"type=\"radio\" name = \"itemComProdFlag"+cnt_tr+"\" checked=\"checked\" value = \"0\"><label style= \"padding-right: 20px;\">Y</label>";
		insertTr += "<input class = \"itemComProdFlag\"type=\"radio\" name = \"itemComProdFlag"+cnt_tr+"\" value = \"1\"><label>N</label>";
		insertTr += "<input type=\"hidden\" id=\"itemComProdFlag\" name=\"itemComProdFlag\" value=\"0\" />";
		insertTr += "</td>";
		insertTr += "</tr>";
		
		$("tbody").append(insertTr);
	}else{
		 makePopup("품목추가","최대 행입니다.",function(){});
	}
}

function del_tb(){
	
	if(cnt_tr > 1){
		cnt_tr --;
		$("tbody tr:last").remove();
	}else{
		cnt_tr = 1;
		makePopup("품목추가","첫 번째 행입니다.",function(){});
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
<h1>품목등록</h1>
<div class="btn_area">
<input type="button" class="row_del" style="margin-right: 0px;" value = "행삭제"/>
<input type="button" class="row_add" value = "행추가"/>
</div>
<form action = "#" id = "tb_Form" method = "post"><!-- tbody에 있는 내용 넘기기위해 -->
<input type = "hidden" id = "userNo" name = "userNo" value = "${sUSERNo}"/>
<div class = "tb_area">
<table cellspacing="0">
	
	<thead>
	<tr>
		<th scope=col style= "border-left: none;">카테고리</th>
		<th scope=col>품목명</th>
		<th scope=col>가격(원)</th>
		<th scope=col>최소주문단위</th>
		<th scope=col>완제품여부</th>
	</tr>
	</thead>
	
	<tbody>	
	<tr>
	<td><select name = "itemCate" id = "itemCate">
           <c:forEach items="${catelist}" var = "d">
              <option value="${d.CATE_NO}">
               <c:out value="${d.CATE_NAME}"/>
              </option>
           </c:forEach>
		</select></td>
	<td><input type="text" class = "itemName" name = "itemName" maxlength="30"></td>
	<td><input type="number" class = "itemPrice" name = "itemPrice" maxlength="10"></td>
	<td><input type="number" class = "itemMinOrdUnit" name = "itemMinOrdUnit" maxlength="10"></td>
	<td><input type="radio" class = "itemComProdFlag" name = "itemComProdFlag1" checked="checked" value = "0"><label style= "padding-right: 20px;">Y</label>
		<input type="radio" class = "itemComProdFlag" name = "itemComProdFlag1" value = "1"><label>N</label>
		<input type="hidden" id="itemComProdFlag" name="itemComProdFlag" value="0" /></td>	
	</tr>
	</tbody>
</table>
</div>
</form>
	<div class="submit_area">
	<input type = "button" class="submit" value = "등록"/>
	<input type = "button" class="cnl_btn" value = "취소"/>
	</div>
</div>
</div>
</body>
</html>