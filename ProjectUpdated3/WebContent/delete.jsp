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
if( session.getAttribute("userEmail") == null || session.getAttribute("userEmail").equals(""))
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

<div class="sidebar">
  <a href="UserRes.jsp"><i class="fa fa-fw fa-home"></i> Welcome</a>
  <a href="#services"><i class="fa fa-pencil fa-fw"></i> My Profile</a>
  <a  href="user.jsp"><i class="fa fa-fw fa-user"></i> Users</a>
  <a href="access.jsp"><i class="fa fa-fw fa-wrench"></i>  Access Requests</a>
  <a href="logout.jsp"><i class="fa fa-sign-out"></i> Logout</a>
  
</div>



		 <div class="main">
		 	<div class="align-items-center">
		 		<h1 class="display-6 text-center mt-top-main txt-color" style="margin: 0 0px 0 38px;">GAMER MANAGEMENT</h1>
			 <div id="mainPart">
				  <div class="col" style="margin: 53px 0px 0 53px;">
				  <form action="" method="post">
							
							<div class="form-group row">
							    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">User Id</label>
							    <div class="col-sm-6">
							      <input type="number" name="id" class="form-control"  placeholder="User Id">
							    </div>
						  </div>
						  <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label"></label>
						    <div class="col-sm-3">
						      <input type="submit" name= "deleteSubmit" class="form-control btn btn-primary"  value="Delete">
						   </div><div class="col-sm-3">
						      <input type="reset" class="form-control btn btn-primary"  value="Cancel" ></div>
						      <div class="col-sm-3">
						       <input type="button" class="form-control btn btn-primary" onclick="closeFrom()" id="button" value="Close" >
						    </div>
						  </div>
						</form>
				  </div>
			 </div>	  
			</div>
		 		 	<script>
						
								
								//  $('#closeForm').modal('toggle'); //or  $('#IDModal').modal('hide');
								 //   return false;
							
						function closeFrom()
						{
							document.getElementById("closeForm").style.display = "none";
						}
						
							  
						
						</script>
		 </div>
			 
				<%
						
							if(request.getParameter("id")!=null ||request.getParameter("deleteSubmit")!=null)
							{
								String id=request.getParameter("id");
								Connection connection=DbConnection.getConnection();
								Statement statement=connection.createStatement();
								String qry="delete from user where userId="+id;
								int i=statement.executeUpdate(qry);
								if(i>0)
								{
									out.print("<script>alert('User has been deleted! ');</script>");   
									out.print("<script>window.location.replace('user.jsp')</script>");
									}
								else
								{
									out.print("<script>alert(' Sorry! User not deleted. ');</script>");   
									out.print("<script>window.location.replace('user.jsp')</script>");
									}
								}
									%>
     

		 <%
			 
			 
			 
			 
		 }
		 
		 %>
		 
		 </body>
</html> 