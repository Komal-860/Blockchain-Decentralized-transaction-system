package com.onlinebank;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;


public class Dbconn {
	public static int blockchain1msg=0,blockchain2msg=0,blockchain3msg=0,blockchain4msg=0;
	public static String cid=null,c_Name=null,cp_Name=null,eid=null,CVoter=null,BlockData=null;
	public static	Map<String,Integer> step1 = new HashMap();
	public static String PrevHash1=null,PrevHash2=null,PrevHash3=null,PrevHash4=null;
	
	   public Dbconn() throws SQLException {
        super();
       }
	   public static Connection conn1() throws SQLException, ClassNotFoundException {
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blockchain1", "root", "");

			return (con);

		}
		public static Connection conn2() throws SQLException, ClassNotFoundException {
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blockchain2", "root", "");

			return (con);

		}
		public static Connection conn3() throws SQLException, ClassNotFoundException {
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blockchain3", "root", "");

			return (con);

		}
		public static Connection conn4() throws SQLException, ClassNotFoundException {
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blockchain4", "root", "");

			return (con);

		}

}
