<%@page import="java.sql.PreparedStatement"%>
<%@page import="user.management.db.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

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
.table,
.table tr,
.table td {
    background-color: white !important;
}


</style>
</head>
<body class="back-color">

	<div class="sidebar">
  <a href="subUser.jsp"><i class="fa fa-fw fa-home"></i> Welcome</a>
  <a href="subMy.jsp"><i class="fa fa-pencil fa-fw"></i> My Profile</a>
 <a href="elevated_access.jsp"><i class="fa fa-pencil fa-fw"></i>Users</a>
 
  <a href="logout.jsp"><i class="fa fa-sign-out"></i> Logout</a>
  
</div>


		 <div class="main">
		 	<div class="align-items-center">
		 		<h1 class="display-6 text-center mt-top-main txt-color" style="margin: 0 0px 0 38px;">GAMER MANAGEMENT</h1>
			 <div id="mainPart">
				  <div class="col" style="margin: 53px 0px 0 53px;">
			
				      <h1 class="color-white">User</h1>
				      <form action="" method="post">
				        <div class="form-group row">
						    <label for="Department" class="color-white col-form-label">Department</label>
						    <div class="col-sm-2">
						      	<select class="form-control form-control-lg" name="selectOption">
								  <option></option>
								   <option>Technology</option>
								  <option>Real Time Strategy</option>
								  <option>Arcade Games</option>
								  <option>Board Games</option>
								  <option>Card Games</option>
								</select>
						    </div>
						     <div class="col-sm-2">
						     	
						      	 <input class="form-control form-control-lg" type="text" name="searchName" placeholder="Search" aria-label="Search">
						    	
						    </div>
						     <button type="submit" class="btn btn-light" name="search">Search</button>
						  </div>
						  
				      </form>
				      
				      <%
				      
				      	if(request.getParameter("search")!=null)
				      	{
				      		String selectOption=request.getParameter("selectOption");
				      		String searchName=request.getParameter("searchName");
				      		System.out.println(selectOption +"  "+searchName);
				      		if(selectOption.isEmpty()||searchName.isEmpty())
				      		{
				      			if(!selectOption.isEmpty())
				      			searchName=selectOption;
				      			%>
				      			   <div class="row">
				       <div class="col-md-10">
							      <table class="table table-bordered">
								  <thead>
								    <tr>
								    
								      <th scope="col">User id</th>
								      <th scope="col">First Name</th>
								      <th scope="col">Last Name</th>
								      <th scope="col">Access Type</th>
								      <th scope="col">Department</th>
								      <th scope="col">Phone Number</th>
								      <th scope="col">Address</th>
								       
								   
								    </tr>
								  </thead>
								  <tbody>
								  <%
								  Connection connection=DbConnection.getConnection();
								  //Statement statement=connection.createStatement();
						    		//String qry="select * from user where userAccessType='Elevated' and userAccessTypeActive='No'";
						    		
						    		String qry="select * from user where userAccessType=? or userName=? or userCity=? or userDepartment=? or userEmail=? ";// and userAccessTypeActive='No'";
						    		
						    		PreparedStatement preparedStatement=connection.prepareStatement(qry);
						    		preparedStatement.setString(1,searchName );
						    		preparedStatement.setString(2,searchName );
						    		preparedStatement.setString(3,searchName );
						    		preparedStatement.setString(4,searchName );
						    		preparedStatement.setString(5,searchName );
						    		ResultSet resultSet=preparedStatement.executeQuery();
								  	while(resultSet.next()){
								  
								  %>
								  
								     <tr>
								     		
									      <th scope="row"><input type="checkbox" value="<%=resultSet.getInt(1) %> " id="userId" /><%=resultSet.getInt(1) %> </th>
									      <td><%=resultSet.getString(3) %></td>
										  <td><%=resultSet.getString(4) %></td>
										  <td><%=resultSet.getString(11) %></td>
										  <td><%=resultSet.getString(9) %></td>
										  <td><%=resultSet.getString(10) %></td>
										  <td><%=resultSet.getString(9) %></td>
										   
							  
							    </tr>
								    <% } %>
								  </tbody>
								</table>
						  </div>		
				      </div>
				      	<%
				      		}
				      		
				      		
				      	}
				      	else{
				      
				      %>
				      
				      
				      <div class="row">
				       <div class="col-md-10">
							      <table class="table table-bordered">
								  <thead>
								    <tr>
								    
								      <th scope="col">User id</th>
								      <th scope="col">First Name</th>
								      <th scope="col">Last Name</th>
								      <th scope="col">Access Type</th>
								      <th scope="col">Department</th>
								      <th scope="col">Phone Number</th>
								      <th scope="col">Address</th>
								       <th scope="col">Status</th>
								    </tr>
								  </thead>
								  <tbody>
								  <%
								  Connection connection=DbConnection.getConnection();
								  Statement statement=connection.createStatement();
						    		//String qry="select * from user where userAccessType='Elevated' and userAccessTypeActive='No'";
						    		
						    		String qry="select * from user where userAccessType='Elevated'";// and userAccessTypeActive='No'";
						    		
						    		ResultSet resultSet=statement.executeQuery(qry);
								  	while(resultSet.next()){
								  
								  %>
								  
								     <tr>
								     		
									      <th scope="row"><input type="checkbox" value="<%=resultSet.getInt(1) %> " id="userId" /><%=resultSet.getInt(1) %> </th>
									      <td><%=resultSet.getString(3) %></td>
										  <td><%=resultSet.getString(4) %></td>
										  <td><%=resultSet.getString(11) %></td>
										  <td><%=resultSet.getString(9) %></td>
										  <td><%=resultSet.getString(10) %></td>
										  <td><%=resultSet.getString(9) %></td>
										    <td><%=resultSet.getString(12) %></td>
							  
							    </tr>
								    <% } %>
								  </tbody>
								</table>
						  </div>		
				      </div>
				      <%} %>
				     
				      
				  </div>
			 </div>	  
			</div>
		 		 
		 </div>
			 
				
     

		 <%
			 
			 
			 
			 
		 }
		 
		 %>
		 
		 </body>
</html> 