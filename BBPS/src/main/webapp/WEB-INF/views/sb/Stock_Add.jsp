<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    padding: 10px 16px;
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
button{
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
	
	document.getElementById("stockExpiryDate").valueAsDate = new Date();
	document.getElementById("stockExpiryDate").setAttribute("min",today);
	
	$(".top_menu").on("click","a",function(){
		$(".top_menu a").attr("style","color: black");
		$(this).css("color", "#01a1dd");
		$(this).parent().parent().children(1).css("color", "#01a1dd");
	});
	$(".sub").hover(function(){
		$("li").css("background-color","white");
		$(this).parent("li").css("background-color","#f1f1f1");
	
	},function(){
			$("li").css("background-color","white");
	});
	
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
			alert("추가수량을 입력해주세요.");
		   $(".stockCnt").focus;
		}else{
			
		   var params = $("#tb_Form").serialize();
		   
		   $.ajax({
		      url : "Stock_Adds",//접속주소
		      type : "post", //전송방식 : get,post // >>문자열을 줬지만 알아서 포스트 형식으로 
		      dataType :"json", //받아올 데이터 형식
		      data : params,///보낼데이터(문자열 형태)
		      success : function(res){
		         if(res.msg == "success"){
		            $("#tb_Form").attr("action","Stock_Dtl");
		            $("#tb_Form").submit();
					$("#goForm").submit();
		         }else if (res.msg == "failed"){
		            alert("재고 추가에 실패하였습니다."); // 팝업 변경 필요
		         }else {
		            alert("재고 추가 중 문제가 발생하였습니다."); // 팝업 변경 필요
		         }
		      },
		      error : function(request,status,error){
		         console.log(error);
		      }
		   });
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
	insertTr += "</tr>";
	
	
	$("tbody").append(insertTr);
	
	}else{
		alert("최대 행입니다."); // 팝업 변경 필요
	}
}

function del_tb(){
	
	if(cnt_tr > 1){
		cnt_tr --;
		$("tbody tr:last").remove();
	}else{
		cnt_tr = 1;
		alert("첫 번째 행입니다. ");
	}
}

</script>
</head>
<body>
<!-- 상단 -->
   <div class="top">
     <ul>
         <li>
         <a href="#">
         <img class="logo" alt="logo" src="logo.png" width="250px"></a>
         </li>
         
         <div class="top_menu">
         
         <div class="menu_a">
         <li>
         	<a class="main_menu" href="#">
         	주문관리</a>
	         <div class="sub">
	        	 <a href="#">
	            	주문조회</a>
	            <a href="#">
	            	환불요청조회</a>
	             <a href="#">
	            	환불완료조회</a>
	      </div>
         </li>
         </div>
         
         <div class="menu_b">
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
         
           <div class="menu_c">
         <li>
		<a class="main_menu" href="#"> 
	        		픔목관리</a>
	          	<div class="sub">
				<a href="#">
	            	품목조회</a>
	            <a href="#">
	            	품목등록</a>
	            </div>
          </li>
         </div>
         
         <div class="menu_d">
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
          <div class="menu_e">
         	<li>
         		<a class="main_menu" href="#"> 
         			공지사항</a>
	        </li>
         </div>
         <div class="menu_f">
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
          <div class="menu_g">
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
<form action = "Stock_Dtl" id = "goForm" method = "post">
<input type = "hidden" name ="itemNo" value = "${param.itemNo}"/>
<input type = "hidden" name = "page" value = "${param.page}"/> <!-- 파람 붙여줘야 전 페이지에서 온 걸 받는 것 // 페이지는 목록에서 준 것 컨트롤러에서 주는 것이 아님 그래서 파람 있어야함 -->
<input type = "hidden" name ="itemName" value = "${param.itemName}"/>
<input type = "hidden" name = "search_filter" value = "${param.search_filter}"/>
<input type = "hidden" name = "search_input" value = "${param.search_input}"/>
</form>
<h1>재고등록</h1>
<div class="btn_area" style = "height:40px;">
<button class="row_del" style= "margin:0px 0px 0px 10px;">행삭제</button>
<button class="row_add" style= "margin:0px 0px 0px 10px;">행추가</button>
</div>
<form action = "#" id = "tb_Form" method = "post">
<table cellspacing="0">
	<colgroup>
		<col width="25%" />
		<col width="25%" />
		<col width="25%" />
		<col width="25%" />
	</colgroup>
	<thead>
	<tr >
		<th scope=col style= "border-left: none;">품목코드</th>
		<th scope=col>품목명</th>
		<th scope=col>추가수량</th>
		<th scope=col>유통기한</th>
	</tr>
	</thead>
	<tbody>
	<tr>
	<td>${param.itemNo}<input type = "hidden" name = "itemNo" value = "${param.itemNo}"/></td>
	<td>${param.itemName}</td>
	<td><input type="number" class = "stockCnt"  name = "stockCnt" min = 1 maxlength="10"></td>
	<td><input type="date" class = "stockExpiryDate" id = "stockExpiryDate" name = "stockExpiryDate" max = "2999-01-01" /></td>
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