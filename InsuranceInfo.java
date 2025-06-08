package com.Insurance;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlinebank.BankCommons;

@WebServlet("/InsuranceInfo")
public class InsuranceInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       public static String Insurance_Company;
       public static String Police_Name;
       public static String Months;
       public static String Coverage_Msg;
       
    public InsuranceInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession(false);
		String[] id = request.getParameterValues("Checkbox");
		String uname=(String)session.getAttribute("cust_name");
		//(String)session.getAttribute("cust_name")
		String Email=(String)session.getAttribute("email");
		try {
			Connection con=BankCommons.prepareConn();
			for (String s : id) {
					
				Statement st = con.createStatement();
				String query1 = "select * from tblinsurance_details where id='"+ s + "'";
				System.out.println(query1);
				ResultSet rs1 = st.executeQuery(query1);
				if(rs1.next()) {
					
				PreparedStatement p1;
				String sql="insert into tblinsuranceinfo(UserName,UserEmail,Company_Name,Contact,WebSite,Policy_No,Policy_Name,Policy_Tenue,Base_Premium,Coverage_Info,Policy_Amount,Email_ID) values(?,?,?,?,?,?,?,?,?,?,?,?)";    
				p1=(PreparedStatement) con.prepareStatement(sql);
				p1.setString(1,uname);
				p1.setString(2,Email);
				p1.setString(3,rs1.getString("Company_Name"));
				p1.setString(4,rs1.getString("Contact"));
				p1.setString(5,rs1.getString("WebSite"));
				
				p1.setString(6,rs1.getString("Policy_No"));
				p1.setString(7,rs1.getString("Policy_Name"));
				p1.setString(8,rs1.getString("Policy_Tenue"));
				p1.setString(9,rs1.getString("Base_Premium"));
				p1.setString(10,rs1.getString("Coverage_Info"));
				p1.setString(11,rs1.getString("Policy_Amount"));
				p1.setString(12,rs1.getString("email"));
				p1.executeUpdate();
				
				/*PreparedStatement ps1;
				String sql1="insert into tblinfoinsuranceo(PatientName,PatientEmail,Insurance_Company,Police_Name,Months,Coverage_Msg) values(?,?,?,?,?,?)";    
				ps1=(PreparedStatement) con.prepareStatement(sql1);
				ps1.setString(1,PatientName);
				ps1.setString(2,PatientEmail);
				ps1.setString(3,rs1.getString("Company_Name"));
				ps1.setString(4,rs1.getString("Policy_Name"));
				ps1.setString(5,rs1.getString("Policy_Tenue"));
				ps1.setString(6,rs1.getString("Coverage_Info"));
				ps1.executeUpdate();*/
				
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		pw.println("<html><script>alert('Insurance Save Successfully');</script><body>");
		pw.println("");
		pw.println("</body></html>");
		//RequestDispatcher rd = request.getRequestDispatcher("/ShowInsurancePatient.jsp");
		//rd.include(request, response);
		response.sendRedirect("UserShowInsurance.jsp?Done");
	}
}
