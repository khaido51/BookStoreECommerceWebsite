package book.store.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import book.store.db.util.DBUtil;
import book.store.entity.Order;
import book.store.entity.OrderDetails;


public class OrderDetailsService {
	
	public int addOrderDetails(OrderDetails orderDetails) throws SQLException{
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		
		try {
			conn = DBUtil.makeConnection();
			
			//Query
			String query = "INSERT INTO `order_details`(orderId, bookId, amount, orderedPrice) VALUES (?,?,?,?)";
			ps = conn.prepareStatement(query);
			
			ps.setInt(1, orderDetails.getOrderId());
			ps.setInt(2, orderDetails.getBookId());
			ps.setInt(3, orderDetails.getAmount());
			ps.setDouble(4, orderDetails.getOrderedPrice());
			
			ps.execute();
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		
		return 0;
	}
}
