package myservlet.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybean.data.Book;
import mybean.data.Order;
import mybean.data.OrderItem;
import mybean.data.User;
import DAO.BookDAO;
import DAO.OrderDAO;
import DAO.OrderItemDAO;

public class OnceOrderCreateServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

int num;
String pid;
User u = null;
Book book =null;
try {
	num = Integer.parseInt(request.getParameter("num"));
	pid = request.getParameter("pid");
	u = (User) request.getSession().getAttribute("user");
} catch (Exception e) {
	response.sendRedirect("./login.jsp");
    return;
}

if(null==u){
    response.sendRedirect("./login.jsp");
    return;
}
Order o = new Order();
o.setUser(u);
new OrderDAO().insert(o);
try {
	book = new BookDAO().getBook(pid);
OrderItem oi = new OrderItem();
oi.setNum(num);
oi.setBook(book);
oi.setOrder(o);
 new OrderItemDAO().insert(oi);

} catch (Exception e) {
e.printStackTrace();
}


request.getRequestDispatcher("WEB-INF/JspView/OrderCreate.jsp").forward(request, response);

}
}
