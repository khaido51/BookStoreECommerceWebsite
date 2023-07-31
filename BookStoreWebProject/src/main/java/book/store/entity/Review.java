package book.store.entity;

import java.util.Date;

public class Review {
	private int id;
	private Book bookId;
	private Customer customerId;
	private Date date;
	private String description;

	public Review() {
		super();
	}

	public Review(int id, Book bookId, Customer customerId, Date date, String description) {
		super();
		this.id = id;
		this.bookId = bookId;
		this.customerId = customerId;
		this.date = date;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Book getBookId() {
		return bookId;
	}

	public void setBookId(Book bookId) {
		this.bookId = bookId;
	}

	public Customer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Customer customerId) {
		this.customerId = customerId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
