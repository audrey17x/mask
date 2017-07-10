<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
	<form:form modelAttribute="product" action="show" method="post">
		<form:input path="id" /> <br>
		<input type="submit" name="testSubmit"/>
		<input type="reset" value="重置" />
	</form:form>
</body>
</html>