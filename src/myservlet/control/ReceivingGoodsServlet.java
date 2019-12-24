package myservlet.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.UserDetection;

public class ReceivingGoodsServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Boolean isLogin = new UserDetection().UserDetection(req, resp);
		if(isLogin){
			req.getRequestDispatcher("WEB-INF/JspView/ReceivingGoods.jsp").forward(req, resp);
			return;
		}else{
			resp.sendRedirect("/shixunexample/login.jsp"); 
			return;  
		}
	}

}
