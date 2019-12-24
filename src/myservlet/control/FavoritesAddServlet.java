package myservlet.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BookDAO;
import DAO.FavoritesDao;

import mybean.data.Book;
import mybean.data.Favorites;
import mybean.data.User;

import tools.UserDetection;

public class FavoritesAddServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String favoNews = null;
		String pid  = req.getParameter("pid");
		Boolean isLogin = new UserDetection().UserDetection(req, resp);
		if(!isLogin){
			resp.sendRedirect("login.jsp");
			return;
		}
		User user = (User) req.getSession().getAttribute("user");
		Book book = new BookDAO().getBook(pid);
		Favorites f = new Favorites();
		f.setBook(book);
		f.setUser(user);
try {
	favoNews = new FavoritesDao().insert(f);
} catch (Exception e) {
	e.printStackTrace();
	req.setAttribute("favoNews", favoNews);
	req.getRequestDispatcher("WEB-INF/JspView/favorites.jsp").forward(req, resp);
	return;
}
	req.setAttribute("favoNews", favoNews);
	req.getRequestDispatcher("FavoritesListServlet").forward(req, resp);

	}
	
}
