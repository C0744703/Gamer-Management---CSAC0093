<%@page import="user.management.dao.Validators"%>
<%@page import="user.management.model.User"%>
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
						      <input type="submit" name= "editSubmit" class="form-control btn btn-primary"  value="Update">
						   </div><div class="col-sm-3">
						      <input type="reset" class="form-control btn btn-primary"  value="Cancel" ></div>
						      <div class="col-sm-3">
						       <input type="button" class="form-control btn btn-primary" onclick="closeFrom()" id="button" value="Close" >
						    </div>
						  </div>
						</form>
						<script>
						
								
								//  $('#closeForm').modal('toggle'); //or  $('#IDModal').modal('hide');
								 //   return false;
							
						function closeFrom()
						{
							document.getElementById("closeForm").style.display = "none";
						}
						
							  
						
						</script>
						
						<%
						
							if(request.getParameter("id")!=null ||request.getParameter("editSubmit")!=null)
							{
								String id=request.getParameter("id");
								Connection connection=DbConnection.getConnection();
								Statement statement=connection.createStatement();
								String qry="select * from user where userId="+id;
								ResultSet resultSet=statement.executeQuery(qry);
								if(resultSet.next())
								{
									%>
									
									
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
						      <select  class="form-control" name="accessType" value="<%=resultSet.getString(11)%>">
						      		<option>Regular</option>
						      		<option>Gamer</option>
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
						      <select  class="form-control" name="dep" value="<%=resultSet.getString(13)%>">
						      		<option>Technology</option>
						      		<option>Board Games</option>
						      </select>
						    </div>
						  </div>
						   <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Address</label>
						    <div class="col-sm-10">
						      <input type="text" name="address" class="form-control"  value="<%=resultSet.getString(14)%>">
						    </div>
						  </div>
						   <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label">Postal</label>
						    <div class="col-sm-10">
						      <input type="number" name="postal" class="form-control" value="<%=resultSet.getString(15)%>">
						    </div>
						  </div>
						  <div class="form-group row">
						    <label for="colFormLabel" class="color-white col-sm-2 col-form-label"></label>
						    <div class="col-sm-4">
						      <input type="submit" name= "submit" class="form-control btn btn-primary"  value="Update">
						   </div><div class="col-sm-4">
						      <input type="reset" class="form-control btn btn-primary"  value="Cancel">
						    </div>
						  </div>
						</form>
					</div>
							<%	}
								
							}
						%>
				  </div>
			 </div>	  
			</div>
		 		 
		 </div>
			 
				
     

		 <%
			 
			if(request.getParameter("submit")!=null)
			{
				User user=new User();
				user.setUserEmail(request.getParameter("email"));
				user.setUserPassword(request.getParameter("password"));
				user.setUserName(request.getParameter("fName"));
				user.setUserLastName(request.getParameter("lName"));
				user.setUserDob(request.getParameter("uDate"));
				user.setAccess_Type(request.getParameter("accessType"));
				user.setDepartment(request.getParameter("dep"));
				user.setUserPhn(request.getParameter("phone"));
				user.setAdrress(request.getParameter("address"));
				user.setPostal(request.getParameter("postal"));
				if(Validators.updateUserInfo(user))
				{
					out.print("<script>alert('Thanks For Updating Your Data !!!')</script>");  
				       
					out.print("<script>window.location.replace('edit.jsp')</script>");
				}
				else
				{
					out.print("<script>alert('Sorry !!!')</script>");  
			       
				out.print("<script>window.location.replace('edit.jsp')</script>");
				}
			}
			 
			 
		 }
		 
		 %>
		 
		 </body>
</html> 