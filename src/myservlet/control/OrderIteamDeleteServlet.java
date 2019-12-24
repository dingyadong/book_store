package myservlet.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybean.data.OrderItem;

public class OrderIteamDeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			List<OrderItem> ois = new ArrayList<OrderItem>();
			ois = (List<OrderItem>) req.getSession().getAttribute("ois");
			ois.remove(id);
			req.getSession().setAttribute("ois", ois);
			resp.sendRedirect("/shixunexample/listOrderItem");
		} catch (Exception e) {
			resp.sendRedirect("index.jsp");
		}


	}

}
