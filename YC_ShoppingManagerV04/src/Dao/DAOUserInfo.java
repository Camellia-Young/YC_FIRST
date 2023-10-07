package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.UserInfo;
import DBUtil.DBHelper;

public class DAOUserInfo {

	public boolean Modify(Bean.UserInfo m) throws SQLException {
		boolean ret = false;
		String cmd = "UPDATE `test`.`tuserinfo` SET " + "`Account` = ?," + " `Password` = ?, " + "`Tel` = ?, "
				+ "`Address` = ?, " + "`Age` = ?, " + "`ImageUrl` = ?" + " WHERE `Account` =? ;";

		Connection conn = DBHelper.getConnection();
		PreparedStatement stmt = conn.prepareStatement(cmd);
		stmt.setString(1, m.getAccount());

		stmt.setString(2, m.getPassword());// 逻辑不合理
		stmt.setString(3, m.getTel());
		stmt.setString(4, m.getAddress());
		stmt.setInt(5, m.getAge());
		stmt.setString(6, m.getImageUrl());// 操作不合理
		stmt.setString(7, m.getAccount());

		ret = stmt.executeUpdate() == 1 ? true : false;

		return ret;
	}

	/**
	 * 删除账号
	 * 
	 * @param account
	 * @return
	 * @throws SQLException
	 */
	public boolean Delete(String account) throws SQLException {
		boolean ret = false;

		String cmd = "DELETE FROM `test`.`tuserinfo` WHERE `Account` = ? ;";
		Connection connection = DBHelper.getConnection();

		PreparedStatement stmt = connection.prepareStatement(cmd);
		stmt.setString(1, account);

		int r = stmt.executeUpdate();
		ret = r == 1 ? true : false;
		return ret;
	}

	/**
	 * 根据账号查询用户信息
	 * 
	 * @param account 账号
	 * @return 如果对应账号有值，返回该账号对应用户信息，否则返回空null
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public UserInfo Query(String account) throws ClassNotFoundException, SQLException {

		UserInfo m = null;

		String cmd = "SELECT 	`Account`, `Password`, `Tel`, `Address`, `Age`, `ImageUrl` FROM `test`.`tuserinfo` WHERE  `Account`=?";
		Connection connection = DBHelper.getConnection();

		PreparedStatement stmt = connection.prepareStatement(cmd);
		stmt.setString(1, account);

		ResultSet rs = stmt.executeQuery();

		boolean hasNext = rs.next();
		if (hasNext) {
			m = new UserInfo();
			m.setAccount(rs.getString(1));
			m.setPassword(rs.getString(2));
			m.setTel(rs.getString(3));
			m.setAddress(rs.getString(4));
			m.setAge(rs.getInt("Age"));
			m.setImageUrl(rs.getString("ImageUrl"));
		}

		return m;

	}

	/**
	 * 
	 * @param model
	 * @return
	 * @throws ClassNotFoundException
	 */
	public boolean Add(UserInfo model) throws ClassNotFoundException {
		Connection connection = null;

		int r = 0;
		try {
			connection = DBHelper.getConnection();
			String cmdString = "INSERT INTO `test`.`tuserinfo`"
					+ "(`Account`, `Password`, `Tel`, `Address`, 	`Age`, `ImageUrl`)" + "VALUES (?,?,?,?,?,?);";

			PreparedStatement stmt = connection.prepareStatement(cmdString);
			stmt.setString(1, model.getAccount());
			stmt.setString(2, model.getPassword());
			stmt.setString(3, model.getTel());
			stmt.setString(4, model.getAddress());
			stmt.setInt(5, model.getAge());
			stmt.setString(6, "");

			r = stmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

		}
		return r == 1 ? true : false;

	}
}
