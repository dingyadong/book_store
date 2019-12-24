package myservlet.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybean.data.Book;

public class TraceProductServlet extends HttpServlet{

	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Book> books = (List<Book>)req.getSession().getAttribute("traces");
		if(books == null){
			books = new ArrayList<Book>();
		}
		req.getRequestDispatcher("WEB-INF/JspView/traceProduct.jsp").forward(req, resp);
	}


	
}
