package com.pushkar;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
	   try
	      {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Employees","root","");  
			Statement stmt = con.createStatement();
			String q1="select employee_id, pass from employeeBasicinfo where employee_id='"+username+"';";
			System.out.println(q1);
			ResultSet rs=stmt.executeQuery(q1);
			
			if(rs.next()) {
				System.out.println(rs.getString(2));
				if(rs.getString(2).equals(password)) {
	        		
					HttpSession session = req.getSession();
	        		session.setAttribute("username", username);
	        		session.setAttribute("id", rs.getInt(1));
	        		res.sendRedirect("report.jsp");
	        		
				} else {
	        		res.sendRedirect("login.jsp");
	        	}
	        }
			else {
				System.out.println("in Login.java");
				res.sendRedirect("login.jsp");
			}
			con.close();
		}
	   	catch(Exception e){ 
	        System.out.println(e);
	        System.out.println("in Login.java");
	     }
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException{
		res.sendRedirect("login.jsp");
	}
	
}
