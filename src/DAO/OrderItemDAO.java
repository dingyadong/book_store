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

public class OrderItemDAO {
	 
    public static void main(String[] args) {
 
    }
     
    public void insert(OrderItem oi) {
 
        try {
            Class.forName("com.mysql.jdbc.Driver");
 
            Connection c = new DbTools().dbTools();
 
            String sql = "insert into orderitem values(null,?,?,?)";
 
            PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            System.out.println("insert，bookid输入情况："+oi.getBook().getId());
            ps.setInt(1,oi.getBook().getId()); //book的id
            ps.setInt(2,oi.getOrder().getId());	//order的id
            ps.setInt(3,oi.getNum());			//OrderItem的数量		

            									
            ps.execute();
 
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
    
   

 
}