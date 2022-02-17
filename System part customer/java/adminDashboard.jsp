<!DOCTYPE html>
<html lang="en">
<head>
	<title>TCO</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/utilAdmin.css">
	<link rel="stylesheet" type="text/css" href="css/mainAdmin.css">
<!--===============================================================================================-->

<style>
    * {box-sizing: border-box;}
    
    body { 
      margin: 0;
      font-family: Arial, Helvetica, sans-serif;
    }
    
    .header {
      overflow: hidden;
      background-color: #000000;
      padding: 5px 5px;
    }
    
    .header a {
      float: left;
      color: rgb(255, 255, 255);
      text-align: center;
      padding: 12px;
      text-decoration: none;
      font-size: 18px; 
      line-height: 25px;
      border-radius: 4px;
    }
    
    .header a.logo {
      font-size: 25px;
      font-weight: bold;
    }
    
    .header a:hover {
      background-color: #ddd;
      color: black;
    }
    
    .header a.active {
      background-color: rgb(163, 201, 238);
      color: white;
    }
    
    .header-right {
      float: right;
    }
    
    @media screen and (max-width: 500px) {
      .header a {
        float: none;
        display: block;
        text-align: left;
      }
      
      .header-right {
        float: none;
      }
    }
    </style>
</head>
<body>
	
    <!--Header-->
    <div class="header">
        <a href="adminDashboard.jsp" class="logo">TakaCastOff</a>
        <div class="header-right">
          <a href="adminDashboard.jsp">Home</a>
          <a href="productTable.jsp">Product</a>
          <a href="orderTable.jsp">Order</a>
          <a href="feedbackTable.jsp">Feedback</a>
          <a href="adminIndex.jsp">Logout</a>
        </div>
      </div>

	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					
				</div>
			</div>
		</div>
	</div>


	

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>