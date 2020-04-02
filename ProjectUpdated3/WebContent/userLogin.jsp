<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>WIL Project</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
   <link href="css/style.css" rel="stylesheet">
   <script src="js/jquery.min.js"></script>
</head>
<body class="back-color">

<script src="js/script.js"></script>
<script src="js/bootstrap.min.js"></script>

<!------ Include the above in your HEAD tag ---------->

    <div class="container">  
     <div class="row">
     	<div class="col-md-3"></div>
     	<div class="col-md-6"><h1 class="mt-top-main txt-color">GAMER MANAGEMENT</h1></div>
     	<div class="col-md-3"></div>
     </div>
      <div class="row">
     	<div class="col-md-3"></div>
     	<div class="col-md-6">
			
			<form id="loginform" class="form-horizontal" role="form" action="RequestData" method="post">
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                             <label for="inputEmail3" class="col-sm-2 col-form-label color-white">
                             	Username
                             </label>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-username" type="text" class="form-control" name="username" placeholder="user email" required="required">                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                             <label for="inputEmail3" class="col-sm-2 col-form-label color-white">
                             		Password
                             </label>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login-password" type="password" class="form-control" name="password" placeholder="password" required="required">
                                    </div>
                                    



                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls">
                                      <input type="submit" id="btn-login" name="loginUser" class="btn btn-primary" value="User Login">
                                   
                                      <buttom id="btn-login" class="btn btn-primary" ><a class="color-white" href="signup.html">Sign Up User</a></buttom>
                                    </div>
                                </div>


                          
                            </form>  
		
		</div>
     	<div class="col-md-3">
     		<a href="index.html">Admin Login</a>
     	</div>
     </div>
     
      	
    </div>
    
</body>
</html>