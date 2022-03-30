package com.pushkar;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update")
public class Update extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
		
		String employee_id = req.getParameter("employee_id");
		String first_name = req.getParameter("first_name");
		String last_name = req.getParameter("last_name");
		String dob = req.getParameter("dob");
		String email = req.getParameter("email");
		String job_role = req.getParameter("job_role");
		String monthly_salary = req.getParameter("monthly_salary");
		String yearly_bonus = req.getParameter("yearly_bonus");
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
	        //registering type4 driver of oracle
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Employees","root","");  
			Statement stmt=con.createStatement();
			String q1 = "UPDATE `employeeBasicInfo` SET `employee_id`='"+employee_id+"',`fName`='"+first_name+"',`lName`='"+last_name+"',`dob`='"+dob+"',`email`='"+email+"' WHERE employee_id = '"+employee_id+"';";
			String q2 = "SELECT * FROM `employeejobInfo` WHERE `employee_id`= '"+employee_id+"';";
			ResultSet rs2 = stmt.executeQuery(q2);
			String q3;
			if(rs2.next()) {
				q3="UPDATE `employeeJobinfo` SET `job_role`='"+job_role+"',`montly_salary`='"+monthly_salary+"',`yearly_bonus`='"+yearly_bonus+"' WHERE employee_id='"+employee_id+"';";
				
			}else {
				q3 = "INSERT INTO `employeeJobInfo`(`employee_id`, `jobTitle`, `salary`, `bonus`) VALUES ('"+employee_id+"','"+job_role+"','"+monthly_salary+"','"+yearly_bonus+"');";
				
			}
			System.out.println(q3);
			int rs3 = stmt.executeUpdate(q3);
			int rs=stmt.executeUpdate(q1);
			        if(rs>0 && rs3>0){
			        	res.sendRedirect("report.jsp");
			        }
			       else
			       {
//			    	   res.sendRedirect("error.jsp");
			    	   System.out.println("in Login.java");
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
