package view.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import view.db.ConnectionManager;
import view.model.View;

public class ViewOrderDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	private int productid, orderid, productsize, custid;
	private String productname,productdesc, image, orderdate;
	private double productprice, ordertotalPrice;
	
	//add Image.java
	//get all view order
	public static List<View> getAllView(){
		List<View> view = new ArrayList<View>();
		
		try {
			con = ConnectionManager.getConnection();
			
			stmt = con.createStatement();
			String sql = "SELECT * FROM orderdetails ORDER BY orderdetailsid";
			
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				View c = new View();
				
				c.setProductid(rs.getInt("productid"));
				c.setOrderid(rs.getInt("orderid"));
				c.setProductsize(rs.getInt("productsize"));
				c.setCustid(rs.getInt("custid"));
				c.setProductname(rs.getString("productname"));
				c.setProductdesc(rs.getString("productdesc"));
				c.setImage(rs.getString("image"));
				c.setOrderdate(rs.getString("orderdate"));
				c.setProductprice(rs.getDouble("productprice"));
				c.setOrdertotalprice(rs.getDouble("ordertotalprice"));
				
				view.add(c);
			}
			
			//close connection
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return view;
		
	}
	
	//get all by id
	public static View getViewById(int orderdetailsid) {
		
		View c = new View();
		
		try {
		con = ConnectionManager.getConnection();
		
		//create statement
		ps = con.prepareStatement("SELECT * FROM product p JOIN orderdetails o ON p.productid = o.productid JOIN ordert od ON od.orderid = o.orderid WHERE o.orderdetailsid = ?");
		ps.setInt(1, orderdetailsid);
		
		
		rs = ps.executeQuery();
		if(rs.next()) {
			//c.setProductid(rs.getInt("productid"));
			//c.setOrderid(rs.getInt("orderid"));
			c.setProductsize(rs.getInt("productsize"));
			//c.setCustid(rs.getInt("custid"));
			c.setProductname(rs.getString("productname"));
			c.setProductdesc(rs.getString("productdesc"));
			//c.setImage(rs.getString("image"));
			//c.setOrderdate(rs.getString("orderdate"));
			c.setProductprice(rs.getDouble("productprice"));
			c.setOrdertotalprice(rs.getDouble("ordertotalprice"));
		}
		
		//close connection
		con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return c;
		
	}
	
	//delete ticket
	//update ticket
}