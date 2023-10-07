package DBUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import Bean.UserInfo;

/**
 * Êý¾Ý¿â¸¨ÖúÀà
 * 
 * @author Administrator
 *
 */
public class DBHelper {
	static {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException {
		Connection connection = null;
		String user = "root";
		String password = "123456";
		UserInfo m = null;

		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", user, password);

		return connection;
	}
}
