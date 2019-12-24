package myservlet.control;
import mybean.data.*;

import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import DAO.UserDAO;
public class RegisterServlet extends HttpServlet{
   public void init(ServletConfig config) throws ServletException{
      super.init(config);
      try {  
            Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception e){} 
   }

   public void doPost(HttpServletRequest request,HttpServletResponse response)
                        throws ServletException,IOException{
	   request.setCharacterEncoding("utf-8");
      String logname=request.getParameter("logname");
      String username=request.getParameter("username");
      String password=request.getParameter("password");
      System.out.println("logname"+logname);
      System.out.println("username"+username);
      System.out.println("password"+password);
      HttpSession session=request.getSession(true);//有session使用当前，没有session创新session     
      if(logname==null)
         logname="";
      if(password==null)
         password="";
      if(username==null)
    	  username="";
      
      boolean isLD=true;
      for(int i=0;i<logname.length();i++){  //用户名字符检测
         char c=logname.charAt(i);
         if(!((c<='z'&&c>='a')||(c<='Z'&&c>='A')||(c<='9'&&c>='0'))) 
            isLD=false;
      } 
      try {
    	  boolean boo=logname.length()>0&&password.length()>0&&isLD;
          Register register = new UserDAO().registerUser(logname, password, username, boo);
          session.setAttribute("register", register);
          
          RequestDispatcher dispatcher=
          request.getRequestDispatcher("register.jsp");//转发
          dispatcher.forward(request,response);
	} catch (Exception e) {
		System.out.print("注册失败");
		e.printStackTrace();
		response.sendRedirect("login.jsp");
	}
    
   }
   public  void  doGet(HttpServletRequest request,HttpServletResponse response) 
                        throws ServletException,IOException{
      doPost(request,response);
   }
}



