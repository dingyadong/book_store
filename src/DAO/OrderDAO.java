package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import tools.DbTools;

import mybean.data.Book;
import mybean.data.Order;
import mybean.data.OrderItem;
import mybean.data.User;
 
public class OrderDAO {
 
    public void insert(Order o) {
 
        try {
            Class.forName("com.mysql.jdbc.Driver");
 
            Connection c = new DbTools().dbTools();
 
            String sql = "insert into order_ values(null,?,null)"; 
 
            PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
 
            ps.setInt(1, o.getUser().getId());
 
            ps.execute();
 
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                o.setId(id);
            }
 
            ps.close();
 
            c.close();
 
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
 
    }
    
    public List<Order> ListOrder() {
        List<Order> orders = new ArrayList<Order>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
 
            Connection c = new DbTools().dbTools();
            
            String sql = "SELECT order_.id,AdminId,crateDate,AdminName,BookName,BookPress,BookPrice,BookAuthor,number FROM" +
            		" order_,bookadmin,bookinfo,orderitem where order_.uid = bookadmin.AdminId and orderitem.bid = bookinfo.BookId " +
            		"and orderitem.iod = order_.id";
 
            PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
 
            ResultSet rs = ps.executeQuery();
 
            while (rs.next()) {
            	Order order = new Order();
            	User user = new User();
            	OrderItem orderItem = new OrderItem();
            	Book book = new Book();
                int id = rs.getInt("id");
                int uid = rs.getInt("uid");
                String data = rs.getString("crateDate");

                order.setId(id);
                order.setUser(user);


                orders.add(order);
 
            }

            ps.close();
 
            c.close();
 
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return orders;
    }
 
}