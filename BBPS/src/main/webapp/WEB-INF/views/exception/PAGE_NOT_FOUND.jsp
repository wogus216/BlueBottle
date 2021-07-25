<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Exception</title>
<style type="text/css">
body{
	height: 100vh;
    background-image: url("resources/images/bb/404.jpg");
    background-repeat : no-repeat;
    background-size : cover;
}

.ment_on{
	color: white;
    font-size: 50pt;
    top: 10%;
    left: 18%;
    position: absolute;
}

.ment{
	display:none;
	color: white;
    font-size: 50pt;
    top: 10%;
    left: 18%;
    position: absolute;
}

.wrap{
	width: 1000px;
	height: 500px;
	top: 50%;
    left: 35%;
    position: absolute;
}

</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".wrap").hover(function(){
		$(".ment").attr("class", "ment_on");
	},function(){
		$(".ment_on").attr("class", "ment");
		
	});
}); //ready end
</script>
</head>
<body>
<div class="ment">페이지를 찾을 수 없습니다. 관리자에게 문의하세요.</div>
<div class="wrap"></div>
</body>
</html>



