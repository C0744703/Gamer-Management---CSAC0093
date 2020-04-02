
<%@page import="user.management.db.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
if( session.getAttribute("subEmail") == null || session.getAttribute("subEmail").equals(""))
		 {
			 out.print("<script>window.location.replace('index.html')</script>");
		 }
		 else
		 {%>
		 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.sql.Connection"%>
		 <!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
   <link href="css/style.css" rel="stylesheet">
   <script  type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: "Lato", sans-serif;}

.sidebar {
  height: 100%;
  width: 160px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #F59A23;
  overflow-x: hidden;
  padding-top: 16px;
}

.sidebar a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #fff;
  display: block;
}

.sidebar a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
}
</style>
</head>
<body class="back-color">


<%
  	
  	Connection connection1=DbConnection.getConnection();
	Statement statement1=connection1.createStatement();
	String myQry="select * from user where userEmail='"+session.getAttribute("subEmail").toString()+"'";
	ResultSet resultSet1=statement1.executeQuery(myQry);
	if(resultSet1.next())
	{
		String test=resultSet1.getString(12);
		System.out.println(test);
		 if(resultSet1.getString(12).equals("Approved"))
			{
				
				%>
				<div class="sidebar">
  <a href="subUser.jsp"><i class="fa fa-fw fa-home"></i> Welcome</a>
  <a href="subMy.jsp"><i class="fa fa-pencil fa-fw"></i> My Profile</a>
 <a href="elevated_access.jsp"><i class="fa fa-pencil fa-fw"></i>User</a>
 
  <a href="logout.jsp"><i class="fa fa-sign-out"></i> Logout</a>
  
</div>
				
		<%	
		}
			if(resultSet1.getString(12).equals("Declined") || resultSet1.getString(12).equals("Active"))
			{
				%>
				<div class="sidebar">
			  <a href="subUser.jsp"><i class="fa fa-fw fa-home"></i> Welcome</a>
			  <a href="subMy.jsp"><i class="fa fa-pencil fa-fw"></i> My Profile</a>
			 
			  <a href="logout.jsp"><i class="fa fa-sign-out"></i> Logout</a>
			  
			</div>
				
			 	
		 
			<%
		}
		 if(resultSet1.getString(12).equals("Waiting for Approval")){
			%>
			<div class="sidebar">
			  <a href="subUser.jsp"><i class="fa fa-fw fa-home"></i> Welcome</a>
			  <a href="subMy.jsp"><i class="fa fa-pencil fa-fw"></i> My Profile</a>
			 
			  <a href="logout.jsp"><i class="fa fa-sign-out"></i> Logout</a>
			  
			</div>
			
			
		
			<%
		 	}
		}
		
	
