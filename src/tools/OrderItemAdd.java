package tools;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybean.data.Book;
import mybean.data.OrderItem;
import DAO.BookDAO;

public class OrderItemAdd {
	public boolean OrderItemAdd(int num,String pid,HttpServletRequest request, HttpServletResponse response){
		try {

 
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
		           ois.add(oi);
		       
		} catch (Exception e) {
			e.printStackTrace();
		    return false;
		    
		}
		return true;
	}
}
