<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,java.util.*,com.onlinebank.BankCommons" errorPage="" %>

<%
//java Code
String uname = (String)session.getAttribute("cust_name");
String sql = "SELECT acc_no, operation, amt, balance, time1,Destination,T_ID FROM tx_details WHERE uname='"+uname+"' order by tx_id desc limit 5";
//System.out.println(sql);
ArrayList one = BankCommons.getAccountDetailsByName(sql);
//System.out.println(one);
int size = one.size();
if(size < 1) {
	response.sendRedirect("HomePage.jsp");
}
%>
	
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Banking | Dashboard</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />    
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />    
    <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <link href="dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <link href="plugins/iCheck/flat/blue.css" rel="stylesheet" type="text/css" />
    <link href="plugins/morris/morris.css" rel="stylesheet" type="text/css" />
    <link href="plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <link href="plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
    <link href="plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <link href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
<style>
.rcorners3 { 
  border-radius: 15px 50px 30px;
  background: url(./images/Paper11.jpg);
  padding: 20px; 
  width: 200px;
  height: 150px;
}
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}
.button1 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
  border-radius: 12px;
}
.button1:hover {
  background-color: #4CAF50;
  color: white;
}
.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
  border-radius: 12px;
}
.button2:hover {
  background-color: #008CBA;
  color: white;
}

table, th, td {
  border: 1px solid black;
  border-radius: 10px;
  
}
th, td {
  padding-top: 5px;
  padding-bottom: 15px;
  padding-left: 25px;
  padding-right: 35px;
  border-style: ridge;
  font-size: 18px;
}
tr:nth-child(even) {
  background-color: rgba(150, 212, 212, 0.4);
}

