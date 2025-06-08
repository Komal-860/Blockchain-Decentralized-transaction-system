<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bit Bank</title>
</head>
<body>
	<li class="nav-item active"><a class="nav-link" href="BankHomePage.jsp">Welcome,&nbsp;<%= (String)session.getAttribute("name")%></a></li>
    
    <li class="nav-item active"><a class="nav-link" href="viewBlockAccount.jsp">View Block Account</a></li>
    <li class="nav-item active"><a class="nav-link" href="userview.jsp">View Users Requests</a></li>
    <li class="nav-item active"><a class="nav-link" href="ViewBankUsers.jsp">View Bank Users</a></li>
	<li class="nav-item active"><a class="nav-link" href="doLogin">LogOut</a></li>
</body>
</html>