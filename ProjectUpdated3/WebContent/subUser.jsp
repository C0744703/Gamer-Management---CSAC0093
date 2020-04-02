<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="user.management.db.DbConnection"%>
<%@page import="java.sql.Connection"%>
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
  	
  	Connection connection=DbConnection.getConnection();
	Statement statement=connection.createStatement();
	String myQry="select * from user where userEmail='"+session.getAttribute("subEmail").toString()+"'";
	ResultSet resultSet=statement.executeQuery(myQry);
	if(resultSet.next())
	{
		String test=resultSet.getString(12);
		System.out.println(test);
		 if(resultSet.getString(12).equals("Approved"))
			{
				
				%>
				<div class="sidebar">
  <a href="subUser.jsp"><i class="fa fa-fw fa-home"></i> Welcome</a>
  <a href="subMy.jsp"><i class="fa fa-pencil fa-fw"></i> My Profile</a>
 <a href="elevated_access.jsp"><i class="fa fa-pencil fa-fw"></i>User</a>
 
  <a href="logout.jsp"><i class="fa fa-sign-out"></i> Logout</a>
  
</div>
				 <div class="main">
		 	<div class="align-items-center">
		 		<h1 class="display-6 text-center mt-top-main txt-color" style="margin: 0 0px 0 38px;">GAMER MANAGEMENT</h1>
			 <div id="mainPart">
				  <div class="col" style="margin: 53px 0px 0 53px;">
				      <h2 class="color-white">Welcome Elevated Access User </h2>
				  </div>
			 </div>	  
			</div>
		 		 
		 </div>
				
		<%	
		}
		  if(resultSet.getString(12).equals("Declined")||resultSet.getString(12).equals("Active"))
			{
				%>
				<div class="sidebar">
			  <a href="subUser.jsp"><i class="fa fa-fw fa-home"></i> Welcome</a>
			  <a href="subMy.jsp"><i class="fa fa-pencil fa-fw"></i> My Profile</a>
			 
			  <a href="logout.jsp"><i class="fa fa-sign-out"></i> Logout</a>
			  
			</div>
				
			 	 <div class="main">
		 	<div class="align-items-center">
		 		<h1 class="display-6 text-center mt-top-main txt-color" style="margin: 0 0px 0 38px;">GAMER MANAGEMENT</h1>
			 <div id="mainPart">
				  <div class="col" style="margin: 53px 0px 0 53px;">
				  
				    <h2 class="color-white">Welcome  Regular Access User </h2>
				  </div>
			 </div>	  
			</div>
		 		 
		 </div>
		
		 
			<%
		}
			 if(resultSet.getString(12).equals("Waiting for Approval")){
			%>
			<div class="sidebar">
			  <a href="subUser.jsp"><i class="fa fa-fw fa-home"></i> Welcome</a>
			  <a href="subMy.jsp"><i class="fa fa-pencil fa-fw"></i> My Profile</a>
			 
			  <a href="logout.jsp"><i class="fa fa-sign-out"></i> Logout</a>
			  
			</div>
			<div class="main">
		 	<div class="align-items-center">
		 		<h1 class="display-6 text-center mt-top-main txt-color" style="margin: 0 0px 0 38px;">GAMER MANAGEMENT</h1>
			 <div id="mainPart">
				  <div class="col" style="margin: 53px 0px 0 53px;">
				  
				    <h2 class="color-white">Wating for Reular access...</h2>
				  </div>
			 </div>	  
			</div>
		 		 
		 </div>
			
		
			<%
		 	}
		}
		
	
%>



		
			 
			
		
				
     
     
    
		
		
			 
	 	 
		
		 
		 </body>
</html> 

<% } %>