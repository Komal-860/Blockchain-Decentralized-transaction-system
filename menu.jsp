<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%-- <li class="nav-item active"><a class="nav-link" href="HomePage.jsp">Welcome,&nbsp;<%= (String)session.getAttribute("cust_name")%></a></li> --%>
    <li class="nav-item active"><a class="nav-link" href="account.jsp">Create Account</a></li>
	<li class="nav-item active"><a class="nav-link" href="deposite.jsp">Deposite</a></li>
    <li class="nav-item active"><a  class="nav-link" href="withdraw.jsp">Do Withdraw</a></li>
    <li class="nav-item active"><a class="nav-link" href="get-balance.jsp">Get Balance</a></li>
	<li class="nav-item active"><a class="nav-link" href="transfer.jsp">Transfer Amount</a></li>
	<li class="nav-item active"><a class="nav-link" href="view-reports.jsp">View Report</a></li>
	<li class="nav-item active"><a class="nav-link" href="AddInsurance.jsp">Add Insurance</a></li>
	<li class="nav-item active"><a class="nav-link" href="doLogin">LogOut</a></li>

</body>
</html>