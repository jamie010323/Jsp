<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
			int num1 = 1;
			int num2 = 2;
		
			String str1 = "hello";
			String str2 = "welcome";
			String str3 = "";
			String str4 = null;
		%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1_ELTest</title>
	</head>
	<body>
		<h3>1.표현언어(Expression Language)</h3>
				
		<h4>표현식(Expression)</h4>
		<p>
			num1 : <%= num1 %><br>
			num2 : <%= num2 %><br>
			str1 : <%= str1 %><br>
			str2 : <%= str2 %><br>
			str3 : <%= str3 %><br>
			str4 : <%= str4 %><br>
		
		</p>
		
	</body>
</html>