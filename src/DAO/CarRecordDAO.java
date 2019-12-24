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
import mybean.data.CarRecord;
import mybean.data.Order;
import mybean.data.OrderItem;
import mybean.data.User;

public class CarRecordDAO {
	  public List<CarRecord> CarRecord(int id) {
		    List<CarRecord> carRecords = new ArrayList<CarRecord>();
		    try {
		        Class.forName("com.mysql.jdbc.Driver");
		        
		        Connection c = new DbTools().dbTools();
		        
		        String sql = "SELECT * FROM" +
		        		" order_,bookadmin,bookinfo,orderitem where order_.uid = bookadmin.AdminId and orderitem.bid = bookinfo.BookId " +
		        		"and orderitem.iod = order_.id and AdminId = " + id;                                       

		        PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);

		        ResultSet rs = ps.executeQuery();
		       
		        while (rs.next()) {
		        	CarRecord carRecord = new CarRecord();
		        	int orderid = rs.getInt("id");
		            String crateDate = rs.getString("crateDate");
		            String adminName = rs.getString("AdminName");
		            String bookName = rs.getString("BookName");
		            String bookPress = rs.getString("BookPress");
		            int bookPrice = rs.getInt("BookPrice");
		            String bookqutline = rs.getString("BookQutline");
		            int bookid =rs.getInt("BookId");
		            String img = rs.getString("BookPic");
		            String bookAuthor = rs.getString("BookAuthor");
		            int number = rs.getInt("number");
		            System.out.println("orderid:"+orderid);
		            System.out.println("AdminName:"+adminName);
		            carRecord.setId(orderid);
		            carRecord.setCratedate(crateDate);
		            carRecord.setAdminname(adminName);
		            carRecord.setBookname(bookName);
		            carRecord.setBookqutline(bookqutline);
		            carRecord.setBookid(bookid);
		            carRecord.setBookpress(bookPress);
		            carRecord.setBookprice(bookPrice);
		            carRecord.setBookauthor(bookAuthor);
		            carRecord.setImg(img);
		            carRecord.setNumber(number);
		            carRecords.add(carRecord);
		            System.out.println("caradminname:"+carRecord.getAdminname());

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
		    return carRecords;
		}
}
