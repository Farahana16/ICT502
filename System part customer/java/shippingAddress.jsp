<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.ConnectionManager"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
 	<head>
	    <meta charset="UTF-8">    
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/UpdateAccount.css">
		<script>
	    	function updateShipping(){
	    		alert("Address Updated Successfully!")
	    	}
	    	
	    	function deleteShipping(){
	    		alert("Account Deleted")
	    	}
	    </script>   
	</head>
	<body>
        <div class="container">
          <div class="title" style="text-align:center;">Billing Address</div>
		    <div class="row">
			    <div class="column">
			     	 <%
		      			//String ID = session.getAttribute("SES_ID");
			     		Connection con = ConnectionManager.getConnection();   							
						Statement statement = con.createStatement();
						String sql ="select * from customer c, shippingaddress s where c.custID = '"+session.getAttribute("SES_ID")+ "'";
						ResultSet resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
					%>
                    <form action="updateAddressProcess.jsp" method="post">  
			    		<div class="user-details">
	                                
		                    <input type="hidden" name="shippingID" value="<%=resultSet.getString("shippingID") %>">      
		                    <input type="hidden" name="billingID" value="0">                  
		                        
		                    <div class="input-box">
			                    <span class="details">Shipping Address</span>
			                    <input type="text" value="<%=resultSet.getString("custshippingAddress") %>"  name="address" >
		                    </div>
		                                
		                    <div class="input-box">
			                    <span class="details">Shipping City</span>
			                    <input type="text" value="<%=resultSet.getString("custshippingCity") %>"  name="city" >
		                    </div>
		                                
		                    <div class="input-box">
			                    <span class="details">Shipping State</span>
			                    <input type="text" value="<%=resultSet.getString("custshippingState") %>"  name="state" >
		                    </div>
		                                
		                    <div class="input-box">
			                    <span class="details">Shipping Poscode</span>
			                    <input type="text" value="<%=resultSet.getString("custshippingPoscode") %>"  name="poscode" >
		                    </div>
		                  </div>  
	
		                  <div class="input-box button" style="text-align: center;">
		                        <a href="Homepage.jsp?custID=<%=session.getAttribute("SES_ID") %>" style="text-decoration:none; background-color: #ccc; color:black;">Back to Homepage</a>
		                        <input type="Submit" value="Update Shipping Address" onclick="updateShipping()" style="background-color: green">		           
		                        <a href="deleteAccount.jsp?<%=session.getAttribute("SES_ID") %>" onclick="deleteShipping()" style="text-decoration:none; background-color: red;">Delete Account</a>
		                  </div>
                    </form>
                </div>    
            </div>
        </div>
        <%
		    }
		    
	    %>         
	</body>
</html>