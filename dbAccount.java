package com.bankinfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlinebank.BankCommons;

/**
 * Servlet implementation class dbAccount
 */
@WebServlet("/dbAccount")
public class dbAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dbAccount() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter pw = response.getWriter();
		String uname = request.getParameter("uname");
		String bankname = request.getParameter("bank_name");
		String acc_type = request.getParameter("acc_type");
		String details = request.getParameter("details");
		//String sql = "INSERT INTO acc_details VALUES ("+bankname+",'"+uname+"','"+acc_type+"','"+details+"')";
		String id=null;
		Connection con=BankCommons.prepareConn();
		try 
		{
			Statement sts=con.createStatement();
			String str="select * from bank_details where email='"+bankname+"'";
			System.out.println(str);
			ResultSet rs=sts.executeQuery(str);
			if(rs.next())
			{
				
				id=rs.getString("bank_Id");
			}
			
			Statement st=con.createStatement();
			int update=st.executeUpdate("insert into tblaccountbank(UserName,BankName,AccountType,AccountDetails,Accountno,bank_id,Amount_Account)values('"+uname+"','"+bankname+"','"+acc_type+"','"+details+"','0','"+id+"','0')");
			
		
		
		//System.out.println(sql);
		//int update = BankCommons.update(sql);
		if(update==1)
		{
		pw.println("<script> alert(' Account Request sent Successfuly');</script>");
		RequestDispatcher rd = request.getRequestDispatcher("/HomePage.jsp");
		rd.include(request, response);
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("/account.jsp");
			rd.include(request, response);	
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
