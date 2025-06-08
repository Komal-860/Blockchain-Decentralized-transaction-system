<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.onlinebank.BankCommons"%>
<!DOCTYPE html>

<html lang="zxx">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="description" content="Bingo One page parallax responsive HTML Template ">
  
  <meta name="author" content="Themefisher.com">

  <title>Bit-Bank</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">  
  <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png" /> 
  <link rel="stylesheet" href="plugins/themefisher-font.v-2/style.css">
  <link rel="stylesheet" href="plugins/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="plugins/slick-carousel/slick/slick.css">
  <link rel="stylesheet" href="plugins/slick-carousel/slick/slick-theme.css">
  <link rel="stylesheet" href="css/style.css">
</head>
<body id="body">
<%	
	if(request.getParameter("Done")!=null)
	{
	out.println("<script>alert('Insurance Details Added Successfully')</script>");	
	}
%>
  <div id="preloader">
    <div class="preloader">
      <div class="sk-circle1 sk-child"></div>
      <div class="sk-circle2 sk-child"></div>
      <div class="sk-circle3 sk-child"></div>
      <div class="sk-circle4 sk-child"></div>
      <div class="sk-circle5 sk-child"></div>
      <div class="sk-circle6 sk-child"></div>
      <div class="sk-circle7 sk-child"></div>
      <div class="sk-circle8 sk-child"></div>
      <div class="sk-circle9 sk-child"></div>
      <div class="sk-circle10 sk-child"></div>
      <div class="sk-circle11 sk-child"></div>
      <div class="sk-circle12 sk-child"></div>
    </div>
  </div> 

<section class="top-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                
            </div>
        </div>
    </div>
</section>
<section class="header  navigation">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <nav class="navbar navbar-expand-lg">
                    <a class="navbar-brand" href="#">
                        <img src="images/logo.png" alt="logo">
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="tf-ion-android-menu"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">
                            <jsp:include page="menu.jsp"></jsp:include>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</section>
<section class="signin-page account" >
    <div class="container" style="width:100%;">
        <div class="row" style="width:100%;">
            <div class="col-md-12 mx-auto" style="width:100%;">
                <div class="block" style="width:100%;">
                    <h2 class="text-center" style="bgcolor:#333333" scope="col"> <font color="#FFFFFF">Show Insurance History</font></h2>
								<form action="InfoInsurance" method="post">
									<table class="table"
										style="width: 90%; text-align: middle; border: solid 2px; margin: 12px 0 0px 50px;">
										<thead class=" text-primary">
											<tr>
												<th>Company Name</th>
												<th>Mobile Number</th>
												<th>Web Site</th>
												<th>Address</th>
												<th>Policy No.</th>
												<th>Policy Name</th>
												<th>Policy Tenue</th>
												<th>Base Premium</th>
												<th>Coverage Info</th>
												<th>Policy Amount</th>
											</tr>
										</thead>
										<tbody>
										<%
											ResultSet rs = null;
											PreparedStatement st = null;
											String quer = null;
											String email=(String)session.getAttribute("email");										
											try {
												Connection con=BankCommons.prepareConn();
												quer = "select * from tblinsuranceinfo where UserEmail='"+email+"'";

												st = con.prepareStatement(quer);
												rs = st.executeQuery();

												while (rs.next()) {
												
										%>
											<tr>
												<td><%=rs.getString(4) %></td>
												<td><%=rs.getString(5) %></td>
												<td><%=rs.getString(6) %></td>
												<td><%=rs.getString(7) %></td>
												<td><%=rs.getString(8) %></td>
												<td><%=rs.getString(9) %></td>
												<td><%=rs.getString(10) %></td>
												<td><%=rs.getString(11) %></td>
												<td><%=rs.getString(12) %></td>
												<td><%=rs.getString(13) %></td>
											</tr>
											<%
												}

											   } catch (SQLException e) {
											}
											%>
										</tbody>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>

</section>
<footer id="footer" class="bg-one">
  <div class="top-footer">
    <div class="container">
      <div class="row">
        <div class="col-sm-3 col-md-3 col-lg-3"> </div>
        <div class="col-sm-3 col-md-3 col-lg-3"> </div>
        <div class="col-sm-3 col-md-3 col-lg-3"> </div>
        <div class="col-sm-3 col-md-3 col-lg-3"> </div>
      </div>
    </div> 
  </div>
  <div class="footer-bottom">
   
  </div>
</footer>

    <script src="plugins/jquery/dist/jquery.min.js"></script>
    <script src="plugins/bootstrap/dist/js/popper.min.js"></script>
    <script src="plugins/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="plugins/slick-carousel/slick/slick.min.js"></script>
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    <script src="plugins/smooth-scroll/dist/js/smooth-scroll.min.js"></script>
    <script src="js/script.js"></script>

  </body>
  </html>