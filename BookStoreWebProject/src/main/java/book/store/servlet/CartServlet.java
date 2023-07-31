package book.store.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.store.dto.CartSession;
import book.store.entity.Book;
import book.store.entity.Genre;
import book.store.entity.Order;
import book.store.entity.OrderDetails;
import book.store.service.BookService;
import book.store.service.GenreService;
import book.store.service.OrderDetailsService;
import book.store.service.OrderService;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		// Get book id and command from the view

		try {

			// Import List of genre here to display book's genre on navigation bar
			GenreService genreService = new GenreService();
			List<Genre> genreList = genreService.getAllGenres();

			int bookId = 0;
			String command = request.getParameter("command");
			System.out.println("Received command: " + command);

			// Add to cart case
			if (command != null && command.equals("ADD_TO_CART")) {
				bookId = Integer.parseInt(request.getParameter("bookId"));
				BookService bookService = new BookService();
				Book book = bookService.getBookDetails(bookId);
			
				HttpSession session = request.getSession();
				Map<Integer, Book> cart = (Map<Integer, Book>) session.getAttribute("cart");

				if (cart == null) {
					cart = new HashMap<Integer, Book>();
				}
				

				cart.put(book.getIsbn(), book);
				
				for(Integer key: cart.keySet()) {
					if(bookId == key) {
						cart.put(book.getIsbn(), book);
					}
				}
				
				session.setAttribute("cart", cart);
				request.setAttribute("book", book);
				RequestDispatcher rd = request.getRequestDispatcher("product-details.jsp");
				rd.forward(request, response);

			} else if (command != null && command.equals("ADD_FROM_INDEX")) {
				bookId = Integer.parseInt(request.getParameter("bookId"));
				BookService bookService = new BookService();
				Book book = bookService.getBookDetails(bookId);
				HttpSession session = request.getSession();
				Map<Integer, Book> cart = (Map<Integer, Book>) session.getAttribute("cart");
				//CartSession cart = (CartSession) session.getAttribute("cart");

				if (cart == null) {
					cart = new HashMap<Integer, Book>();
				}
				
				cart.put(book.getIsbn(), book);
				session.setAttribute("cart", cart);
				request.setAttribute("book", book);
				response.sendRedirect("home");
			}

			else if (command != null && command.equals("ADD_FROM_LIST")) {
				bookId = Integer.parseInt(request.getParameter("bookId"));
				BookService bookService = new BookService();
				Book book = bookService.getBookDetails(bookId);
				HttpSession session = request.getSession();
				Map<Integer, Book> cart = (Map<Integer, Book>) session.getAttribute("cart");

				if (cart == null) {
					cart = new HashMap<Integer, Book>();
				}

				cart.put(book.getIsbn(), book);
				session.setAttribute("cart", cart);
				request.setAttribute("book", book);

				response.sendRedirect("book");
			} else if (command != null && command.equals("REMOVE_CART")) {
				bookId = Integer.parseInt(request.getParameter("bookId"));
				HttpSession session = request.getSession();
				Map<Integer, Book> cart = (Map<Integer, Book>) session.getAttribute("cart");
				cart.remove(bookId);

				RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
				rd.forward(request, response);
			}

			else if (command != null && command.equals("VIEW_CART")) {
				HttpSession session = request.getSession();
				Map<Integer, Book> cart = (Map<Integer, Book>) session.getAttribute("cart");
				double totalPrice = 0;

				for (Book book : cart.values()) {
					totalPrice = totalPrice + book.getPrice();
				}
				RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
				
				request.setAttribute("totalPrice", totalPrice);
				rd.forward(request, response);
			}
			else if(command != null && command.equals("PROCEED_TO_CHECKOUT")) {
				HttpSession session = request.getSession();
				Map<Integer, Book> cart = (Map<Integer, Book>) session.getAttribute("cart");
				
				//gathering all info to display at checkout stage
				//totalPrice
				String totalPriceParam = request.getParameter("totalPrice");
				double finalTotalPrice = 0.0;
				
				if (totalPriceParam != null) {
				    finalTotalPrice = Double.parseDouble(totalPriceParam);
				}
				//customer
				Integer customerId = (Integer) session.getAttribute("customerId");
				if(customerId == null) {
					response.sendRedirect("register.jsp");
				}
			
				//amount of each book
				List<Integer> amountList = new ArrayList<>();
				for (Book book : cart.values()) {
					//not working here
					//it must be an ArrayList to store multiple quantity of each product
					int amount = Integer.parseInt(request.getParameter("amount_"+book.getIsbn()));
					amountList.add(amount);
				}
				
				System.out.println("Amount List: " + amountList.size());
				
				RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
				request.setAttribute("finalTotalPrice", finalTotalPrice);
				request.setAttribute("customerId", customerId);
				request.setAttribute("amountList", amountList);
				
				rd.forward(request, response);
				
			}
			else if (command != null && command.equals("CHECKOUT")) {
				HttpSession session = request.getSession();
				Map<Integer, Book> cart = (Map<Integer, Book>) session.getAttribute("cart");

				// create order - return orderId

				String totalPriceParam = request.getParameter("totalPrice");
				int customerId = (int) session.getAttribute("customerId");
				double finalTotalPrice = 0.0;
				
				if (totalPriceParam != null) {
				    finalTotalPrice = Double.parseDouble(totalPriceParam);
				}
				
				
				// int amount = Integer.parseInt(request.getParameter("amount"));
				// double orderedPrice =
				// Double.parseDouble(request.getParameter("ordered{roce"));

				Order order = new Order(customerId, finalTotalPrice);
				System.out.println("Total price: " + finalTotalPrice);

				OrderService orderService = new OrderService();
				Integer orderId = orderService.addOrder(order);

				session.setAttribute("orderId", orderId);

				// create orderDetails
				for (Book book : cart.values()) {
					//not working here
					//it must be an ArrayList to store multiple quantity of each product
					int amount = Integer.parseInt(request.getParameter("amount_"+book.getIsbn()));
					System.out.println("Amount is " + amount);
					

					OrderDetails orderDetails = new OrderDetails(orderId, book.getIsbn(), amount, book.getPrice());
					OrderDetailsService orderDetailsService = new OrderDetailsService();
					orderDetailsService.addOrderDetails(orderDetails);

				}

				session.removeAttribute("cart");
				response.sendRedirect("home");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	
	}

}
