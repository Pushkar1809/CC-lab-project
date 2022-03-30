<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	  
	 <div style="width: 50ch; display:flex: flex-direction: column; justify-content: center; align-items:center; padding: 2rem; text-align:center;">
	 
		<h1>Employee Login</h1> 
		 
		<hr><br>
	
		<form action="login" method="post" style="display:flex; flex-direction: column; justify-content:center; align-items: center;">
			Employee ID: <input type="Text" name="username" style="display:block; width: 80%; padding: 0.75rem; font-size: 1.25rem;"/><br>
			Password: <input type="password" name="password" style="display:block; width: 80%; padding: 0.75rem; font-size: 1.25rem;"/><br>
			<input id="login" type="submit" value="Login" style="display:block; width: 80%; padding: 0.5rem; font-size: 1.2rem; border: none; background-color: salmon; color: white; cursor: pointer;"/>
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