package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import mybean.data.Book;
import mybean.data.Favorites;
import mybean.data.OrderItem;
import mybean.data.User;
import tools.DbTools;

public class FavoritesDao {

    public String insert(Favorites f) {
    	 String favoNews;
        try {
            Class.forName("com.mysql.jdbc.Driver");
 
            Connection c = new DbTools().dbTools();
 
            String sql = "insert into favorites values(?,?)";
 
            PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1,f.getUser().getId()); 
            ps.setInt(2,f.getBook().getId());							
            ps.execute();
            ps.close();
 
            c.close();
 
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            e.printStackTrace();
            favoNews = "收藏失败，服务器出现错误！";
            return favoNews;
        } catch (SQLException e) {
            
            e.printStackTrace();
            favoNews = "收藏失败，你已经收藏过本书了！";
            return favoNews;
        }catch (Exception e) {
        	 e.printStackTrace();
        	favoNews = "收藏失败，服务器出现错误！";
        	return favoNews;
		}
         return "收藏成功！";
    }
    
    public String delete(Favorites f) {
   	 String favoNews;
       try {
           Class.forName("com.mysql.jdbc.Driver");

           Connection c = new DbTools().dbTools();

           String sql = "delete from favorites where bid = ?";

           PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
           ps.setInt(1,f.getBook().getId());							
           ps.execute();
           ps.close();

           c.close();

       } catch (ClassNotFoundException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
           e.printStackTrace();
           favoNews = "删除失败，服务器出现错误！";
           return favoNews;
       } catch (SQLException e) {
           
           e.printStackTrace();
           favoNews = "删除失败！";
           return favoNews;
       }
        return "删除成功！";
   }
    
    public List<Favorites> ListFavorites(int id,String password) {
        List<Favorites> f = new ArrayList<Favorites>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
 
            Connection c = new DbTools().dbTools();
            
            String sql = "select * from favorites where id =?";

            PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
 
            while (rs.next()) {
            	Favorites favorites = new Favorites();
                String bid = rs.getInt("bid")+"";
                Book book = new BookDAO().getBook(bid);
                User user = new UserDAO().getUser(id+"", password);
                favorites.setBook(book);
                favorites.setUser(user);
                f.add(favorites);
 
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
        return f;
    }
    
}
