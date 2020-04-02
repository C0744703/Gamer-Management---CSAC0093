
<%@page import="user.management.dao.Validators"%>
<%@page import="user.management.model.User"%>
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
				   <h1 class="color-white">Add User</h1>
				     <div class="row">
				  		<form class="col-md-8" action="" method="post">
						  
						  <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Email Address</label>
						    <div class="col-sm-10">
						      <input type="email" name="email" class="form-control" placeholder="Email Address">
						    </div>
						  </div>
						  <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Password</label>
						    <div class="col-sm-10">
						      <input type="password" name="password" class="form-control"  placeholder="Password">
						    </div>
						  </div>
						   <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">First Name</label>
						    <div class="col-sm-10">
						      <input type="text" name="fName" class="form-control"  placeholder="First Name">
						    </div>
						  </div>
						   <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Last Name</label>
						    <div class="col-sm-10">
						      <input type="text" name="lName" class="form-control"  placeholder="Last Name">
						    </div>
						  </div>
						   <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Date Of Birth</label>
						    <div class="col-sm-10">
						      <input type="date" name="uDate" class="form-control"  placeholder="Date Of Birth">
						    </div>
						  </div>
						   <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Access Type</label>
						    <div class="col-sm-10">
						      <select  class="form-control" name="accessType">
						      		<option>Regular Access(Gamer)</option>
						      		<option>Elevated Access</option>
						      		
						      </select>
						    </div>
						  </div>
						   <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Phone Number</label>
						    <div class="col-sm-10">
						      <input type="tel" name="phone" class="form-control"  placeholder="Phone Number" required="required">
						    </div>
						  </div>
						  <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Department</label>
						    <div class="col-sm-10">
						      <select  class="form-control" name="dep">
						      		<option>Technology</option>
						      		<option>Board Games</option>
						      		<option>Card Games</option>
						      		<option>Arcade Games</option>
						      		<option>Real Time Strategy</option>
						      </select>
						    </div>
						  </div>
						   <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Address</label>
						    <div class="col-sm-10">
						      <input type="text" name="address" class="form-control"  placeholder="Address">
						    </div>
						  </div>
						   <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Postal</label>
						    <div class="col-sm-10">
						      <input type="number" name="postal" class="form-control"  placeholder="Postal">
						    </div>
						  </div>
						  <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label"></label>
						    <div class="col-sm-4">
						      <input type="submit" name= "submit" class="form-control btn btn-primary"  value="save">
						   </div><div class="col-sm-4">
						      <input type="reset" class="form-control btn btn-primary"  value="Cancel">
						    </div>
						  </div>
						</form>
					</div>
					</div>	
				  </div>
			 </div>	  
			</div>
		 		 
		
			 
				
     

		 <%
			 
			 
			 
			 
		 }
		 
		 %>
		 <%
		 if(request.getParameter("submit")!=null)
		 {
			 User sub_user=new User();
			 
			 sub_user.setUserEmail(request.getParameter("email"));
			 sub_user.setUserPassword(request.getParameter("password"));
			 
			 sub_user.setUserName(request.getParameter("fName"));
			 sub_user.setUserLastName(request.getParameter("lName"));
			 sub_user.setUserDob(request.getParameter("uDate"));
			 sub_user.setAccess_Type(request.getParameter("accessType"));
			 sub_user.setUserPhn(request.getParameter("phone"));
			 sub_user.setDepartment(request.getParameter("dep"));
			 sub_user.setAdrress(request.getParameter("address"));
			 sub_user.setPostal(request.getParameter("postal"));
			if(Validators.storeUserDataByAdmin(sub_user))
			{
				out.print("<script>alert('Thanks For Registration !!! ');</script>");   
				out.print("<script>window.location.replace('user.jsp')</script>");
			}
			else
			{
				out.print("<script>alert('Not Registration or User Already Register !!! ');</script>");   
				out.print("<script>window.location.replace('add.jsp')</script>");
			}
			 
		 }
		 
		 
		 
		 
		 
		 %>
		 </body>
</html> 