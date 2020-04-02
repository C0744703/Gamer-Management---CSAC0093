

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.management.dao.Validators;
import user.management.db.DbConnection;
import user.management.model.User;

/**
 * Servlet implementation class RequestData
 */
@WebServlet("/RequestData")
public class RequestData extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public RequestData() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		 response.setContentType("text/html");
		 HttpSession session;
		 
		 if(request.getParameter("loginUser")!=null)
		 {
			 String userName=request.getParameter("username");
			 String userPass=request.getParameter("password");
			 User userObj=new User();
		     userObj.setUserName(userName);
			 userObj.setUserPassword(userPass);
			 boolean status=Validators.verifyUserInfo(userObj);
			 if(status)
				{
					 session=request.getSession();  
					 session.setAttribute("subEmail",userName);  
					// session.setAttribute("userName",userObj.getUserName());  
					 response.sendRedirect("subUser.jsp");
				}
				else
				{
					out.print("<script>alert('Sorry username or password error')</script>");  
				        //RequestDispatcher rd=request.getRequestDispatcher("index.html");  
				        //rd.include(request,response);  
					out.print("<script>window.location.replace('index.html')</script>");
				}
		 }
		 
		 
		 
		if(request.getParameter("loginAdmin")!=null)
		{
			String userName=request.getParameter("username");
			String userPass=request.getParameter("password");
			User userObj=new User();
			userObj.setUserName(userName);
			userObj.setUserPassword(userPass);
			
			boolean status=Validators.verifyAdminInfo(userObj);
			
			if(status)
			{
				 session=request.getSession();  
				 session.setAttribute("userEmail",userName);  
				
				 response.sendRedirect("UserRes.jsp");
			}
			else
			{
				out.print("<script>alert('Sorry username or password error')</script>");  
			     
				out.print("<script>window.location.replace('index.html')</script>");
			}
		}
		if(request.getParameter("sign_up")!=null)
		{
			User userObj=new User();
			userObj.setUserEmail(request.getParameter("email"));
			userObj.setUserName(request.getParameter("firstname"));
			userObj.setUserLastName(request.getParameter("lastname"));
			userObj.setUserPassword(request.getParameter("passwd"));
			userObj.setUserConfPassword(request.getParameter("confpasswd"));
			userObj.setUserDob(request.getParameter("dob"));
			userObj.setUserCaptcha(request.getParameter("icode"));
			userObj.setUserCity(request.getParameter("city"));
			userObj.setUserPhn(request.getParameter("phnumber"));
			
			if(!(userObj.getUserPassword().equals(userObj.getUserConfPassword())))
			{
				out.print("<script>alert('Password Not Match !!! ');</script>");   
				out.print("<script>window.location.replace('signup.html')</script>");
			}
			boolean status=Validators.registerUserInfo(userObj);
			if(status)
			{
				out.print("<script>alert('Thanks For Registration !!! ');</script>");   
				out.print("<script>window.location.replace('index.html')</script>");
			}
			else
			{
				  out.print("<script>alert('user already exists error');</script>");  
			     
				  out.print("<script>window.location.replace('index.html')</script>");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
