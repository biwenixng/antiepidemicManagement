package cn.itcast.dao.impl;
import cn.itcast.domain.*;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Connection;
import java.util.List;

@Repository
public class UserDao1 {

	public boolean forWord(Connection con,Forward forward) {
//		PreparedStatement ps = null;
//		boolean isFlag = false;
//		String sql = "INSERT INTO a_forward (duser,auser,appointtime,appointmenttime,phone)VALUES(?,?,?,?,?)";
//		try {
//			ps = conn.prepareStatement(sql);
//			ps.setObject(1, forward.getDuser());
//			ps.setObject(2, forward.getAuser());
//			ps.setObject(3, forward.getAppointTime());
//			ps.setObject(4, forward.getAppointmentTime());
//			ps.setObject(5, forward.getPhone());
//
//			int executeUpdate = ps.executeUpdate();
//			if(executeUpdate > 1) {
//				isFlag = false;
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBUtils.release(null, ps, null);
//		}
//		return isFlag;
		return true;
	}

	public List<AUserLogin> userLogin() {
//		sql.append("SELECT `username`,`password`,`idnumber`,`phone` FROM `a_user`");
	return null;
	}
	
	public String getName(Connection con, String name) {
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		String sql = "SELECT `name` FROM a_user WHERE username=?";
//		String name2 = "";
//
//		try {
//			ps = con.prepareStatement(sql);
//			ps.setString(1, name);
//			rs = ps.executeQuery();
//			while(rs.next()) {
//				name2 = rs.getString("name");
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//
//		return name2;
		return null;
	}

	public List<AUserLogin2> userLogin2() {
//		Connection con = getConnection();
//		StringBuffer sql = new StringBuffer();
//		PreparedStatement pstm = null;
//		ResultSet rs = null;
//		List<AUserLogin2> login = null;
//		sql.append("SELECT `phone` FROM `a_user`");
//		try {
//			pstm = con.prepareStatement(sql.toString());
//			if (pstm.execute()) {
//				rs = pstm.executeQuery();
//				login = new ArrayList<AUserLogin2>();
//				while (rs.next()) {
//					AUserLogin2 list = new AUserLogin2();
//					list.setPhone(rs.getString("phone"));
//					login.add(list);
//				}
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) {
//					rs.close();
//				}
//				if (pstm != null) {
//					pstm.close();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//
//		}
//		System.out.println(login.size());
//		return login;
		return null;
	}

	public List<DUserLogin> doctorLogin() {
//		Connection con = getConnection();
//		StringBuffer sql = new StringBuffer();
//		PreparedStatement pstm = null;
//		ResultSet rs = null;
//		List<DUserLogin> login = null;
//		sql.append("SELECT `username`,`password`,`Show` FROM `d_user`");
//		try {
//			pstm = con.prepareStatement(sql.toString());
//			if (pstm.execute()) {
//				rs = pstm.executeQuery();
//				login = new ArrayList<DUserLogin>();
//				while (rs.next()) {
//					DUserLogin list = new DUserLogin();
//					list.setUsername(rs.getString("username"));
//					list.setPassword(rs.getString("password"));
//					list.setShow(rs.getString("Show"));
//					login.add(list);
//				}
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) {
//					rs.close();
//				}
//				if (pstm != null) {
//					pstm.close();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return login;
		return null;
	}

	public List<MUserLogin> adminLogin() {
//		Connection con = getConnection();
//		StringBuffer sql = new StringBuffer();
//		PreparedStatement pstm = null;
//		ResultSet rs = null;
//		List<MUserLogin> login = null;
//		sql.append("SELECT `username`,`password`, `Show`,`juisdiction` FROM `m_user`");
//		try {
//			pstm = con.prepareStatement(sql.toString());
//			if (pstm.execute()) {
//				rs = pstm.executeQuery();
//				login = new ArrayList<MUserLogin>();
//				while (rs.next()) {
//					MUserLogin list = new MUserLogin();
//					list.setUsername(rs.getString("username"));
//					list.setPassword(rs.getString("password"));
//					list.setShow(rs.getString("Show"));
//					list.setJuisdiction(rs.getString("juisdiction"));
//					login.add(list);
//				}
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) {
//					rs.close();
//				}
//				if (pstm != null) {
//					pstm.close();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return login;
		return null;
	}

	public List<School> findSchool() {
//		Connection con = getConnection();
//		StringBuffer sql = new StringBuffer();
//		PreparedStatement pstm = null;
//		ResultSet rs = null;
//		List<School> list = null;
//		sql.append(" SELECT * FROM `a_school`");
//		try {
//			pstm = con.prepareStatement(sql.toString());
//			rs = pstm.executeQuery();
//			list = new ArrayList<School>();
//			while (rs.next()) {
//				School k = new School();
//				k.setSchoolid(rs.getInt("schoolid"));
//				k.setSchoolname(rs.getString("Schoolname"));
//				list.add(k);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) {
//					rs.close();
//				}
//				if (pstm != null) {
//					pstm.close();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return list;
		return null;
	}

