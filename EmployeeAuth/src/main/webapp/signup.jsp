<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User | Signup Basic</title>
</head>
<body>

	<div style="width: 50ch; display:flex: flex-direction: column; justify-content: center; align-items:center; padding: 2rem; text-align:center;">
	<h1>Employee Signup</h1>
	<hr/><br/>
	<form action="signup" method="POST" style="display:flex; flex-direction: column; justify-content:center; align-items: center;">
    Employee ID:<input type="text" name="employee_id" style="display:block; width: 80%; padding: 0.75rem; font-size: 1.25rem;"/><br>
    First Nam:e<input type="text" name="first_name" style="display:block; width: 80%; padding: 0.75rem; font-size: 1.25rem;"/><br>
    Last Name:<input type="text" name="last_name" style="display:block; width: 80%; padding: 0.75rem; font-size: 1.25rem;"/><br>
    Date of Birth:<input type="date" name="dob" style="display:block; width: 80%; padding: 0.75rem; font-size: 1.25rem; cursor: pointer"/><br>
    E-mail:<input type="text" name="email" style="display:block; width: 80%; padding: 0.75rem; font-size: 1.25rem;"/><br>
    Password:<input type="password" name="password" style="display:block; width: 80%; padding: 0.75rem; font-size: 1.25rem;"/><br>
    <input type="submit" value="signup" id="signup" style="display:block; width: 80%; padding: 0.5rem; font-size: 1.2rem; border: none; background-color: salmon; color: white; cursor: pointer;">
</form>
	</div>

	
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