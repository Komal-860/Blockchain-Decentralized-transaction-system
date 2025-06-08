package com.Bank;

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

import mail.SendKeyMail;

import com.onlinebank.BankCommons;

/**
 * Servlet implementation class rejectdata
 */
@WebServlet("/rejectdata")
public class rejectdata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rejectdata() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		String name = request.getParameter("id");
		//HttpSession session=request.getSession(true);
		String arr[]=name.split(",");
		
	String id=arr[0].toString();	
	String email = arr[1].toString();
	System.out.println("ID=>"+id+"Name=>"+email);
		try {
			String sqls = "SELECT * FROM acc_details WHERE uname ='" + email
					+ "' and bank_id='"+id+"'";
			Connection con = BankCommons.prepareConn();
			Statement st;

			st = con.createStatement();
			Statement st1;
			java.util.Random r = new java.util.Random();
			int accNo = r.nextInt(10000000);
			st1 = con.createStatement();
			ResultSet rs = st.executeQuery(sqls);
			if (rs.next()) {

				Statement s=con.createStatement();
				s.executeUpdate("update acc_details set accno='"+accNo+"' where uname ='" + email
					+ "' and bank_id='"+id+"'");
				Statement ss=con.createStatement();
				ss.executeUpdate("update tblaccountbank set Accountno='"+accNo+"',Status='Reject' where UserName ='" + email
					+ "' and bid='"+id+"'");
				RequestDispatcher rd = request
						.getRequestDispatcher("/userview.jsp");
				rd.include(request, response);
			} else {
				String sql = "SELECT * FROM tblaccountbank WHERE UserName ='" + email
						+ "'";
				Statement ss=con.createStatement();
				ResultSet rs1 = ss.executeQuery(sql);
				if (rs1.next()) {
				String sqlss = "INSERT INTO acc_details (accno, uname, acc_type, details, bank_id,Status ) VALUES ('"
						+ accNo
						+ "','"
						+ email
						+ "','"
						+ rs1.getString("AccountType")
						+ "','"
						+ rs1.getString("AccountDetails")
						+ "','"
						+ id
						+ "','Reject')";
				st1.executeUpdate(sqlss);
				Statement s=con.createStatement();
				s.executeUpdate("update tblaccountbank set Accountno='"+accNo+"' where UserName ='" + email
					+ "' and bid='"+id+"'");
				}
				SendKeyMail.SendReject(email);
				pw.println("<script> alert(' Update Successfuly');</script>");
				RequestDispatcher rd = request
						.getRequestDispatcher("/userview.jsp");
				rd.include(request, response);
			}
		} catch (SQLException e) {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
