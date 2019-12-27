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
import mybean.data.OrderItem;

public class OrderItemAddServlet extends HttpServlet {
	 
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	int num = 0;
    	String pid = null;
 try {
	   num = Integer.parseInt(request.getParameter("num"));
       pid = request.getParameter("pid");
       System.out.println("num"+num);
       System.out.println("pid"+pid);
       
       Book p = new BookDAO().getBook(pid);
       System.out.println("pid:"+pid);
       System.out.println("num:"+num);

       OrderItem oi = new OrderItem();

       oi.setNum(num);
       oi.setBook(p);
       System.out.println("oi:"+oi.getNum());
       System.out.println("Book:"+oi.getBook());
       List<OrderItem> ois = (List<OrderItem>) request.getSession().getAttribute("ois");

       if (null == ois) {
           ois = new ArrayList<OrderItem>();
           request.getSession().setAttribute("ois", ois);
       }
       System.out.print("ois:"+ois);
       boolean found = false;
       for (OrderItem orderItem : ois) { //购买相同产品
           if (orderItem.getBook().getId() == oi.getBook().getId()) {
               orderItem.setNum(orderItem.getNum() + oi.getNum());
               found = true;
               break;
           }
       }

       if (!found){
    	
           ois.add(oi);
           }
} catch (Exception e) {
	e.printStackTrace();
    System.out.println("num"+num);
    System.out.println("pid"+pid);
    response.sendRedirect("index.jsp");
}
    	
    
           response.sendRedirect("/shixunexample/listOrderItem");
    
       }
}