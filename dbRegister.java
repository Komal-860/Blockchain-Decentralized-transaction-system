package com.userinfo;

import java.io.File; 
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.Part;
import com.onlinebank.BankCommons;


@WebServlet("/dbRegister")
public class dbRegister extends HttpServlet {
	static Connection con;
	//final String UPLOAD_DIRECTORY = "D:/NewWorkspace/E-Nursery/WebContent/products/";
	final String UPLOAD_DIRECTORY = "E:/JavaPro2/Bank_Application new/WebContent/upload/";
	static int i = 0;
	
	public void init(ServletConfig config) throws ServletException 
	{
		try 
		{
			//con=ConnectionProvider.getConnection();
			con=BankCommons.prepareConn();
		} 
		catch (Exception e) 
		{
			System.out.println("Exception "+e);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) 
		{
			try 
			{
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				System.out.println("ABCD");
				String FileName = "";
				String FileExtention = "";
				long FileSize = 0;

				for (FileItem item1 : multiparts)
				{
					if (!item1.isFormField()) 
					{

						System.out.println("4");
						String name = new File(item1.getName()).getName();
						item1.write(new File(UPLOAD_DIRECTORY + File.separator+name));
						FileName = item1.getName();
						FileExtention = item1.getContentType();
						FileSize = item1.getSize();
					}
				}
								
				String uname="",password="",question="",answer="",email="",dob="";
				String gender="",bloodGroup="",mobile="",altContact="",address="",resAddress="";
				
				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("uname"))
					{
						uname = (String) item.getString();
					}
				}

				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("password"))
					{
						password = (String) item.getString();
					}
				}

				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("question")) 
					{
						question = (String) item.getString();
					}
				}

				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("answer")) 
					{
						answer = (String) item.getString();
					}
				}

				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("email")) 
					{
						email = (String) item.getString();
					}
				}
				
				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("dob")) 
					{
						dob = (String) item.getString();
					}
				}
				////////////////////////////
				//String gender="",bloodGroup="",mobile="",altContact="",altContact="",resAddress="";
				
				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("gender"))
					{
						gender = (String) item.getString();
					}
				}

				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("bloodGroup"))
					{
						bloodGroup = (String) item.getString();
					}
				}

				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("mobile")) 
					{
						mobile = (String) item.getString();
					}
				}

				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("address")) 
					{
						address = (String) item.getString();
					}
				}
				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("resAddress")) 
					{
						resAddress = (String) item.getString();
					}
				}
				for (FileItem item : multiparts)
				{
					if ((item.getFieldName()).equals("altContact")) 
					{
						altContact = (String) item.getString();
					}
				}

				
				
				
				System.out.println("FileName " + FileName);
				System.out.println("File Extension " + FileExtention);
				System.out.println("File Size " + FileSize);

				//HttpSession session=request.getSession();
				//String email_id=session.getAttribute("email").toString();
				
				DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
				Date dateobj = new Date();
				String c_date = df.format(dateobj);
				System.out.println("C Date " + c_date);
				
				try 
				{
					String sec_question = null;
					//PreparedStatement ps1 = con.prepareStatement("INSERT INTO `product_details`(`category`, `p_name`, `specification`, `file_name`, `base_price`, `mfg_date`, `exp_date`,`upload_by`) VALUES ('"+category+"','"+p_name+"','"+specification+"','"+FileName+"','"+base_price+"','"+mfg_date+"','"+exp_date+"','Admin')");
					PreparedStatement ps1 = con.prepareStatement("INSERT INTO user_details (uname, password, sec_question, answer, address, email, mobile, dob, gender,bloodgroup, alternatecontact, resAddress, FileName ) "
					+ "VALUES ('"+uname+"','"+password+"','"+question+"','"+answer+"','"+address+"','"+email+"','"+mobile+"','"+dob+"','"+gender+"','"+bloodGroup+"','"+altContact+"','"+resAddress+"','"+FileName+"' )");
					System.out.println("Query: "+ps1);
					int rs = ps1.executeUpdate();
					if (rs > 0) 
					{
						System.out.println("Product Add Done ");
						response.sendRedirect("index.jsp?register");
					} else 
					{
						System.out.println("Product Not Insert Something Wrong ");
						response.sendRedirect("register.jsp?fail");
					}
				} 
				catch (Exception e) 
				{
					System.out.println("Exception e" +e);
				}
			}
			catch (Exception ex) {
				System.out.println("Exception e" +ex);
			}
		}
		else 
		{
			System.out.println("Condition False");
			response.sendRedirect("SignUp1.jsp?fail=uplaod");
		}
	}

}

