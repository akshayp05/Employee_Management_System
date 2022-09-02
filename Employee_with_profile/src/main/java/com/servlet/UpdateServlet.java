package com.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.conn.DBconnect;
import com.conn.Helper;
import com.dao.EmpDao;
import com.model.Employee;
import com.model.Message;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB //
		maxFileSize = 1024 * 1024 * 50, // 50 MB
		maxRequestSize = 1024 * 1024 * 100)

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String date_of_birth = req.getParameter("date_of_birth");
		String hobbies = req.getParameter("hobbies");
		String address_1 = req.getParameter("address_1");
		String address_2 = req.getParameter("address_2");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		String pin_code = req.getParameter("pin_code");
		String pancard_no = req.getParameter("pancard_no");
		// String profile=req.getParameter("profile");

		int id = Integer.parseInt(req.getParameter("id"));

		Part file = req.getPart("profile");

		String profile = file.getSubmittedFileName().replace(" ", "_"); // get selected image file name

		System.out.println("Selected Image File Name : " + profile);

		String uploadPath = "C:/Users/admin/Desktop/java/Employee_with_profile/src/main/webapp/pics/" + profile; // upload
																													// actual
																													// image
		System.out.println("Upload Path : " + uploadPath);

		try {

			FileOutputStream fos = new FileOutputStream(uploadPath);
			InputStream is = file.getInputStream();

			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();

			Employee emp = new Employee(id, name, gender, date_of_birth, hobbies, address_1, address_2, city, state,
					pin_code, pancard_no, profile);

			String oldFile = "";
			emp.setProfile(profile);

			EmpDao d = new EmpDao(DBconnect.getConnection());
			HttpSession session = req.getSession();
			String path = "C:/Users/admin/Desktop/java/Employee_with_profile/src/main/webapp/pics/";
			if (file != null) {
				Employee e = d.EmpGetById(id);

				oldFile = e.getProfile();
			}

			boolean f = d.updateEmp(emp);

			if (f) {

				String filePath = path + emp.getProfile();
				String pathOldFile = path + oldFile;

				if (!oldFile.equals("default.png")) {
					Helper.deleteFile(pathOldFile);
				} 
					 		
				session.setAttribute("succMsg", "Employee data updated sucsessfully...");
				resp.sendRedirect("view.jsp?id=" + id);
			} else {
				session.setAttribute("errorMsg", "Somthing wrong on server...");
				resp.sendRedirect("view.jsp?id=" + id);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
