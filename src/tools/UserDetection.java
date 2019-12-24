package tools;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.User;
import DAO.UserDAO;

public class UserDetection {
    public boolean UserDetection(HttpServletRequest req, HttpServletResponse resp){
    	User user = null;
        HttpSession session=req.getSession(true);
    	try{
			user = (User)session.getAttribute("user");
			System.out.println("user:"+user);
			if(user == null){
				user = new User();
			}
			System.out.println("isSuccess:"+user.isSuccess());
			if(user.isSuccess()==false){
				return false;
			}else{
				return true;
			}
		}catch(Exception e){
			return false;
		}
		
    	
    }
}
