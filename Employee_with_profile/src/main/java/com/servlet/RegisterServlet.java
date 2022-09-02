package com.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.conn.DBconnect;
import com.dao.EmpDao;
import com.model.Employee;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB //
		maxFileSize = 1024 * 1024 * 50, // 50 MB
		maxRequestSize = 1024 * 1024 * 100)

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String date_of_birth = req.getParameter("date_of_birth");
		String[] hobbie = req.getParameterValues("hobbies");
		String hobbies = "";
		for (int i = 0; i < hobbie.length; i++) {
			hobbies += hobbie[i] + ",";
		}
		String address_1 = req.getParameter("address_1");
		String address_2 = req.getParameter("address_2");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		String pin_code = req.getParameter("pin_code");
		String pancard_no = req.getParameter("pancard_no");
		// String profile= req.getParameter("profile");

		Part file = req.getPart("profile");

		String profile = file.getSubmittedFileName().replace(" ", "_"); // get selected image file name

		System.out.println("Selected Image File Name : " + profile);

		String uploadPath = "C:/Users/admin/Desktop/java/Employee_with_profile/src/main/webapp/pics/" + profile; // upload
		System.out.println("Upload Path : " + uploadPath);

		try {

			FileOutputStream fos = new FileOutputStream(uploadPath);
			InputStream is = file.getInputStream();

			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();

		}

		catch (Exception e) {
			e.printStackTrace();
		}

		Employee emp = new Employee(name, gender, date_of_birth, hobbies, address_1, address_2, city, state, pin_code,
				pancard_no, profile);

		emp.setProfile(profile);

		try {
			EmpDao d = new EmpDao(DBconnect.getConnection());
			HttpSession session = req.getSession();

			boolean f = d.addEmp(emp);

			if (f) {

				session.setAttribute("succMsg", "Employee data add sucsessfully...");
				resp.sendRedirect("add_emp.jsp");
			} else {
				session.setAttribute("errorMsg", "Somthing wrong on server...");
				resp.sendRedirect("add_emp.jsp");

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
