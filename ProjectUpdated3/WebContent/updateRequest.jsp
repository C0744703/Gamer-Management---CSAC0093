

<%@page import="user.management.db.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

if(!request.getParameter("input").isEmpty())
{
	 String qry="";
	String first_Id=request.getParameter("input");
	String userResponse=request.getParameter("val");
	 Connection connection=DbConnection.getConnection();
	 Statement statement=connection.createStatement();
	System.out.println("Amandeep"+first_Id+""+userResponse);
	if(userResponse.equals("Approve"))
	qry="update user set userAccessTypeActive='Approved',userAccessType='Elevated'  where userId="+first_Id;
	else if(userResponse.equals("Decline"))
	qry="update user set userAccessTypeActive='Declined',userAccessType='Regular' where userId="+first_Id;	
		
	 int status = statement.executeUpdate(qry);
		if(status>0)
		{
			out.print("<script>alert('Active')</script>");  
	       
			out.print("<script>window.location.replace('access.jsp')</script>");
		}
	
	
}



%>