/*import java.io.IOException;
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
import javax.servlet.http.HttpSession;

import javax.servlet.http.Part;
import com.onlinebank.BankCommons;

@WebServlet("/dbRegister")
public class dbRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Connection con = null;
	final String UPLOAD_DIRECTORY = "E:\\JavaPro2\\Bank_Application new\\WebContent\\upload";
	String area;
	String uploadedby;
   
    public dbRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession(false);
		String uname = request.getParameter("txtname");
		String password = request.getParameter("txtpwd");
		String question = request.getParameter("question");
		String answer = request.getParameter("secanswer");
		String email = request.getParameter("txtemail");

		
		String dob=request.getParameter("txtdob");
		String gender = request.getParameter("gender");
		String bloodGroup = request.getParameter("txtbloodgroup");
		String mobile = request.getParameter("txtcontact");
		String altContact = request.getParameter("txtaltcontact");
		String address = request.getParameter("txtaddress");
		String resAddress = request.getParameter("txtresaddress");
		
		String aadhar = request.getParameter("fileaadhar");
		String pan = request.getParameter("filepan");
		String photo = request.getParameter("filephoto");


		
		String msg="0";
		if(password.endsWith(password))
		{
		//if(roll.equals("User"))
		//{
			
		String sqls = "SELECT * FROM user_details WHERE email ='"+email+"'";
		//System.out.println(sql);
		boolean ck = BankCommons.checkUser(sqls,session);
		System.out.println(ck);
		if(ck == true ){
			pw.println("<script> alert('AllReady Email-ID Existing');</script>");
			RequestDispatcher rd = request.getRequestDispatcher("/signup.html");
			rd.include(request, response);
		}else 
		{
			//tblaccountbank
			
		String sql = "INSERT INTO user_details (uname, password, sec_question, answer, address, email, mobile, dob, gender,bloodgroup, alternatecontact, resAddress, fileaadhar, filepan, filephoto ) "
				+ "VALUES ('"+uname+"','"+password+"','"+question+"','"+answer+"','"+address+"','"+email+"','"+mobile+"','"+dob+"','"+gender+"','"+bloodGroup+"','"+altContact+"','"+resAddress+"','"+aadhar+"','"+pan+"','"+photo+"')";
		String str="insert into otpcodetble(email,otpcode) values('"+email+"','"+msg+"')";
		int update = BankCommons.update(sql);
		BankCommons.update(str);
		
        // Get the file inputs from the request
        Part aadharPart = request.getPart("fileaadhar");
        Part panPart = request.getPart("filepan");
        Part photoPart = request.getPart("filephoto");		
		
        // Save the files to a specific directory on the server
        String uploadDir = "S:/uploads/";
        String aadharFileName = aadharPart.getSubmittedFileName();
        String panFileName = panPart.getSubmittedFileName();
        String photoFileName = photoPart.getSubmittedFileName();
        aadharPart.write(uploadDir + aadharFileName);
        panPart.write(uploadDir + panFileName);
        photoPart.write(uploadDir + photoFileName);		
		
		
		if(update==1)
		{
		pw.println("<script> alert(' Register Successfuly');</script>");
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
		rd.include(request, response);
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("/signup.html");
			rd.include(request, response);	
		}
		}
		}
		else
		{
			try {
			String sqls = "SELECT * FROM bank_details WHERE email ='"+email+"'";
			Connection con=BankCommons.prepareConn();
			Statement st;
			
				st = con.createStatement();
				Statement st1;
				
				st1 = con.createStatement();
			ResultSet rs=st.executeQuery(sqls);
			if(rs.next()){
				
				pw.println("<script> alert('AllReady Email-ID Existing');</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/signup.html");
				rd.include(request, response);
			}else 
			{
				String sql = "INSERT INTO bank_details (bname, bpass, sec_question, answer, address, email, mobile ) VALUES ('"+uname+"','"+password+"','"+question+"','"+answer+"','"+address+"','"+email+"','"+mobile+"')";
					st1.executeUpdate(sql);
					pw.println("<script> alert(' Register Successfuly');</script>");
					RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
					rd.include(request, response);
			}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		}
		else
		{
			pw.println("<script> alert('Password and Confirm Password Not Matched');</script>");	
			RequestDispatcher rd = request.getRequestDispatcher("/signup.html");
			rd.include(request, response);
		}
	}
}
*/