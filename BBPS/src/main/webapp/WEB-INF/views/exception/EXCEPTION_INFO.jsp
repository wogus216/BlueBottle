<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Exception</title>
<script type="text/javascript">
</script>
</head>
<body>
오류발생<br />
Exception : ${exception.message}<br/>
<c:forEach var="stack" items="${exception.stackTrace}">
${stack}<br/>
</c:forEach>
</body>
</html>



