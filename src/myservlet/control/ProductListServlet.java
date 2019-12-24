
package myservlet.control;
import java.io.IOException;
import java.util.List;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BookDAO;

import mybean.data.Book;
 

 
public class ProductListServlet extends HttpServlet {
 
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        List<Book> books= new BookDAO().ListProduct();
        System.out.print(books);
        request.getSession().setAttribute("books", books);
        request.getRequestDispatcher("WEB-INF/JspView/index.jsp").forward(request, response);

 
        
    }
}