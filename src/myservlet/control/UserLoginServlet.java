package myservlet.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.User;
import DAO.UserDAO;
 

 
public class UserLoginServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        HttpSession session=request.getSession(true);//有session使用当前，没有session创新session
        User user = null;
try {
  
	user = new UserDAO().getUser(id, password);
	if (user != null) {
		user.setSuccess(true);
        session.setAttribute("user", user);
        response.sendRedirect("/shixunexample/listProduct");
    } else{
    	session.setAttribute("loginmess", "登陆失败，请验证账号密码！");
        response.sendRedirect("login.jsp");
	}

} catch (Exception e) {
    session.setAttribute("loginmess", "登陆失败，请验证账号密码！");
	e.printStackTrace();
	response.sendRedirect("login.jsp");
}

}


}