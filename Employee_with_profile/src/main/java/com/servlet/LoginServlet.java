package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBconnect;
import com.model.Message;

@MultipartConfig
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");

		try (PrintWriter out = response.getWriter()) {

			String userEmail = request.getParameter("email");
			String userPassword = request.getParameter("password");

			Connection con = DBconnect.getConnection();
			boolean f = false;
			PreparedStatement ps = con.prepareStatement("select * from admin where email=? and password=?");
			ps.setString(1, userEmail);
            ps.setString(2, userPassword);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				HttpSession s = request.getSession();
				s.setAttribute("currentUser", f);
				response.sendRedirect("home.jsp");
				
				s.setAttribute("loginStatus", true);
				
            }else {
             
              	Message msg = new Message("User name and password is incorrect", "error", "alert-danger");
				HttpSession s = request.getSession();
				s.setAttribute("msg", msg);

				response.sendRedirect("login.jsp");

			}

			

		} catch (Exception e) {
			
			Message msg = new Message("Invalid Details ! try with another", "error", "alert-danger");
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);

			response.sendRedirect("login.jsp");

			e.printStackTrace();

		}

	}

}

/*
 * response.setContentType("text/html");
 * 
 * try (PrintWriter out = response.getWriter()) {
 * 
 * String email = request.getParameter("email"); System.out.println(email);
 * String password = request.getParameter("password");
 * System.out.println(password);
 * 
 * HttpSession s = request.getSession(); s.setAttribute("email", email);
 * 
 * Connection con = DBconnect.getConnection(); boolean f = false;
 * PreparedStatement ps =
 * con.prepareStatement("select * from admin where email=? and password=?");
 * 
 * ps.setString(1, email);
 * 
 * ps.setString(2, password); ResultSet rs; rs = ps.executeQuery(); if
 * (rs.next()) {
 * 
 * if (email.equals(email) && password.equals(password)) {
 * 
 * HttpSession s1 = request.getSession(); s1.setAttribute("f", true); f = true;
 * 
 * if (f) {
 * 
 * s1.setAttribute("succMsg", "Login succses...");
 * response.sendRedirect("home.jsp"); }
 * 
 * } } else { RequestDispatcher re = request.getRequestDispatcher("login.jsp");
 * out.println("<script>alert('please enter valid email and password')</script>"
 * ); re.include(request, response); f = false; }
 * 
 * } catch (Exception e) {
 * 
 * e.printStackTrace();
 * 
 * }
 * 
 * }
 * 
 * }
 */
