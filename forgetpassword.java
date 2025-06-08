package com.userinfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mail.SendKeyMail;

import com.onlinebank.BankCommons;

/**
 * Servlet implementation class forgetpassword
 */
@WebServlet("/forgetpassword")
public class forgetpassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forgetpassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
PrintWriter out=response.getWriter();
		
		String e=request.getParameter("username");
		String email=request.getParameter("email");
		System.out.println("Your Email= "+email);
		
		try 
		{
			Connection con=BankCommons.prepareConn();
			Statement st=con.createStatement();
			String q="select * from user_details where email='"+email+"'";
			ResultSet i=st.executeQuery(q);
			
			if(i.next())
			{
				String password=i.getString("upass");
				SendKeyMail.Sendforgetpassword(email, password);
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Send Password');");  
				out.println("</script>");
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				rd.include(request, response);
				}
				
			else 
			{
				out.println("<script type=\"text/javascript\">");  
				out.println("alert('Email ID doesnot exist. Provide Correct Email iD');");  
				out.println("</script>");    
				request.getRequestDispatcher("/ForgetPassword.jsp").include(request, response);
			}
		} 
		catch (Exception e2)
		{
			e2.printStackTrace();
		}
	
	}

}
