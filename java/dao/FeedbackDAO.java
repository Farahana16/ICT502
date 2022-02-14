package dao;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import db.ConnectionManager;
import model.Feedback;

public class FeedbackDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	private int feedbackId, feedbackRating, orderId;
	private String feedbackComment;
	
	public void addFeedback(Feedback bean) {
		feedbackId = bean.getFeedbackId();
		feedbackRating = bean.getFeedbackRating();
		feedbackComment = bean.getFeedbackComment();
		orderId = bean.getOrderId();
		
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("INSERT INTO feedback(feedbackRating, feedbackComment,orderId) VALUES(?,?,?)");
			
			ps.setInt(1, feedbackRating);
			ps.setString(2, feedbackComment);
			ps.setInt(3, orderId);
		
			
			ps.executeUpdate();
			System.out.println("Succefully insert feedback");
			
			con.close();	
		}catch(Exception e) {e.printStackTrace();}
		
	} 
	//end add
	
	public static List<Feedback> getAllFeed() {
		List<Feedback> feed = new ArrayList<Feedback>();
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			
			rs = stmt.executeQuery("SELECT * FROM feedback ORDER BY feedbackId");
			while(rs.next()) {
				Feedback f = new Feedback();
				f.setFeedbackId(rs.getInt("feedbackId"));
				f.setFeedbackRating(rs.getInt("feedbackRating"));
				f.setFeedbackComment(rs.getString("feedbackComment"));
				
				feed.add(f);
			} con.close();
		}catch (Exception e) {e.printStackTrace();}
		return feed;
	}

	public static Feedback getFeedbackById(int feedbackId) {
		Feedback f = new Feedback();
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement("SELECT * FROM feedback WHERE feedbackId=?");
			ps.setInt(1, feedbackId);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				
				f.setFeedbackRating(rs.getInt("feedbackRating"));
				f.setFeedbackComment(rs.getString("feedbackComment"));
				
				
				
			} con.close();
		}catch(Exception e) {e.printStackTrace();}
		return f;
	}

public void deleteFeedback(int feedbackId) {
	try {
		con = ConnectionManager.getConnection();
		ps = con.prepareStatement("DELETE FROM feedback WHERE feedbackId=?");
		ps.setInt(1, feedbackId);
		ps.executeUpdate();
		
		con.close();
	}catch(Exception e) {e.printStackTrace();}
  }
}
