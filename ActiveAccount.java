package com.Bank;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlinebank.BankCommons;

/**
 * Servlet implementation class ActiveAccount
 */
@WebServlet("/ActiveAccount")
public class ActiveAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String id=request.getParameter("id");
		try 
		{
			Connection con=BankCommons.prepareConn();
			PreparedStatement ps=con.prepareStatement("UPDATE `user_details` SET `status`='Active', fail_count='0' WHERE `id`='"+id+"'");
			int i=ps.executeUpdate();
			if(i>0)
			{
				System.out.println("Update Done");
				response.sendRedirect("viewBlockAccount.jsp?update=done");
			}
			else
			{
				System.out.println("Fail Update");
				response.sendRedirect("viewBlockAccount.jsp?fail=done");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
