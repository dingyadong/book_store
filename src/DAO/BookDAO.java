
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
 

 
public class BookDAO {
 
    public static void main(String[] args) {
 
        System.out.println(new BookDAO().ListProduct().size());
 
    }
 
    public List<Book> ListProduct() {
        List<Book> Books = new ArrayList<Book>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
 
            Connection c = new DbTools().dbTools();
            
            String sql = "select * from bookinfo";
 
            PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
 
            ResultSet rs = ps.executeQuery();
 
            while (rs.next()) {
            	Book book = new Book();
                int id = rs.getInt("BookId");
                String name = rs.getString("BookName");
                float price = rs.getFloat("BookPrice");
                String img = rs.getString("BookPic");
                book.setId(id);
                book.setName(name);
                book.setPrice(price);
                book.setImg(img);
                System.out.println("bookid"+book.getId());
                Books.add(book);
 
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
        return Books;
    }
    
    public Book getBook(String id) {
    	Book book = null;
    	int id1;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = new DbTools().dbTools();
         
            id1 = Integer.parseInt(id);
            String sql = "select * from bookinfo where BookId = ?";
 
            PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, id);
 
            ResultSet rs = ps.executeQuery();
 
            if (rs.next()) {
              	book = new Book();
                String name = rs.getString("BookName");
                float price = rs.getFloat("BookPrice");
                String img = rs.getString("BookPic");
                int dealmount = rs.getInt("BookDealmount"); 
                int isbn = rs.getInt("Bookisbn");
                String qutline = rs.getString("BookQutline");
                book.setId(id1);
                book.setName(name);
                book.setPrice(price);
                book.setImg(img);
                book.setIsbn(isbn);
                book.setDealmount(dealmount);
                book.setBookqutline(qutline);
 
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
        return book;
    }

    
}