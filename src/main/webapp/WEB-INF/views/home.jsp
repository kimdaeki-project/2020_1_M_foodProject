<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<%@ include file="./templates/header.jsp"%>
<div style="height: 600px">
<P>  The time on the server is ${serverTime}. </P>
</div>
<%@ include file="./templates/footer.jsp"%>
</body>
</html>
