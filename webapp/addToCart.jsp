<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<body>
		<%
			String driver = "oracle.jdbc.driver.OracleDriver";
			String connectionUrl = "jdbc:oracle:thin:@localhost:1521:XE ";
			String userid = "taka2";
			String password = "system";
			try{ 
				//load the driver class  
				Class.forName(driver); 
				
				//create the connection object 
				Connection con = DriverManager.getConnection(connectionUrl, userid, password); 
				int productID = Integer.parseInt(request.getParameter("productID"));
		
				//create the statement object 
				PreparedStatement ps = con.prepareStatement("INSERT INTO CARTITEMS(productID, custID) VALUES ('" + productID + "', 1)");
				
				//execute query 
				ps.executeUpdate(); 
				response.sendRedirect("Homepage.jsp");

				con.close(); 
			}
			catch(Exception e){ 
				System.out.println(e);  
			} 
		%>
	</body>
</html>
