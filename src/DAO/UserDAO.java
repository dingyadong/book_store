package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import tools.DbTools;

import mybean.data.Order;
import mybean.data.Register;
import mybean.data.User;
 

 
public class UserDAO {
 
    public static void main(String[] args) {
 
        System.out.println("UserDao()"+new UserDAO().getUser("123", "123").getName());
 
    }
 

    
    public User getUser(String id, String password) {
        User result = null;
        int id1;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = new DbTools().dbTools();
            String sql = "select * from bookadmin where AdminId = ? and AdminPass = ?";
            id1 = Integer.parseInt(id);
            PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, id);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
     
            if (rs.next()){
                result = new User();
                String realname = rs.getString("Realname");
                String sex = rs.getString("sex");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String receAddress = rs.getString("receAddress");
        
                result.setId(id1);
                result.setPassword(password);
                result.setRealname(realname);
                result.setSex(sex);
                result.setAddress(receAddress);
                result.setName(rs.getString("AdminName"));
                result.setEmail(email);
                result.setPhone(phone);
                result.setAddress(address);
                result.setSuccess(true);
                System.out.println("userdaoresultid:"+result.getId());
                
            }

         
            ps.close();
            c.close();
 
/*        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();*/
        }catch (Exception e) {
      	  e.printStackTrace();
        }
        return result;
    }
    
    
    public Register registerUser(String id,String password,String username, boolean boo) {

    	Register register = new Register();
    	 int id1 = Integer.parseInt(id);
        try {
            Class.forName("com.mysql.jdbc.Driver");
 
            Connection c = new DbTools().dbTools();
 
            String sql = "insert into bookadmin (AdminId,AdminPass,AdminName)values(?,?,?)"; //(用户账号,用户密码,用户昵称)
 
            PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);/*插入自动增长的字段,
            																				代码需要加入Statement.RETURN_GENERATED_KEYS*/
            ps.setInt(1, id1);
            ps.setString(2, password);
            ps.setString(3, username);
            
            
            if(boo){
            	int m = ps.executeUpdate();
                if(m!=0){
                    register.setBackNews("注册成功");
                    register.setLogname(id);
                    register.setPassword(password);

                }
           }
           else{
        	   register.setBackNews("信息填写不完整或名字中有非法字符");
    
           }

            ps.close();
 
            c.close();

        } catch (SQLException exp) {
        	register.setBackNews("该会员名已被使用，请您更换名字!");
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return register;
 
    }
    
    public String updateUserInfo(int id,String username,String phone,String email,String address,String Realname,String sex,String receAddress) {
        
        String backNews = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = new DbTools().dbTools();
            String sql = "update bookadmin set AdminName = ?,email = ?,phone = ?,address = ?,Realname = ?,sex=?,receAddress=?  where  AdminId = ?";
            
            PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setString(5, Realname);
            ps.setString(6, sex);
            ps.setString(7, receAddress);
            ps.setInt(8, id);
            int m = ps.executeUpdate();
            if(m != 0){
            	backNews = "更新个人信息成功！";
            }
      
         
            ps.close();
            c.close();
 
/*        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();*/
        }catch (Exception e) {
        	backNews = "更新个人信息失败！";
        }
        return backNews;
    }
    
    

}