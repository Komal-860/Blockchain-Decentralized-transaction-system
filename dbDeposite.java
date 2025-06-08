package com.bankinfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlinebank.BankCommons;

/**
 * Servlet implementation class dbDeposite
 */
@WebServlet("/dbDeposite")
public class dbDeposite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dbDeposite() {
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
		String op = "DEPOSITE";
		String date = (new java.util.Date()).toString();
		String uname = request.getParameter("uname");
		int accno = Integer.parseInt(request.getParameter("accNo"));
		int amt = Integer.parseInt(request.getParameter("Amount"));
		String msg="self";
		Random generator = new Random();
		int num = generator.nextInt(99999) + 99999;
		
		String bal_sql1 = "SELECT amt FROM tx_details WHERE Destination = '"+accno+"'";
		int bal_amt = BankCommons.getoldBalance(bal_sql1);
		System.out.println("Old amt=>"+bal_amt);
		
		String bal_sql = "SELECT balance FROM tx_details WHERE uname='"+uname+"' AND acc_no = "+accno+" AND isnew = 'YES'";
		int bal = BankCommons.getBalance(bal_sql);
		int update=0;
		if(bal == 0){
			System.out.println("Current Balance : "+bal);
			bal = bal + amt+bal_amt;
		
		}else {
			bal = bal + amt+bal_amt;
			String sql_up = "UPDATE tx_details SET isnew = 'NO',balance='"+bal+"',Destination='"+msg+"',T_ID='"+num+"' WHERE uname='"+uname+"' AND acc_no = "+accno+" AND isnew = 'YES'";
			update = BankCommons.update(sql_up);
		}
		String sql = "INSERT INTO tx_details (uname, acc_no, operation, amt, balance, time1, isnew,Destination,T_ID ) VALUES ('"+uname+"',"+accno+",'DEPOSITE',"+amt+","+bal+", '"+date+"', 'YES','"+msg+"','"+num+"' )";
		//System.out.println(sql);
		 update = BankCommons.update(sql);
		 
		 Connection con=BankCommons.prepareConn();
			try {
				Statement sts=con.createStatement();
				ResultSet rs=sts.executeQuery("select * from tblaccountbank where UserName='"+uname+"' AND Accountno = '"+accno+"'");
				if(rs.next())
				{
					String sql_up = "UPDATE tblaccountbank SET Amount_Account ='"+bal+"' WHERE UserName='"+uname+"' AND Accountno = '"+accno+"'";
					update = BankCommons.update(sql_up);
					
				}
			}catch(Exception e)
			{
				System.out.println(e);
				
			}
		 
		 
		if(update==1)
		{
		pw.println("<script> alert('Amount Deposite Successfuly');</script>");
		RequestDispatcher rd = request.getRequestDispatcher("/HomePage.jsp");
		rd.include(request, response);
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("/deposite.jsp");
			rd.include(request, response);	
		}
	}

}
