<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Object objCurrentUser = session.getAttribute("CurrentUser");
	if (objCurrentUser == null) {
		response.sendRedirect("Login.jsp");
	}
%>
