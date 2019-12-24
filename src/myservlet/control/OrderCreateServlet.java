package myservlet.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.OrderItemAdd;

import mybean.data.Order;
import mybean.data.OrderItem;
import mybean.data.User;
import DAO.OrderDAO;
import DAO.OrderItemDAO;

public class OrderCreateServlet extends HttpServlet {
	 
    @SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	User u = (User) request.getSession().getAttribute("user");
        if(null==u){
            response.sendRedirect("./login.jsp");
            return;
        }
        List<OrderItem> ois = (List<OrderItem>) request.getSession().getAttribute("ois");
        ois.clear();
    	String[] pid = request.getParameterValues("pid");
		String[] num = request.getParameterValues("num");
		int [] num1 = new int[num.length];

		for(int i  = 0;i<num.length;i++){
        	num1[i] = Integer.parseInt(num[i]);
        }
		
	
        for(int i  = 0;i<num.length;i++){
        	new OrderItemAdd().OrderItemAdd(num1[i], pid[i], request, response);
        }
         
        Order o = new Order();
        o.setUser(u);
 
        new OrderDAO().insert(o);
 try {
     ois = (List<OrderItem>) request.getSession().getAttribute("ois");
     for (OrderItem oi : ois) {
         oi.setOrder(o);
         new OrderItemDAO().insert(oi);
     }
     ois.clear();
} catch (Exception e) {
	e.printStackTrace();
}


request.getRequestDispatcher("WEB-INF/JspView/OrderCreate.jsp").forward(request, response);
 
    }
}