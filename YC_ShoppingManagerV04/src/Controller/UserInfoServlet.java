package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.UserInfo;
import Dao.DAOUserInfo;

/**
 * Servlet implementation class UserInfoServlet
 */
@WebServlet("/UserInfoServlet")
public class UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserInfoServlet() {
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

		Bean.UserInfo m = new UserInfo();

		String account = request.getParameter("txtaccount");
		String address = request.getParameter("txtaddress");
		int age = Integer.parseInt(request.getParameter("txtage"));
		String password = request.getParameter("txtPassword");
		String password2 = request.getParameter("txtPassword2");
		String tel = request.getParameter("txttel");

		m.setAccount(account);
		m.setAddress(address);
		m.setAge(age);
		m.setTel(tel);
		m.setPassword(password);

		DAOUserInfo dao = new DAOUserInfo();
		boolean r=false;
		try {
			r = dao.Add(m);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (r == true) {
             response.sendRedirect("AddSuccess.jsp");
		}
		else {
			 response.sendRedirect("AddError.jsp");
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
