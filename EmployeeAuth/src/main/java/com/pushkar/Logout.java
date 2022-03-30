package com.pushkar;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException{
		
		HttpSession session = req.getSession();
		session.removeAttribute("username");
		session.removeAttribute("id");
		session.invalidate();
		res.sendRedirect("logout.jsp");
	  
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException{
		res.sendRedirect("login.jsp");
//		 System.out.println("in Login.java");
	}
	
}
