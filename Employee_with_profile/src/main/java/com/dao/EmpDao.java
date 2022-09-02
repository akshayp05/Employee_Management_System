package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Employee;

public class EmpDao {

	private Connection con;

	public EmpDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean addEmp(Employee emp) {

		boolean f = false;
		try {
			String sql = "INSERT INTO employee_table(name,gender,date_of_birth,hobbies,address_1,address_2,city,state,pin_code,pancard_no,ptofile) values(?,?,?,?,?,?,?,?,?,?,?)";
			System.out.println(emp.getProfile());

			System.out.println("add emp	");

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, emp.getName());
			ps.setString(2, emp.getGender());
			ps.setString(3, emp.getDate_of_birth());
			ps.setString(4, emp.getHobbies());
			ps.setString(5, emp.getAddress_1());
			ps.setString(6, emp.getAddress_2());
			ps.setString(7, emp.getCity());
			ps.setString(8, emp.getState());
			ps.setString(9, emp.getPin_code());
			ps.setString(10, emp.getPancard_no());
			ps.setString(11, emp.getProfile());

			int i = ps.executeUpdate();

			if (i == 1) {

				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Employee> showAllEmp() {
		List<Employee> list = new ArrayList<>();
		Employee emp = null;
		try {
			String sql_all = "select * from employee_table";
			PreparedStatement ps = con.prepareStatement(sql_all);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				emp = new Employee();
				emp.setId(rs.getInt(1));
				emp.setName(rs.getString(2));
				emp.setGender(rs.getString(3));
				emp.setDate_of_birth(rs.getString(4));
				emp.setHobbies(rs.getString(5));
				emp.setAddress_1(rs.getString(6));
				emp.setAddress_2(rs.getString(7));
				emp.setCity(rs.getString(8));
				emp.setState(rs.getString(9));
				emp.setPin_code(rs.getString(10));
				emp.setPancard_no(rs.getString(11));
				emp.setProfile(rs.getString(12));

				list.add(emp);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Employee EmpGetById(int id) throws ClassNotFoundException {
		Employee emp = null;

		try {
			String sql_id = "select * from employee_table where id =?";

			PreparedStatement ps = con.prepareStatement(sql_id);
			ps.setInt(1, id);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				emp = new Employee();
				emp.setId(rs.getInt(1));
				emp.setName(rs.getString(2));
				emp.setGender(rs.getString(3));
				emp.setDate_of_birth(rs.getString(4));
				emp.setHobbies(rs.getString(5));
				emp.setAddress_1(rs.getString(6));
				emp.setAddress_2(rs.getString(7));
				emp.setCity(rs.getString(8));
				emp.setState(rs.getString(9));
				emp.setPin_code(rs.getString(10));
				emp.setPancard_no(rs.getString(11));
				emp.setProfile(rs.getString(12));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return emp;

	}

	public boolean updateEmp(Employee emp) {
		boolean f = false;

		try {
			String sql_up = "update employee_table set name=?,gender=?,date_of_birth=?,hobbies=?,address_1=?,address_2=?,city=?,state=?,pin_code=?,pancard_no=?,ptofile=? where id = ?";

			PreparedStatement ps = con.prepareStatement(sql_up);
			ps.setString(1, emp.getName());
			ps.setString(2, emp.getGender());
			ps.setString(3, emp.getDate_of_birth());
			ps.setString(4, emp.getHobbies());
			ps.setString(5, emp.getAddress_1());
			ps.setString(6, emp.getAddress_2());
			ps.setString(7, emp.getCity());
			ps.setString(8, emp.getState());
			ps.setString(9, emp.getPin_code());
			ps.setString(10, emp.getPancard_no());
			ps.setString(11, emp.getProfile());
			ps.setInt(12, emp.getId());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			f = false;
		}
		return f;
	}

	public boolean deleteEmp(int id) {
		boolean f = false;
		try {
			String sql_delete = "delete from employee_table where id = ?";
			PreparedStatement ps = con.prepareStatement(sql_delete);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
