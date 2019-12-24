package myservlet.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.UserDetection;

import DAO.FavoritesDao;

import mybean.data.Favorites;
import mybean.data.User;



public class FavoritesListServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		Boolean isLogin = new UserDetection().UserDetection(req, resp);
		System.out.println("isLogin:"+isLogin);
		if(!isLogin){
			resp.sendRedirect("login.jsp");
			return;
		}
		System.out.println("isLogin:"+isLogin);
		User user = (User) req.getSession().getAttribute("user");
		List<Favorites> f= new FavoritesDao().ListFavorites(user.getId(),user.getPassword());
		
		if(f==null){
			f = new ArrayList<Favorites>();
		}
		req.getSession().setAttribute("favorites", f);
		req.getRequestDispatcher("WEB-INF/JspView/favorites.jsp").forward(req, resp);
	}

}
