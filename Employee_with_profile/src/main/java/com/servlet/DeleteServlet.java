package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBconnect;
import com.dao.EmpDao;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		try {
			EmpDao d = new EmpDao(DBconnect.getConnection());
			boolean f = d.deleteEmp(id);
			HttpSession session = req.getSession();

			if (f) {

				session.setAttribute("succMsg", "Employee data Deleted sucsessfully...");
				resp.sendRedirect("home.jsp");
			} else {
				session.setAttribute("errorMsg", "Somthing wrong on server...");
				resp.sendRedirect("home.jsp");

			}
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
