package book.store.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import book.store.entity.Author;
import book.store.entity.Book;

import book.store.db.util.*;

public class BookService {

	// Create a function to get all Books by ID
	public List<Book> getBooksByGenreId(int genreId) throws SQLException {

		// connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;
		List<Book> list = new ArrayList<Book>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT b.isbn, b.title, b.price, b.edition, b.stock FROM book b join books_genre bg on b.isbn = bg.bookIsbn join genre g on bg.genreId =g.id where g.id =?";
			// String query = "SELECT * FROM book where category_id = ?";
			// -> table Category
			// Run query "Select * from category"
			ps = conn.prepareStatement(query);
			ps.setInt(1, genreId);
			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int isbn = rs.getInt("isbn");
				String title = rs.getString("title");
				double price = rs.getDouble("price");
				int edition = rs.getInt("edition");
				int stock = rs.getInt("stock");

				book = new Book(isbn, title, price, edition, stock);
				list.add(book);
			}

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

		return list;
	}

	public List<Book> getBooksByName(String bookName) throws SQLException {

		// connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;
		List<Book> list = new ArrayList<Book>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT * FROM book where title like ?";

			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + bookName + "%");
			// ps.setInt(1, genreId);
			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int isbn = rs.getInt("isbn");
				String title = rs.getString("title");
				double price = rs.getDouble("price");
				int edition = rs.getInt("edition");
				int stock = rs.getInt("stock");

				book = new Book(isbn, title, price, edition, stock);
				list.add(book);
			}

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

		return list;
	}

	public Book getBookDetails(int bookId) throws SQLException {
		// connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT * FROM book where isbn = ?";

			// String query = "SELECT * FROM book where category_id = ?";
			// -> table Category
			// Run query "Select * from category"
			ps = conn.prepareStatement(query);

			ps.setInt(1, bookId);
			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			if (rs.next()) {
				int isbn = rs.getInt("isbn");
				String title = rs.getString("title");
				double price = rs.getDouble("price");
				int edition = rs.getInt("edition");
				int stock = rs.getInt("stock");

				book = new Book(isbn, title, price, edition, stock);

			}

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

		return book;
	}

	public Author getAuthorOnBookDetails(int bookId) throws SQLException {

		// connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		Author author = null;

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT a.id, a.name FROM book b join book_author ba on b.isbn = ba.isbn join author a on ba.authorId = a.id where b.isbn = ?";
			// String query = "SELECT * FROM book where category_id = ?";
			// -> table Category
			// Run query "Select * from category"
			ps = conn.prepareStatement(query);
			ps.setInt(1, bookId);
			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS

			if (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");

				author = new Author(id, name);

			}

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

		return author;

	}

	public List<Book> getAllBooks() throws SQLException {
		// connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;
		List<Book> list = new ArrayList<Book>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT * FROM book";

			ps = conn.prepareStatement(query);
			// ps.setInt(1, genreId);
			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int isbn = rs.getInt("isbn");
				String title = rs.getString("title");
				double price = rs.getDouble("price");
				int edition = rs.getInt("edition");
				int stock = rs.getInt("stock");

				book = new Book(isbn, title, price, edition, stock);
				list.add(book);
			}

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

		return list;
	}

	public int getTotalPage() throws SQLException {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "select count(*) as total_page from book";

			ps = conn.prepareStatement(query);

			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			if (rs.next()) {
				int totalBook = rs.getInt("total_page");
				return (int) Math.ceil((double) totalBook / 7);
			}

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

	public List<Book> getBooksByPage(int page) throws SQLException {

		// Connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;
		List<Book> list = new ArrayList<Book>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();

			// String query = "SELECT * FROM book where category_id = ?";
			// -> table Category
			// Run query "Select * from category"
			ps = conn.prepareStatement("SELECT * FROM book LIMIT ?,?");
			ps.setInt(1, (page - 1) * 7);
			ps.setInt(2, 7);

			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int isbn = rs.getInt("isbn");
				String title = rs.getString("title");
				double price = rs.getDouble("price");
				int edition = rs.getInt("edition");
				int stock = rs.getInt("stock");

				book = new Book(isbn, title, price, edition, stock);
				list.add(book);
			}

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

		return list;
	}
}
