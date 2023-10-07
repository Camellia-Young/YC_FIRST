package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.DAOUserInfo;

/**
 * Servlet implementation class UserInfoLoginServlet
 */
@WebServlet("/UserInfoLoginServlet")
public class UserInfoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserInfoLoginServlet() {
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
		String account = request.getParameter("txt_account");
		String password = request.getParameter("txt_password");

		HttpSession session = request.getSession();

		DAOUserInfo ado = new DAOUserInfo();
		Bean.UserInfo m = null;
		try {
			m = ado.Query(account);

			if (m == null) {
				session.setAttribute("Error", 1);
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			} else {
				if (m.getPassword().equals(password)) {
					session.setAttribute("CurrentUser", m);
					response.sendRedirect("MainPage.jsp");
				} else {
					session.setAttribute("Error", 2);
					request.getRequestDispatcher("Login.jsp").forward(request, response);
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
