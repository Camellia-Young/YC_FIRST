package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import Bean.UserInfo;
import Dao.DAOUserInfo;

/**
 * Servlet implementation class UserInfoModifyServlet
 */
@WebServlet("/UserInfoModifyServlet")
public class UserInfoModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserInfoModifyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		// response.getWriter().append("Come from
		// detail").append(request.getContextPath());
		DAOUserInfo dao = new DAOUserInfo();
		String account = request.getParameter("txtaccount");
		String address = request.getParameter("txtaddress");
		String tel = request.getParameter("txttel");
		int age = Integer.parseInt(request.getParameter("txtage"));

		// Bean.UserInfo m = new UserInfo();
		Bean.UserInfo m;
		try {
			// 找到原始的账号的用户信息
			m = dao.Query(account);

			// m.setAccount(account);
			m.setAddress(address);
			m.setTel(tel);
			m.setAge(age);

			HttpSession session = request.getSession();
			boolean ret = false;

			try {
				ret = dao.Modify(m);
				if (ret) {
					session.setAttribute("ResultUser", m);
					session.setAttribute("Msg", true);
				} else {
					session.setAttribute("Msg", false);
				}

				request.getRequestDispatcher("UserInfoDetail.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