	public List<Floor> findFloor(String schoolname) {
//		Connection con = getConnection();
//		StringBuffer sql = new StringBuffer();
//		PreparedStatement pstm = null;
//		ResultSet rs = null;
//		List<Floor> list = null;
//		sql.append(" SELECT * FROM `a_floor`");
//		sql.append("WHERE schoolname = ?");
//		try {
//			pstm = con.prepareStatement(sql.toString());
//			pstm.setObject(1, schoolname);
//			rs = pstm.executeQuery();
//			list = new ArrayList<Floor>();
//			while (rs.next()) {
//				Floor k = new Floor();
//				k.setFloorid(rs.getInt("floorid"));
//				k.setSchoolname(rs.getString("schoolname"));
//				k.setFloorname(rs.getString("floorname"));
//				list.add(k);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) {
//					rs.close();
//				}
//				if (pstm != null) {
//					pstm.close();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return list;
		return null;
	}

	public List<Dormitory> findDormitory(String floorname) {
//		Connection con = getConnection();
//		StringBuffer sql = new StringBuffer();
//		PreparedStatement pstm = null;
//		ResultSet rs = null;
//		List<Dormitory> list = null;
//		sql.append(" SELECT * FROM `a_dormitory`");
//		sql.append("WHERE floorname = ?");
//		try {
//			pstm = con.prepareStatement(sql.toString());
//			pstm.setObject(1, floorname);
//			rs = pstm.executeQuery();
//			list = new ArrayList<Dormitory>();
//			while (rs.next()) {
//				Dormitory k = new Dormitory();
//				k.setDormitory(rs.getInt("dormitory"));
//				k.setDormitoryname(rs.getString("dormitoryname"));
//				k.setFloorname(rs.getString("floorname"));
//				list.add(k);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) {
//					rs.close();
//				}
//				if (pstm != null) {
//					pstm.close();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return list;
		return null;
	}
	
	

	public int userRegistered(AUserRegistered user) {
//		Connection con = getConnection();
//		StringBuffer sql = new StringBuffer();
//		PreparedStatement pstm = null;
//		int number = 0;
//		sql.append("INSERT INTO `a_user`(`username`,`password`,`residence`,`name`,`phone`,`idnumber`)");
//		sql.append("values(?,?,?,?,?,?)");
//		try {
//			pstm = con.prepareStatement(sql.toString());
//			pstm.setObject(1, user.getUsername());
//			pstm.setObject(2, user.getPassword());
//			pstm.setObject(3, user.getResidence());
//			pstm.setObject(4, user.getName());
//			pstm.setObject(5, user.getPhone());
//			pstm.setObject(6, user.getIdnumber());
//			number = pstm.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (pstm != null) {
//					pstm.close();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//
//		}
//		return number;
		return 0;
	}

	public List<AUserRegistered> userFindPassword1() {
//		Connection con = getConnection();
//		StringBuffer sql = new StringBuffer();
//		PreparedStatement pstm = null;
//		ResultSet rs = null;
//		List<AUserRegistered> user = null;
//		sql.append(" SELECT * FROM `a_user`");
//		try {
//			pstm = con.prepareStatement(sql.toString());
//			rs = pstm.executeQuery(sql.toString());
//			user = new ArrayList<AUserRegistered>();
//			while (rs.next()) {
//				AUserRegistered k = new AUserRegistered();
//				k.setUsername(rs.getString("username"));
//				k.setPassword(rs.getString("password"));
//				k.setName(rs.getString("name"));
//				k.setPhone(rs.getString("phone"));
//				k.setIdnumber(rs.getString("idnumber"));
//				k.setResidence(rs.getString("residence"));
//				user.add(k);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) {
//					rs.close();
//				}
//				if (pstm != null) {
//					pstm.close();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return user;
		return null;
	}

	public int userFindPassword2(String phone, String pwd) {
//		Connection con = getConnection();
//		StringBuffer sql = new StringBuffer();
//		PreparedStatement pstm = null;
//		sql.append("UPDATE `a_user` SET `password` = ?");
//		sql.append(" WHERE `phone` = ?");
//		int number = 0;
//		try {
//			pstm = con.prepareStatement(sql.toString());
//			pstm.setObject(1, pwd);
//			pstm.setObject(2, phone);
//			number = pstm.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (pstm != null) {
//					pstm.close();
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return number;
		return 0;
	}
}
