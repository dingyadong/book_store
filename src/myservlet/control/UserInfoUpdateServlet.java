package myservlet.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tools.UserDetection;

import DAO.UserDAO;

import mybean.data.User;

public class UserInfoUpdateServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		req.setCharacterEncoding("utf-8");
		String username = req.getParameter("name");
		String realname = req.getParameter("realname");
		String sex = req.getParameter("sex");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		String receAddress = req.getParameter("receAddress");
		User user = null;
		String backNews;
		HttpSession session = req.getSession();
		Boolean isLogin = new UserDetection().UserDetection(req, resp);
		try{
		if(isLogin){
			user = (User) session.getAttribute("user");
			int id =user.getId();
			backNews = new UserDAO().updateUserInfo(id, username, phone, email, address, realname, sex, receAddress);
			user = new UserDAO().getUser(user.getId()+"", user.getPassword());
			user.setBackNews(backNews);
			session.setAttribute("user", user);
			req.getRequestDispatcher("WEB-INF/JspView/personalCenter.jsp").forward(req, resp);
			return;
		}else{
			resp.sendRedirect("/shixunexample/login.jsp"); 
			return;  
		}
		}catch (Exception e) {
			e.printStackTrace();
			
		}
	

	}
}
