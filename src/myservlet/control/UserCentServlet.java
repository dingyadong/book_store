package myservlet.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.UserDetection;


public class UserCentServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		Boolean isLogin = new UserDetection().UserDetection(req, resp);
		if(isLogin){
			req.getRequestDispatcher("WEB-INF/JspView/personalCenter.jsp").forward(req, resp);
			return;
		}else{
			resp.sendRedirect("/shixunexample/login.jsp"); 
			return;  
		}
		

		
	}


	

}
