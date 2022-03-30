package com.pushkar;

import java.io.IOException;
import java.sql.*;
//import com.mysql.cj.jdbc.Driver;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/signup")
public class Signup extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
		
	   
		String employee_id = req.getParameter("employee_id");
		String first_name = req.getParameter("first_name");
		String last_name = req.getParameter("last_name");
		String dob = req.getParameter("dob");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
	   try
	      {
		   	Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Employees","root","");  
			Statement stmt = con.createStatement();
			String q1="INSERT INTO `employeeBasicInfo` (`employee_id`, `fName`, `lName`, `dob`, `email`, `pass`) VALUES ('"+employee_id+"', '"+first_name+"', '"+last_name+"', '"+dob+"', '"+email+"', '"+password+"');";
			int rs = stmt.executeUpdate(q1);
			if(rs>0) {
				System.out.println("Insert success");
			    res.sendRedirect("login.jsp");  
			}
			else {
				System.out.println("Insert unsuccess");   
				res.sendRedirect("error.jsp");
				System.out.println("in try of Signup.java");
			}
			con.close();
	     }
	     catch(Exception e){ 
	        System.out.println(e);
	        res.sendRedirect("error.jsp");
	        System.out.println("in Signup.java");
	     }
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException{
		res.sendRedirect("login.jsp");
	}
	
}
