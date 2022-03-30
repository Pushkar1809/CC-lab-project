<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User reports</title>
</head>
<body style="display:flex: justify-content: center; align-items:center; text-align:center;">
	<% 
		if(session.getAttribute("username")==null){
			response.sendRedirect("login.jsp");
		}
	
	%>
	
	<div><h1>Hello ${username}</h1>
	<form action="logout" method="post">
		<input type="submit" value="logout"/>
	</form>
	
	<Table>
	<%
	try
    {
		Class.forName("com.mysql.cj.jdbc.Driver");
      //registering type4 driver of oracle
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Employees","root","");   
		Statement stmt=con.createStatement();
		 String q1="select * from employeeBasicInfo;";
		  System.out.println(q1);
		        ResultSet rs=stmt.executeQuery(q1);
		        while(rs.next()){%>

		        	<tr>
		        	<td style="margin-right: 1rem;"><%=rs.getInt(1)%></td>
		        	<td style="margin-right: 1rem;"><%=rs.getString(2)%></td>
		        	<td style="margin-right: 1rem;"><%=rs.getString(3)%></td>
		        	<td style="margin-right: 1rem;"><%=rs.getString(4)%></td>
		        	<td><%=rs.getString(5)%></td>
		        	</tr>

		        	<%}
		      
		     con.close();
    }
   catch(Exception e){ 
      System.out.println(e);
   }%>
  </Table>
   		       
	<Table style="padding:1rem; border: 1px solid black;">
       <tr>
       		<th style="margin-right: 1rem;">Employee id</th>
       		<th style="margin-right: 1rem;">Job Role</th>
       		<th style="margin-right: 1rem;">Monthly Salary</th>
       		<th style="margin-right: 1rem;">Yearly Salary</th>
       		<th>Total Salary</th>
       </tr>
	<%
	try
    {
		Class.forName("com.mysql.cj.jdbc.Driver");
      //registering type4 driver of oracle
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Employees","root","");   
		Statement stmt=con.createStatement();
		 String q1="select * from employeeJobInfo;";
		  System.out.println(q1);
		        ResultSet rs=stmt.executeQuery(q1);
		        while(rs.next()){%>

		        	<tr>
		        	<td><%=rs.getInt(1)%></td>
		        	<td><%=rs.getString(2)%></td>
		        	<td><%=rs.getString(3)%></td>
		        	<td><%=rs.getString(4)%></td>
		        	<td><%=Integer.parseInt(rs.getString(3))*12+Integer.parseInt(rs.getString(4))%></td>
		        	</tr>

		        	<%}
		      
		     con.close();
    }
   catch(Exception e){ 
      System.out.println(e);
   }%>
   </Table>
	</div>
	
		
	<form action="update" method="POST" style="padding: 1rem; width: 60ch; display:flex; flex-direction: column; align-items: center; justify-content: center; margin-top: 20ch; margin-left: 30ch;">
    	Employee ID:<input type="text" name="employee_id" style="display:block; width: 80%; padding: 0.75rem; font-size: 1rem;"/><br/>
    	First Name:<input type="text" name="first_name" style="display:block; width: 80%; padding: 0.75rem; font-size: 1rem;"/><br/>
    	Last Name:<input type="text" name="last_name" style="display:block; width: 80%; padding: 0.75rem; font-size: 1rem;"/><br/>
    	Date of birth<input type="date" name="dob" style="display:block; width: 80%; padding: 0.75rem; font-size: 1rem; cursor: pointer"/><br/>
    	E-mail: <input type="text" name="email" style="display:block; width: 80%; padding: 0.75rem; font-size: 1rem;"/><br/>
    	Job Role:<input type="text" name="job_role" style="display:block; width: 80%; padding: 0.75rem; font-size: 1rem;" /><br/>
    	Monthly Salary:<input type="text" name="monthly_salary" style="display:block; width: 80%; padding: 0.75rem; font-size: 1rem;"/><br/>
    	Yearly Bonus:<input type="text" name="yearly_bonus" style="display:block; width: 80%; padding: 0.75rem; font-size: 1rem;"/><br/>
    <input type="submit" value="update" id = 'update' style="display:block; width: 80%; padding: 0.5rem; font-size: 1.2rem; border: none; background-color: salmon; color: white; cursor: pointer;">
    
    </form>
	
</body>
<style>
	body {
		font-family: sans-serif;
		display:flex;
		flex-direction: colunm;
		justify-content: center;
		align-items: center
	}
</style>
</html>