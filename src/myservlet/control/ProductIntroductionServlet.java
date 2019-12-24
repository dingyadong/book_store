package myservlet.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BookDAO;

import mybean.data.Book;

public class ProductIntroductionServlet extends HttpServlet{

	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Book> traces=(List<Book>) req.getSession().getAttribute("traces");
		if(traces == null){
			traces = new ArrayList<Book>();
			req.setAttribute("traces",traces);
		}
	
		String id = req.getParameter("id");
		Boolean found = false;
		Book book = new BookDAO().getBook(id);
		for(Book b:traces){
			if(b.getId()==book.getId()){
				found = true;
				break;
			}
		}
		if (!found)
			traces.add(book); //没有发现图书则添加
		for(Book b : traces){
		System.out.println("traces info:"+b.getName());
		}
		req.getSession().setAttribute("traces", traces);
		
		System.out.println("bookinfoid:"+book.getId());
		System.out.println("bookinfoimg"+book.getImg());
		req.setAttribute("bookinfo", book);
		req.getRequestDispatcher("WEB-INF/JspView/introduction.jsp").forward(req, resp);
		
		
	}

}
