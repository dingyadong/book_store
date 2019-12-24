package myservlet.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tools.UserDetection;

import mybean.data.Book;
import mybean.data.CarRecord;
import mybean.data.User;
import DAO.BookDAO;
import DAO.CarRecordDAO;

public class CarRecordListServlet  extends HttpServlet{



	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		User user = null;
		int id;
		try {
			Boolean isLogin = new UserDetection().UserDetection(req, resp);
			if(!isLogin){
				resp.sendRedirect("login.jsp");
				return;
			}
			user = (User) req.getSession().getAttribute("user");
			if(user.isSuccess()==false){
				resp.sendRedirect("/shixunexample/login.jsp"); //user为空则返回主页\
				return;  //转发之后需要return，不然会出现多重转发的错误现象。
			}else{
				id = user.getId();			
				System.out.println("userid:"+id);
			    List<CarRecord> carRecords= new CarRecordDAO().CarRecord(id);  //user不为空则访问用户
			    System.out.println("进入car的servlet成功");
			    req.setAttribute("carRecords", carRecords);
			    req.getRequestDispatcher("WEB-INF/JspView/listCarRecord.jsp").forward(req, resp);
			}

	}catch (Exception e) {
		e.printStackTrace();
		resp.sendRedirect("login.jsp");
	}
	
	}

}