th:nth-child(even),td:nth-child(even) {
  background-color: rgba(150, 212, 212, 0.4);
}
</style>
  </head>
  <body class="skin-blue">
  <%
	if(request.getParameter("update")!=null)
	{
		out.print("<script>alert('Request Accept Done')</script>");
	}
	%>
    <div class="wrapper">
      
      <header class="main-header">
        <a href="index2.html" class="logo"><b>Banking </b>Blockchain</a>
        <nav class="navbar navbar-static-top" role="navigation">
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <li class="dropdown messages-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-envelope-o"></i>
                  <span class="label label-success">4</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 4 messages</li>
                  <li>
                    <ul class="menu">
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
                          </div>
                          <h4>
                            Support Team
                            <small><i class="fa fa-clock-o"></i> 5 mins</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="user image"/>
                          </div>
                          <h4>
                            AdminLTE Design Team
                            <small><i class="fa fa-clock-o"></i> 2 hours</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="user image"/>
                          </div>
                          <h4>
                            Developers
                            <small><i class="fa fa-clock-o"></i> Today</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="user image"/>
                          </div>
                          <h4>
                            Sales Department
                            <small><i class="fa fa-clock-o"></i> Yesterday</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <div class="pull-left">
                            <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="user image"/>
                          </div>
                          <h4>
                            Reviewers
                            <small><i class="fa fa-clock-o"></i> 2 days</small>
                          </h4>
                          <p>Why not buy a new awesome theme?</p>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer"><a href="#">See All Messages</a></li>
                </ul>
              </li>
  
              <li class="dropdown notifications-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bell-o"></i>
                  <span class="label label-warning">10</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 10 notifications</li>
                  <li>
                    <ul class="menu">
                      <li>
                        <a href="#">
                          <i class="fa fa-users text-aqua"></i> 5 new members joined today
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the page and may cause design problems
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-users text-red"></i> 5 new members joined
                        </a>
                      </li>

                      <li>
                        <a href="#">
                          <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <i class="fa fa-user text-red"></i> You changed your username
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer"><a href="#">View all</a></li>
                </ul>
              </li>
 
              <li class="dropdown tasks-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-flag-o"></i>
                  <span class="label label-danger">9</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">You have 9 tasks</li>
                  <li>

                    <ul class="menu">
                      <li><!-- Task item -->
                        <a href="#">
                          <h3>
                            Design some buttons
                            <small class="pull-right">20%</small>
                          </h3>
                          <div class="progress xs">
                            <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">20% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <h3>
                            Create a nice theme
                            <small class="pull-right">40%</small>
                          </h3>
                          <div class="progress xs">
                            <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">40% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <h3>
                            Some task I need to do
                            <small class="pull-right">60%</small>
                          </h3>
                          <div class="progress xs">
                            <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">60% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <h3>
                            Make beautiful transitions
                            <small class="pull-right">80%</small>
                          </h3>
                          <div class="progress xs">
                            <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                              <span class="sr-only">80% Complete</span>
                            </div>
                          </div>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="footer">
                    <a href="#">View all tasks</a>
                  </li>
                </ul>
              </li>

              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="dist/img/avatar5.png" class="user-image" alt="User Image"/>
                  <span class="hidden-xs"><%=session.getAttribute("cust_name")%></span>
                </a>
                <ul class="dropdown-menu">
                  <li class="user-header">
                    <img src="dist/img/avatar5.png" class="img-circle" alt="User Image" />
                    <p>
                      <%=session.getAttribute("cust_name")%> - User
                      <small>Member since Nov. 2022</small>
                    </p>
                  </li>

                  <li class="user-body">
                    <div class="col-xs-4 text-center">
                      <a href="#">Followers</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Sales</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Friends</a>
                    </div>
                  </li>
 
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="pull-right">
                      <a href="#" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>

      <aside class="main-sidebar">
        <section class="sidebar">
          <div class="user-panel">
            <div class="pull-left image">
              <img src=dist/img/avatar5.png class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p><%=session.getAttribute("cust_name")%></p>

              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>

          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
  
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
              <li class="active treeview">
              	<a href="HomePage.jsp"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
              <li class="active treeview">
              	<a href="account.jsp"><i class="glyphicon glyphicon-folder-open"></i> <span>Create Account</span></a></li>
              <li class="active treeview">
              	<a href="deposite.jsp"><i class="fa fa-envelope"></i> <span>Deposite</span></a></li>
              <li class="active treeview">
              	<a href="withdraw.jsp"><i class="fa fa-envelope"></i> <span>Do Withdraw</span></a></li>
              <li class="active treeview">
              	<a href="get-balance.jsp"><i class="fa fa-envelope"></i> <span>Get Balance</span></a></li>
              <li class="active treeview">
              	<a href="transfer.jsp"><i class="fa fa-envelope"></i> <span>Transfer Amount</span></a></li>
              <li class="active treeview">
              	<a href="view-reports.jsp"><i class="fa fa-envelope"></i> <span>View Report</span></a></li>
              <li class="active treeview">
              	<a href="index.jsp?logout"><i class="glyphicon glyphicon-log-out"></i> <span>Logout</span></a></li>
              <li class="active treeview">
              	<a href="#"><i class="fa fa-edit"></i> <span>About Us</span></a></li>
              <li class="active treeview">
              	<a href="#"><i class="fa fa-edit"></i> <span>Contact Us</span></a></li>
          </ul>
        </section>
      </aside>

      <div class="content-wrapper">
        <section class="content-header">
          <h1>
            Dashboard
            <small>Control panel</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Dashboard</li>
          </ol>
        </section>

        <section class="content">
          <div class="row">
            <div class="col-lg-3 col-xs-6">
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3>150</h3>
                  <p>New Users</p>
                </div>
                <div class="icon">
                  <i class="ion ion-bag"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <div class="col-lg-3 col-xs-6">
         
              <div class="small-box bg-green">
                <div class="inner">
                  <h3>53<sup style="font-size: 20px">%</sup></h3>
                  <p>User Experience</p>
                </div>
                <div class="icon">
                  <i class="ion ion-stats-bars"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <div class="col-lg-3 col-xs-6">
           
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3>44</h3>
                  <p>User Registrations</p>
                </div>
                <div class="icon">
                  <i class="ion ion-person-add"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <div class="col-lg-3 col-xs-6">
        
              <div class="small-box bg-red">
                <div class="inner">
                  <h3>65</h3>
                  <p>Unique Services</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div>
          </div>
          
          <br></br>
              <section class="col-lg-12 connectedSortable">
               <div class="box box-success">
                <div class="box-header">
                  <i class="ionicons ion-pull-request"></i>
                  <h3 class="box-title"><b>View Account Reports:-</b></h3>
                  <div class="box-tools pull-right" data-toggle="tooltip" title="Status">
                    <div class="btn-group" data-toggle="btn-toggle" >
                      <button type="button" class="btn btn-default btn-sm active"><i class="fa fa-square text-green"></i></button>
                      <button type="button" class="btn btn-default btn-sm"><i class="fa fa-square text-red"></i></button>
                    </div>
                  </div>
                </div>
                <div>
                     
	  <table style=" width: 80%" border="0" >
        <tr>
          <th colspan="7" bgcolor="#333333" scope="col"><font color="#FFFFFF">Following are the Repost of Your Acount(s). </font></th>
        </tr>
        <tr>
          <td colspan="7">&nbsp;</td>
          </tr>
        <tr>
        <td bgcolor="#2175BC"><div align="center" class="style2">T_ID </div></td>
          <td bgcolor="#2175BC"><div align="center" class="style2">Acc No. </div></td>
          <td bgcolor="#2175BC"><div align="center" class="style2">Operation</div></td>
          <td bgcolor="#2175BC"><div align="center" class="style2">Amt</div></td>
          <td bgcolor="#2175BC"><div align="center" class="style2">Balance</div></td>
          <td bgcolor="#2175BC"><div align="center" style="width:250px">Date - Time </div></td>
          <td bgcolor="#2175BC"><div align="center" class="style2">Destination</div></td>
          
        </tr>
		<%
		for(int i=0;i<one.size();i++) {
		ArrayList o = (ArrayList)one.get(i); 
		%>
        <tr>
          <td><div align="center"><%=(String)o.get(6)%></div></td>
          <td><div align="center"><%=(String)o.get(0)%></div></td>
          <td><div align="center"><%=(String)o.get(1)%></div></td>
          <td><div align="center"><%=(String)o.get(2)%></div></td>
          <td><div align="center"><%=(String)o.get(3)%></div></td>
           <td><div align="center"><%=(String)o.get(4)%></div></td>
          <td><div align="center"><%=(String)o.get(5)%></div></td>
        </tr>
		<% } %>
        
      </table>

			 </div>
                </div></section>
                <div class="box-footer">
                  <div class="input-group">
                    <input class="form-control" placeholder="Type message..."/>
                    <div class="input-group-btn">
                      <button class="btn btn-success"><i class="fa fa-plus"></i></button>
                    </div>
                  </div>
                </div>
              </div>
          
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2022-2023 <a href="#">Banking Blockchain</a>.</strong> All rights reserved.
      </footer>
    </div>

    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js" type="text/javascript"></script>
    <script>
      $.widget.bridge('uibutton', $.ui.button);
    </script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>    
    <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="plugins/morris/morris.min.js" type="text/javascript"></script>
    <script src="plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
    <script src="plugins/knob/jquery.knob.js" type="text/javascript"></script>
    <script src="plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <script src="plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
    <script src="plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <script src="plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src='plugins/fastclick/fastclick.min.js'></script>
    <script src="dist/js/app.min.js" type="text/javascript"></script>
    <script src="dist/js/pages/dashboard.js" type="text/javascript"></script>
    <script src="dist/js/demo.js" type="text/javascript"></script>
  </body>
</html>
