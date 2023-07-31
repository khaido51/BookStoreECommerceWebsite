package book.store.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import book.store.db.util.DBUtil;
import book.store.entity.Order;

public class OrderService {
	public int addOrder(Order order) throws SQLException {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.makeConnection();

			// QUery
			String query = "INSERT INTO `order` (`totalPrice`, `customerId`) VALUES (?,?)";
			ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

			// Set params
			
			ps.setDouble(1, order.getTotalPrice());
			ps.setInt(2, order.getCustomerId());

			ps.execute();

			rs = ps.getGeneratedKeys();

			if (rs.next()) {
				int insertedId = rs.getInt(1);
				return insertedId;
			}
			return 0;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
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
