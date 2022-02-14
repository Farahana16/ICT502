<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String connectionUrl = "jdbc:oracle:thin:@localhost:1521:XE ";
	String userid = "taka2";
	String password = "system";
	
	try {
		Class.forName(driver);
	}catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	
	Connection con  = null;
	Statement statement = null;
	ResultSet resultSet, rs = null;

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Tie Dye Checkout</title>
	<link rel="stylesheet" href="css/checkout.css">
</head>
<body>
	ello
	<%
		System.out.println("Sini");
		//int custID = Integer.parseInt(request.getParameter("custID"));
		double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
		int orderID = 0;
		
		try{
			con = DriverManager.getConnection(connectionUrl, userid, password);
			PreparedStatement ps = con.prepareStatement("INSERT INTO orderr(orderdate, ordertotalprice, custid) VALUES (to_date(SYSDATE),?,?)");   
			ps.setDouble(1,totalPrice);
			ps.setInt(2,1);
			
			ps.executeUpdate();
			
			System.out.println("SinA"); 
			statement = con.createStatement();
			String sql = "SELECT productid from cartitems WHERE custid = 1";
			resultSet = statement.executeQuery(sql);
			System.out.println("SinO");
			while(resultSet.next()){
				int productid = resultSet.getInt("productid");
				ps = con.prepareStatement("INSERT INTO orderdetails(productid, orderid) VALUES(?, order_id_seq.currval)");
				ps.setInt(1, productid);
				ps.executeUpdate();
			}
			
			System.out.println("Sini2");
			
			ps = con.prepareStatement("DELETE FROM CARTITEMS WHERE CUSTID = 1"); 
			ps.executeUpdate();
			
			statement = con.createStatement();
			sql = "SELECT order_id_seq.currval as orderID from dual";
			resultSet = statement.executeQuery(sql);
			
			if(resultSet.next()){
				orderID = resultSet.getInt("orderID");
			}
			
			
			response.sendRedirect("Payment.jsp?orderID=" + orderID);
		}catch(Exception e){
				System.out.println(e);
		}
	%>
</body>
</html>