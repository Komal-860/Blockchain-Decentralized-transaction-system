package com.userinfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mail.SendKeyMail;

import com.onlinebank.BankCommons;

@WebServlet("/doLogin")
public class doLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public doLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		session.invalidate();

		out.println("<script type=\"text/javascript\">");
		out.println("alert('You are successfully logged out!');");
		out.println("</script>");
		request.getRequestDispatcher("index.jsp").include(request, response);
		out.close();
	}

	public String otpcode() {

		StringBuilder ss = new StringBuilder();
		Random r = new Random();
		char ch;

		for (int i = 0; i < 5; i++) {
			ch = (char) (Math.floor(26 * r.nextDouble() + 65));
			ss.append(ch);
		}

		return ss.toString();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession(false);
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String roll = request.getParameter("infodata");
		if (roll.equals("User")) 
		{
			Connection con = BankCommons.prepareConn();
			String sql = "SELECT * FROM user_details WHERE email ='" + email + "'";
			System.out.println(sql);
			boolean ck = BankCommons.checkUser(sql, session);
			if (ck == true) 
			{
				String status=session.getAttribute("status").toString();
				String db_password=session.getAttribute("password").toString();
				int fail_count=Integer.parseInt(session.getAttribute("fail_count").toString());
				
				System.out.println("DB Password "+db_password);
				System.out.println("status "+status);
				if(password.equals(db_password))
				{
					
					if(status.equals("Active"))
					{
					
						String otpcodes = otpcode();
						session.setAttribute("email", email);
						pw.println("<script> alert(' Login Successfuly');</script>");
						RequestDispatcher rd = request.getRequestDispatcher("/HomePage.jsp");
						rd.include(request, response);
					}
					else
					{
						System.out.println("Account is Block");
						response.sendRedirect("index.jsp?ac=block");
					}
				}
				else
				{
					if(status.equals("Block"))
					{
						System.out.println("Account is Block");
						response.sendRedirect("index.jsp?ac=block");
					}
					else
					{
					
						try 
						{
						
							PreparedStatement ps=con.prepareStatement("UPDATE `user_details` SET fail_count=fail_count+1 where email='"+email+"'");
							int i=ps.executeUpdate();
							if(i>0)
							{
								
								++fail_count;
								if(fail_count==3)
								{
									PreparedStatement ps1=con.prepareStatement("UPDATE `user_details` SET status='Block' where email='"+email+"'");
									ps1.executeUpdate();
									System.out.println("Incorrct Password Increment Fail Counts");
									response.sendRedirect("index.jsp?ac=block");
								}
								else
								{
									System.out.println("Incorrct Password Increment Fail Counts");
									response.sendRedirect("index.jsp?pass=wrong");
								}
							}
							else
							{
								System.out.println("Incorrct Password Fail update");
								response.sendRedirect("index.jsp?fail=update");
							}
						} catch (Exception e) 
						{
							System.out.println("Exc "+e);
						}
					}
				}
				
			}
			else 
			{
				System.out.println("incoreect Login Details");
				response.sendRedirect("index.jsp?fail=details");
			}
		}

		else if (roll.equals("Bank")) 
		{
			try
			{
				String sql = "SELECT * FROM bank_details WHERE email ='" + email + "' AND password = '" + password
						+ "'";
				Connection con = BankCommons.prepareConn();
				Statement st = con.createStatement();

				ResultSet rs = st.executeQuery(sql);
				if (rs.next()) 
				{
					session.setAttribute("email", rs.getString("email"));
					session.setAttribute("name", rs.getString("name"));
					pw.println("<script> alert('Login Successfuly');</script>");
					// RequestDispatcher rd = request.getRequestDispatcher("/BankHomePage.jsp");
					// rd.include(request, response);
					response.sendRedirect("BankHomePage.jsp");
				} else {
					response.sendRedirect("index.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else 
		{
			try {
				String sqls = "SELECT * FROM tblinsurance WHERE email ='" + email + "' AND password = '" + password
						+ "'";
				System.out.println(sqls);
				Connection con = BankCommons.prepareConn();
				Statement st = con.createStatement();

				ResultSet rs = st.executeQuery(sqls);
				if (rs.next()) {
					session.setAttribute("name", rs.getString("name"));
					session.setAttribute("email", rs.getString("email"));
					session.setAttribute("contact", rs.getString("contact"));
					session.setAttribute("website", rs.getString("website"));
					pw.println("<script> alert('Login Successfuly');</script>");
					// RequestDispatcher rd =
					// request.getRequestDispatcher("/InsuranceHomePage.jsp");
					// rd.include(request, response);
					response.sendRedirect("InsuranceHomePage.jsp");
				} else {
					response.sendRedirect("index.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
