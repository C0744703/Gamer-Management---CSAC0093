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
				   <h1 class="color-white">User</h1>
				  		<ul class="nav">
						  <li class="nav-item">
						    <a class="nav-link btn btn-primary ml-1" href="add.jsp">Add</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link btn btn-primary ml-1" href="view.jsp">View</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link btn btn-primary ml-1" href="edit.jsp">Edit</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link btn btn-primary ml-1" href="delete.jsp">Delete</a>
						  </li>
						</ul>
				  </div>
			 </div>	  
			</div>
		 		 
		 </div>
			 
				
     

		 <%
			 
			 
			 
			 
		 }
		 
		 %>
		 
		 </body>
</html> 