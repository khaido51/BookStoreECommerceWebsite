package book.store.entity;

import java.util.Date;

public class Book {
	private int isbn;
	private String title;
	private double price;
	private int edition;
	private int stock;

	
	public Book() {
		super();
	}

	public Book(int isbn, String title, double price, int edition, int stock) {
		super();
		this.isbn = isbn;
		this.title = title;
		this.price = price;
		this.edition = edition;
		this.stock = stock;
	
	}
	
	

	public int getIsbn() {
		return isbn;
	}

	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getEdition() {
		return edition;
	}

	public void setEdition(int edition) {
		this.edition = edition;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}
	
	

}