%>


		 <div class="main">
		 	<div class="align-items-center">
		 		<h1 class="display-6 text-center mt-top-main txt-color" style="margin: 0 0px 0 38px;">GAMER MANAGEMENT</h1>
			 <div id="mainPart">
				  <div class="col" style="margin: 53px 0px 0 53px;">
				  
				    <h1 class="color-white"><%out.print("User Profile"); %></h1>
				  </div>
				
				  <%
				 	 Connection connection=DbConnection.getConnection();
					Statement statement=connection.createStatement();
					String qry="select * from user where userEmail='"+session.getAttribute("subEmail")+"'";
					ResultSet resultSet=statement.executeQuery(qry);
					if(resultSet.next())
					{
				  
				  	System.out.println(qry);
				  %>
				    <div class="row">
				  <div class="col-md-6"></div>
					  <div class="col-md-6">
					    <div class="d-flex justify-content-end">
					   
					    	
					    
					    	<form action="" method="post">
					    	
					    		<input type="hidden" class="form-control" name="email" value="<%=resultSet.getString(2)%>" />
					    		<input type="hidden" class="form-control" name="accessData" value="Active" />
					    		<% if(resultSet.getString(12).equals("Approved")) { %>
					    		<input type="submit" class="btn btn-primary" disabled="disabled" value="You have Elevated Access" name="access" />
					    		
					    		<% } else if((resultSet.getString(12).equals("Active"))|| resultSet.getString(12).equals("Declined")||(resultSet.getString(12).equals("Waiting for Approval")) )  { %>
					    		<input type="submit" class="btn btn-primary" value="Request Elevated Access" name="access" />
					    		<% } 
					    		%>
					    	</form>
					    	
					    	
					    
					    </div>
					  </div>
					</div>
				  
				  		<div class="row">
				  		<form id="closeForm" class="col-md-8" action="" method="post">
						     <input type="hidden" name="ids" class="form-control" value="<%=resultSet.getInt(1)%>">
						  
						  <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Email Address</label>
						    <div class="col-sm-10">
						      <input type="email" name="email" class="form-control"  readonly="readonly" value="<%=resultSet.getString(2)%>">
						    </div>
						  </div>
						  <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Password</label>
						    <div class="col-sm-10">
						      <input type="password" name="password" class="form-control"  value="<%=resultSet.getString(5)%>">
						    </div>
						  </div>
						   <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">First Name</label>
						    <div class="col-sm-10">
						      <input type="text" name="fName" class="form-control"  value="<%=resultSet.getString(3)%>">
						    </div>
						  </div>
						  
						  	 
						  
						  
						  
						  
						   <div class="form-group row">
						  
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Last Name</label>
						    <div class="col-sm-10">
						     
						      <input type="text" name="lName" class="form-control" value="<%=resultSet.getString(4)%>">
						    </div>
						      
						  </div>
						   <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Date Of Birth</label>
						    <div class="col-sm-10">
						      <input type="date" name="uDate" class="form-control"  value="<%=resultSet.getString(7)%>">
						    </div>
						  </div>
						   <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Access Type</label>
						    <div class="col-sm-10">
						      <select  class="form-control" disabled="disabled"  name="accessType" value="<%=resultSet.getString(11)%>">
						      		
						      		<option><%=resultSet.getString(11)%></option>
						      	
						      </select>
						    </div>
						  </div>
						   <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Phone Number</label>
						    <div class="col-sm-10">
						      <input type="tel" name="phone" class="form-control"  value="<%=resultSet.getString(10)%>">
						    </div>
						  </div>
						  <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Department</label>
						    <div class="col-sm-10">
						      <select  class="form-control" disabled="disabled"  name="dep" value="<%=resultSet.getString(13)%>">
						      			
						      		<option><%=resultSet.getString(13)%></option>
						      		
						      		
						      	
						      </select>
						    </div>
						  </div>
						   <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Address</label>
						    <div class="col-sm-10">
						      <input type="text" name="address" class="form-control"  value="<%=resultSet.getString(9)%>">
						    </div>
						  </div>
						   <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Postal</label>
						    <div class="col-sm-10">
						      <input type="number" name="postal" class="form-control" value="<%=resultSet.getString(10)%>">
						    </div>
						  </div>
						  <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label"></label>
						    <div class="col-sm-4">
						      <input type="submit" name= "editSubmit" class="form-control btn btn-primary"  value="Edit">
						   </div><div class="col-sm-4">
						      <input type="reset" class="form-control btn btn-primary"  value="Cancel">
						    </div>
						  </div>
						</form>
					</div>
				  
				  
				  
				  
				  <% 
				  }
				  %>
			
			 </div>	  
			</div>
		 		 
		 </div>
			 
				
     

		 <%
			 
			 
			 
			 
		 }
		 if(request.getParameter("access")!=null)
		 {
			 String userEmail=request.getParameter("email");
			 String accessData=request.getParameter("accessData");
			 
			 Connection connection=DbConnection.getConnection();
			 Statement statement=connection.createStatement();
			 String upDateSql="update user SET userAccessTypeActive='"+accessData+"' where userEmail='"+userEmail+"'";
			 int i=statement.executeUpdate(upDateSql);
			 if(i>0)
			 {
				 out.print("<script>alert('You are Requested for Elevated  Access User')</script>");  
				 out.print("<script>window.location.replace('subMy.jsp')</script>");
			 }
			 else
			 {
				 out.print("<script>alert('You are Not Elevated  Access Sorry')</script>");  
				 out.print("<script>window.location.replace('subMy.jsp')</script>");
			 }
			 
			 
			 
		 }
		 
		 
		 %>
		 
		 </body>
</html> 