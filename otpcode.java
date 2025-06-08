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
import javax.servlet.http.HttpSession;

import mail.SendKeyMail;

import com.onlinebank.BankCommons;

/**
 * Servlet implementation class otpcode
 */
@WebServlet("/otpcode")
public class otpcode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public otpcode() {
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
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession(true);
		String otpcode = request.getParameter("username");
		
		String email=(String)session.getAttribute("email");
		
		System.out.println("Email-ID=>"+email+"OTP Code=>"+otpcode);
		Connection con;
		try
		{
			con = BankCommons.prepareConn();
			Statement stRegister=con.createStatement();
			ResultSet rsLogin;
			rsLogin=stRegister.executeQuery("select * from otpcodetble where email='" +email+ "'");
			if(rsLogin.next())
			{
				System.out.println(rsLogin.getString("otpcode"));
				
				if(otpcode.toLowerCase().equals(rsLogin.getString("otpcode").toLowerCase()))
				{
				System.out.println("OK ");
				
				
				pw.println("<script> alert(' Login Successfully');</script>");
				RequestDispatcher rd = request.getRequestDispatcher("HomePage.jsp");
							
				rd.include(request, response); 
				}
				else
				{
					
					pw.println("<script> alert(' Wrong OTP Code');</script>");
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					
					
					rd.include(request, response);
					
				}
				
			}
			else
			{
				pw.println("<script> alert(' Wrong Email-ID');</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
				rd.include(request, response);
				
				
			}
		}
		catch(Exception e)
		{
			
		}
	}

}
