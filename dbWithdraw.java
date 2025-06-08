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
import javax.servlet.http.HttpSession;

import mail.SendKeyMail;

import com.onlinebank.BankCommons;

/**
 * Servlet implementation class dbWithdraw
 */
@WebServlet("/dbWithdraw")
public class dbWithdraw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dbWithdraw() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	public String otpcode() 
	{
	
		char[] chars = "1234567890".toCharArray();
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < 4; i++) 
		{
		    char c = chars[random.nextInt(chars.length)];
		    sb.append(c);
		}
		String output = sb.toString();
		return output;/*
		
		StringBuilder ss = new StringBuilder();
		Random r = new Random();
		char ch;

		for (int i = 0; i < 5; i++) 
		{
			ch = (char) (Math.floor(26 * r.nextDouble() + 65));
			ss.append(ch);
		}

		return ss.toString();
*/
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("dbwithdraw dopost");
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession(false);
		String op = "WITHDRAW";
		String date = (new java.util.Date()).toString();
		String uname = request.getParameter("uname");
		int accno = Integer.parseInt(request.getParameter("accNo"));
		int amt = Integer.parseInt(request.getParameter("Amount"));
		session.setAttribute("uname", uname);
		session.setAttribute("accno", String.valueOf(accno));
		session.setAttribute("amt", String.valueOf(amt));
		String email=(String)session.getAttribute("email");
		Connection con=BankCommons.prepareConn();

		String otpcodes=otpcode();
		System.out.println("OTP Code "+otpcodes);
		
		session.setAttribute("otpcodes", otpcodes);
		
		//SendKeyMail.SendOTP(email,otpcodes);
		Statement st;
		try {
			
			st = con.createStatement();
		ResultSet rs=st.executeQuery("select * from withdrawotpcode where email='" +email+ "'");
		if(rs.next())
		{
			
			String str="update withdrawotpcode set otpcode='"+otpcodes+"' where email='" +email+ "'";
			Statement sst=con.createStatement();
			sst.executeUpdate(str);
		}
		else
		{
			String str="insert into withdrawotpcode values('"+email+"','"+otpcodes+"')";
			Statement sst=con.createStatement();
			sst.executeUpdate(str);
		}
		}
		catch(Exception e)
		{
			System.out.println(e);
			
		}
		response.sendRedirect("OTPCode.jsp?id=1");
//		String msg="self";
//		Random generator = new Random();
//		int num = generator.nextInt(99999) + 99999;
//		String bal_sql = "SELECT balance FROM tx_details WHERE uname='"+uname+"' AND acc_no = "+accno+" AND isnew = 'YES'";
//		//System.out.println(bal_sql);
//		int bal1=0;
//		int update=0;
//		int bal = BankCommons.getBalance(bal_sql);
//		if(bal == 0){
//			System.out.println("Current Balance : "+bal);
//			pw.println("<script> alert('Your Account Balance is Zero');</script>");
////			response.sendRedirect("noBal.jsp");
//			RequestDispatcher rd = request.getRequestDispatcher("/noBal.jsp");
//			rd.include(request, response);
//		}else if(bal < amt){
//			pw.println("<script> alert('Your Account have not Sufficient Balance');</script>");
//			//response.sendRedirect("noBal.jsp");
//			RequestDispatcher rd = request.getRequestDispatcher("/noBal.jsp");
//			rd.include(request, response);
//		}else {
//			bal1 = bal - amt;
//			//System.out.println("Withdraw : "+bal1);
//			String sql_up = "UPDATE tblaccountbank SET Amount_Account ='"+bal1+"' WHERE UserName='"+uname+"' AND Accountno = '"+accno+"'";
//			update = BankCommons.update(sql_up);
//			String sql = "INSERT INTO tx_details (uname, acc_no, operation, amt, balance, time1, isnew,Destination,T_ID ) VALUES ('"+uname+"',"+accno+",'WITHDRAW',"+amt+","+bal1+", '"+date+"', 'YES','"+msg+"','"+num+"')";
//			//System.out.println(sql);
//			update = BankCommons.update(sql);
//			
//			
//		}
//		
//		if(update==1)
//		{
//		pw.println("<script> alert('Amount WithDraw Successfully');</script>");
//		RequestDispatcher rd = request.getRequestDispatcher("/HomePage.jsp");
//		rd.include(request, response);
//		}
//		else
//		{
//			RequestDispatcher rd = request.getRequestDispatcher("/withdraw.jsp");
//			rd.include(request, response);	
//		}
		
	}

}
