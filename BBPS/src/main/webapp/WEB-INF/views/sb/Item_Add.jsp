<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><style type="text/css">
/* 상단 바 */
.top {
   width: 100%;
   padding: 0;
   margin: 0;
   background-color: white;
   display: inline-block;
   min-width: 1400px;
    height: 62px;
}

.top_menu{
	display: inline-block;
	vertical-align: top;
	float: right ;
	width: 1050px;
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
}

.main_menu{
   display: inline-block;
   color: black;
   padding: 20px 30px;
   text-decoration: none;
   font-weight: bold;
   font-size: 17px;
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
    padding: 12px 16px;
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

.row_add, .row_del{
	background-color: #01a1dd;
	float: right;
}
.row_del{
	background-color: #bf4040;
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
.submit_area{
	text-align: center;
}

.submit{
	width:200px;
	height: 50px;
	background-color: #01a1dd;
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

</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
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
	
	
	$(".submit").on("click",function(){
		aa();
	});
	
}); //ready end

var cnt_tr = 1;

function aa(){
	
	$(".tb_area tr").each(function () {
		var cellItem = $(this).find(":input");
		var itemObj = new Object();
		itemObj.name = cellItem.eq(0).val();
		itemObj.price = cellItem.eq(1).val();
		itemObj.mou = cellItem.eq(2).val();
		
		if($(".itemComProdFlagY").is(":checked") == true){
			itemObj.flag = cellItem.eq(3).val();
			console.log("Y");
		}else if ($(".itemComProdFlagN").is(":checked") == true){
			itemObj.flag = cellItem.eq(4).val();
			console.log("N");
		}
		
		
		console.log(itemObj);
	});
	
	
}

function add_tb(){
	
	if(cnt_tr < 15){
		cnt_tr ++;
		
		var insertTr = "";
		
		insertTr += "<tr>";
		insertTr += "<td><input class = \"itemName\"type=\"text\" name = \"itemName\" maxlength=\"30\"></td>";
		insertTr += "<td><input class = \"itemPrice\"type=\"text\" name = \"itemPrice\" maxlength=\"10\"></td>";
		insertTr += "<td><input class = \"itemMinOrdUnit\"type=\"number\" name = \"itemMinOrdUnit\" maxlength=\"10\"></td>";
		insertTr += "<td><input class = \"itemComProdFlagY\"type=\"radio\" name = \"itemComProdFlag"+cnt_tr+"\" value = \"0\"><label style= \"padding-right: 20px;\">Y</label>";
		insertTr += "<input class = \"itemComProdFlagN\"type=\"radio\" name = \"itemComProdFlag"+cnt_tr+"\" value = \"1\"><label>N</label></td>";
		insertTr += "</tr>";
		
		$("tbody").append(insertTr);
	}else{
		alert("최대 행입니다.");
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
         <img class="logo" alt="logo" src="resources/images/bb/logo.png" width="250px"></a>
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
	        		품목관리</a>
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
<h1>품목등록</h1>
<div class="btn_area">
<button class="row_del" style="margin-right: 0px;">행삭제</button>
<button class="row_add">행추가</button>
</div>
<form action = "#" id = "tb_Form" method = "post"><!-- tbody에 있는 내용 넘기기위해 -->
<div class = "tb_area">
<table cellspacing="0">
	<colgroup>
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
	</colgroup>
	<thead>
	<tr>
		<th scope=col style= "border-left: none;">품목명</th>
		<th scope=col>가격(원)</th>
		<th scope=col>최소주문단위</th>
		<th scope=col>완제품여부</th>
	</tr>
	</thead>
	
	<tbody>	
	<tr>
	<td><input type="text" class = "itemName" name = "itemName" maxlength="30"></td>
	<td><input type="text" class = "itemPrice" name = "itemPrice" maxlength="10"></td>
	<td><input type="number" class = "itemMinOrdUnit" name = "itemMinOrdUnit" maxlength="10"></td>
	<td><input type="radio" class = "itemComProdFlagY" name = "itemComProdFlag" value = "0"><label style= "padding-right: 20px;">Y</label>
		<input type="radio" class = "itemComProdFlagN" name = "itemComProdFlag" value = "1"><label>N</label></td>	
	</tr>
	</tbody>
</table>
</div>
</form>
	<div class="submit_area">
	<button class="submit">등록완료</button>
	</div>
</div>
</div>
</body>
</html>