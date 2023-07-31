<%@page import="book.store.service.GenreService"%>
<%@page import="book.store.entity.Genre"%>
<%@page import="book.store.entity.Book"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Koparion – Book Shop HTML5 Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

<!-- all css here -->
<!-- bootstrap v3.3.6 css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate css -->
<link rel="stylesheet" href="css/animate.css">
<!-- meanmenu css -->
<link rel="stylesheet" href="css/meanmenu.min.css">
<!-- owl.carousel css -->
<link rel="stylesheet" href="css/owl.carousel.css">
<!-- font-awesome css -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- flexslider.css-->
<link rel="stylesheet" href="css/flexslider.css">
<!-- chosen.min.css-->
<link rel="stylesheet" href="css/chosen.min.css">
<!-- style css -->
<link rel="stylesheet" href="style.css">
<!-- responsive css -->
<link rel="stylesheet" href="css/responsive.css">
<!-- modernizr css -->
<script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body class="home-2">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- Add your site or application content here -->
	<!-- header-area-start -->
	<header>
		<!-- header-top-area-start -->
		<div class="header-top-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-12">
						<div class="language-area">
							<ul>
								<li><img src="img/flag/1.jpg" alt="flag" /><a href="#">English<i
										class="fa fa-angle-down"></i></a>
									<div class="header-sub">
										<ul>
											<li><a href="#"><img src="img/flag/2.jpg" alt="flag" />france</a></li>
											<li><a href="#"><img src="img/flag/3.jpg" alt="flag" />croatia</a></li>
										</ul>
									</div></li>
								<li><a href="#">USD $<i class="fa fa-angle-down"></i></a>
									<div class="header-sub dolor">
										<ul>
											<li><a href="#">EUR €</a></li>
											<li><a href="#">USD $</a></li>
										</ul>
									</div></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-12">
						<div class="account-area text-end">
							<ul>
								<li><a href="my-account.html">My Account</a></li>
								<li><a href="checkout.html">Checkout</a></li>
								<c:if test="${empty sessionScope.userName }">
									<li><a href="login.jsp">Sign in</a></li>
									<li><a href="register.jsp">Register</a></li>
								</c:if>
								<c:if test="${not empty sessionScope.userName }">
									<li><a href="login.jsp">${userName }</a></li>
									<li><a href="logout">logout</a></li>
								</c:if>



							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- header-top-area-end -->
		<!-- header-mid-area-start -->
		<div class="header-mid-area ptb-40">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-5 col-12">
						<div class="header-search">
							<form action="book" method="GET">
								<input type="text" name="bookName"
									placeholder="Please enter book name..." />
								<button type="submit">
									<i class="fa fa-search"></i></a>
							</form>
						</div>
					</div>
					<div class="col-lg-6 col-md-4 col-12">
						<div class="logo-area text-center logo-xs-mrg">
							<a href="index.html"><img src="img/logo/logo.png" alt="logo" /></a>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-12">
						<div class="my-cart">
							<ul>
								<li><a href="cart?command=VIEW_CART"><i
										class="fa fa-shopping-cart"></i>My Cart</a> <span>${empty sessionScope.cart? 0 : sessionScope.cart.size()}</span>
									<div class="mini-cart-sub">
										<div class="cart-product">
											<c:forEach var="item" items="${cart}">
												<c:set var="total" value="${total + item.value.price}" />
												<div class="single-cart">
													<div class="cart-img">
														<a href="#"><img src="img/product/1.jpg" alt="book" /></a>
													</div>
													<div class="cart-info">
														<h5>
															<a href="#">${item.value.title}</a>
														</h5>
														<p>${item.value.price}</p>
													</div>
													<div class="cart-icon">
														<a
															href="cart?command=REMOVE_CART&bookId=${item.value.isbn}"><i
															class="fa fa-remove"></i></a>
													</div>
												</div>
											</c:forEach>

										</div>
										<div class="cart-totals">
											<h5>

												Total <span><c:out value="${total }" /></span>
											</h5>
										</div>
										<div class="cart-bottom">
											<a class="view-cart" href="cart?command=VIEW_CART">view
												cart</a> <a href="checkout.html">Check out</a>
										</div>
									</div></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- header-mid-area-end -->
		<!-- main-menu-area-start -->
		<div
			class="main-menu-area d-md-none d-none d-lg-block sticky-header-1"
			id="header-sticky">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="menu-area">
							<nav>
								<ul>
									<li class="active"><a href="home">Home<i
											class="fa fa-angle-down"></i></a>
										<div class="sub-menu">
											<ul>
												<li><a href="home">Home</a></li>
										</div></li>
									<li><a href="book">Book<i class="fa fa-angle-down"></i></a>
										<div class="mega-menu">

											<span> <c:forEach var="genre" items="${genreList}">
													<a href="book?genreId=${genre.id}">${genre.name} </a>
												</c:forEach>

											</span>

										</div></li>
									<li><a href="product-details.html">Audio books<i
											class="fa fa-angle-down"></i></a>
										<div class="mega-menu">
											<span> <<c:forEach var="genre" items="${genreList}">
													<a href="book?genreId=${genre.id}">${genre.name} </a>

												</c:forEach>
											</span>

										</div></li>

									<li><a href="#">blog<i class="fa fa-angle-down"></i></a>
										<div class="sub-menu sub-menu-2">
											<ul>
												<li><a href="blog.html">blog</a></li>
												<li><a href="blog-details.html">blog-details</a></li>
											</ul>
										</div></li>

								</ul>
							</nav>
						</div>
						<div class="safe-area">
							<a href="product-details.html">sales off</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- main-menu-area-end -->
		<!-- mobile-menu-area-start -->
		<div class="mobile-menu-area d-lg-none d-block fix">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="mobile-menu">
							<nav id="mobile-menu-active">
								<ul id="nav">
									<li><a href="home">Home</a>
										<ul>
											<li><a href="home">Home</a></li>

										</ul></li>
									<li><a href="book">Book</a>
										<ul>
											<c:forEach var="genre" items="${genreList }">
												<li><a href="book?genreId=${genre.id }">${genre.name }</a></li>
											</c:forEach>

										</ul></li>
									<li><a href="product-details.html">Audio books</a>
										<ul>
											<c:forEach var="genre" items="${genreList }">
												<li><a href="book?genreId=${genre.id }">${genre.name }</a></li>
											</c:forEach>
										</ul></li>

									<li><a href="#">blog</a>
										<ul>
											<li><a href="blog.html">Blog</a></li>
											<li><a href="blog-details.html">blog-details</a></li>
										</ul></li>

								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- mobile-menu-area-end -->
	</header>
	<!-- header-area-end -->
	<!-- breadcrumbs-area-start -->
	<div class="breadcrumbs-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumbs-menu">
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#" class="active">checkout</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumbs-area-end -->
	<!-- entry-header-area-start -->
	<div class="entry-header-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="entry-header-title">
						<h2>Checkout</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- entry-header-area-end -->
	<!-- coupon-area-area-start -->
	<div class="coupon-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="coupon-accordion">
						<h3>
							Returning customer? <span id="showlogin">Click here to
								login</span>
						</h3>
						<div class="coupon-content" id="checkout-login">
							<div class="coupon-info">
								<p class="coupon-text">Quisque gravida turpis sit amet nulla
									posuere lacinia. Cras sed est sit amet ipsum luctus.</p>
								<form action="#">
									<p class="form-row-first">
										<label>Username or email <span class="required">*</span></label>
										<input type="text">
									</p>
									<p class="form-row-last">
										<label>Password <span class="required">*</span></label> <input
											type="text">
									</p>
									<p class="form-row">
										<input type="submit" value="Login"> <label> <input
											type="checkbox"> Remember me
										</label>
									</p>
									<p class="lost-password">
										<a href="#">Lost your password?</a>
									</p>
								</form>
							</div>
						</div>
						<h3>
							Have a coupon? <span id="showcoupon">Click here to enter
								your code</span>
						</h3>
						<div class="coupon-checkout-content" id="checkout_coupon">
							<div class="coupon-info">
								<form action="#">
									<p class="checkout-coupon">
										<input type="text" placeholder="Coupon code"> <input
											type="submit" value="Apply Coupon">
									</p>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- coupon-area-area-end -->
	<!-- checkout-area-start -->
	<div class="checkout-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<form action="cart" method="GET">
					<input type="hidden" name="command" value="CHECKOUT">
					  
						<div class="row">
							<div class="col-lg-6 col-md-12 col-12">
								<div class="checkbox-form">
									<h3>Billing Details</h3>
									<div class="row">
										<div class=" col-lg-12">
											<div class="country-select">
												<label>Country <span class="required">*</span></label> <select>
													<option value="volvo">bangladesh</option>
													<option value="saab">Algeria</option>
													<option value="mercedes">Afghanistan</option>
													<option value="audi">Ghana</option>
													<option value="audi2">Albania</option>
													<option value="audi3">Bahrain</option>
													<option value="audi4">Colombia</option>
													<option value="audi5">Dominican Republic</option>
												</select>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-12 ">
											<div class="checkout-form-list">
												<label>First Name <span class="required">*</span></label> <input
													type="text" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-12">
											<div class="checkout-form-list">
												<label>Last Name <span class="required">*</span></label> <input
													type="text" placeholder="">
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-12">
											<div class="checkout-form-list">
												<label>Company Name</label> <input type="text"
													placeholder="">
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-12">
											<div class="checkout-form-list">
												<label>Address <span class="required">*</span></label> <input
													type="text" placeholder="Street address">
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-12">
											<div class="checkout-form-list">
												<input type="text"
													placeholder="Apartment, suite, unit etc. (optional)">
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-12">
											<div class="checkout-form-list">
												<label>Town / City <span class="required">*</span></label> <input
													type="text" placeholder="Town / City">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-12">
											<div class="checkout-form-list">
												<label>State / County <span class="required">*</span></label>
												<input type="text" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-12">
											<div class="checkout-form-list">
												<label>Postcode / Zip <span class="required">*</span></label>
												<input type="text" placeholder="Postcode / Zip">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-12">
											<div class="checkout-form-list">
												<label>Email Address <span class="required">*</span></label>
												<input type="email" placeholder="">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-12">
											<div class="checkout-form-list">
												<label>Phone <span class="required">*</span></label> <input
													type="text" placeholder="Postcode / Zip">
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-12">
											<div class="checkout-form-list create-acc">
												<input type="checkbox" id="cbox"> <label>Create
													an account?</label>
											</div>
											<div class="checkout-form-list create-account" id="cbox_info"
												style="display: none;">
												<p>Create an account by entering the information below.
													If you are a returning customer please login at the top of
													the page.</p>
												<label>Account password <span class="required">*</span></label>
												<input type="password" placeholder="password">
											</div>
										</div>
									</div>
									<div class="different-address">
										<div class="ship-different-title">
											<h3>
												<label>Ship to a different address?</label> <input
													type="checkbox" id="ship-box">
											</h3>
										</div>
										<div class="row" id="ship-box-info" style="display: none;">
											<div class="col-lg-12">
												<div class="country-select">
													<label>Country <span class="required">*</span></label> <select>
														<option value="volvo">bangladesh</option>
														<option value="saab">Algeria</option>
														<option value="mercedes">Afghanistan</option>
														<option value="audi">Ghana</option>
														<option value="audi2">Albania</option>
														<option value="audi3">Bahrain</option>
														<option value="audi4">Colombia</option>
														<option value="audi5">Dominican Republic</option>
													</select>
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="checkout-form-list">
													<label>First Name <span class="required">*</span></label> <input
														type="text" placeholder="">
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="checkout-form-list">
													<label>Last Name <span class="required">*</span></label> <input
														type="text" placeholder="">
												</div>
											</div>
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<div class="checkout-form-list">
													<label>Company Name</label> <input type="text"
														placeholder="">
												</div>
											</div>
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<div class="checkout-form-list">
													<label>Address <span class="required">*</span></label> <input
														type="text" placeholder="Street address">
												</div>
											</div>
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<div class="checkout-form-list">
													<input type="text"
														placeholder="Apartment, suite, unit etc. (optional)">
												</div>
											</div>
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<div class="checkout-form-list">
													<label>Town / City <span class="required">*</span></label>
													<input type="text" placeholder="Town / City">
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="checkout-form-list">
													<label>State / County <span class="required">*</span></label>
													<input type="text" placeholder="">
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="checkout-form-list">
													<label>Postcode / Zip <span class="required">*</span></label>
													<input type="text" placeholder="Postcode / Zip">
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="checkout-form-list">
													<label>Email Address <span class="required">*</span></label>
													<input type="email" placeholder="">
												</div>
											</div>
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="checkout-form-list">
													<label>Phone <span class="required">*</span></label> <input
														type="text" placeholder="Postcode / Zip">
												</div>
											</div>
										</div>
										<div class="order-notes">
											<div class="checkout-form-list">
												<label>Order Notes</label>
												<textarea
													placeholder="Notes about your order, e.g. special notes for delivery."
													rows="10" cols="30" id="checkout-mess"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-12 col-12">
								<div class="your-order">
									<h3>Your order</h3>
									<div class="your-order-table table-responsive">
										<table>
											<thead>
												<tr>
													<th class="product-name">Product</th>
													<th class="product-total">Total</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${cart}" varStatus="loop">
												 <input type="hidden" name="amount_${item.value.isbn}" value="${amountList[loop.index]}">
													<tr class="cart_item">
														<td class="product-name">${item.value.title } <strong
															class="product-quantity">
															
																 ${amountList[loop.index]}
															
														</strong>
														</td>
														<td class="product-total"><span class="amount">${item.value.price * amountList[loop.index]}</span>
														</td>
													</tr>

												</c:forEach>

											</tbody>
											<tfoot>
												<tr class="cart-subtotal">
													<th>Cart Subtotal</th>
													<td><span class="amount">${finalTotalPrice }</span></td>
												</tr>
												<tr class="shipping">
													<th>Shipping</th>
													<td>
														<ul>
															<li><input type="radio"> <label>
																	Flat Rate: <span class="amount">£7.00</span>
															</label></li>
															<li><input type="radio"> <label>Free
																	Shipping:</label></li>
															<li></li>
														</ul>
													</td>
												</tr>
												<tr class="order-total">
													<th>Order Total</th>
													<td><strong><span class="amount">${finalTotalPrice }</span></strong>
													</td>
												</tr>
												
											</tfoot>
										</table>
									</div>
									<div class="payment-method">
										<div class="payment-accordion">
											<div class="collapses-group">
												<div class="panel-group" id="accordion" role="tablist"
													aria-multiselectable="true">
													<div class="panel panel-default">
														<div class="panel-heading" role="tab" id="headingOne">
															<h4 class="panel-title">
																<a data-bs-toggle="collapse" data-bs-parent="#accordion"
																	href="#collapseOne" aria-expanded="true"
																	aria-controls="collapseOne"> Direct Bank Transfer </a>
															</h4>
														</div>
														<div id="collapseOne" class="panel-collapse collapse in"
															role="tabpanel" aria-labelledby="headingOne">
															<div class="panel-body">
																<p>Make your payment directly into our bank account.
																	Please use your Order ID as the payment reference. Your
																	order won’t be shipped until the funds have cleared
																	in our account.</p>
															</div>
														</div>
													</div>
													<div class="panel panel-default">
														<div class="panel-heading" role="tab" id="headingTwo">
															<h4 class="panel-title">
																<a class="collapsed" role="button"
																	data-bs-toggle="collapse" data-bs-parent="#accordion"
																	href="#collapseTwo" aria-expanded="false"
																	aria-controls="collapseTwo"> Cheque Payment </a>
															</h4>
														</div>
														<div id="collapseTwo" class="panel-collapse collapse"
															role="tabpanel" aria-labelledby="headingTwo">
															<div class="panel-body">
																<p>Please send your cheque to Store Name, Store
																	Street, Store Town, Store State / County, Store
																	Postcode.</p>
															</div>
														</div>
													</div>
													<div class="panel panel-default">
														<div class="panel-heading" role="tab" id="headingThree">
															<h4 class="panel-title">
																<a class="collapsed" role="button"
																	data-bs-toggle="collapse" data-bs-parent="#accordion"
																	href="#collapseThree" aria-expanded="false"
																	aria-controls="collapseThree"> PayPal <img
																	src="img/2.png" alt="payment" />
																</a>
															</h4>
														</div>
														<div id="collapseThree" class="panel-collapse collapse"
															role="tabpanel" aria-labelledby="headingThree">
															<div class="panel-body">
																<p>Pay via PayPal; you can pay with your credit card
																	if you don’t have a PayPal account.</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										  <input type="hidden" name="totalPrice" value="${finalTotalPrice}">
										<div class="order-button-payment">
											<input type="submit" value="Place order">
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- checkout-area-end -->
	<!-- footer-area-start -->
	<footer>
		<!-- footer-top-start -->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="footer-top-menu bb-2">
							<nav>
								<ul>
									<li><a href="#">home</a></li>
									<li><a href="#">Enable Cookies</a></li>
									<li><a href="#">Privacy and Cookie Policy</a></li>
									<li><a href="#">contact us</a></li>
									<li><a href="#">blog</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer-top-start -->
		<!-- footer-mid-start -->
		<div class="footer-mid ptb-50">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-12">
						<div class="row">
							<div class="col-lg-4 col-md-4 col-12">
								<div class="single-footer br-2 xs-mb">
									<div class="footer-title mb-20">
										<h3>Products</h3>
									</div>
									<div class="footer-mid-menu">
										<ul>
											<li><a href="about.html">About us</a></li>
											<li><a href="#">Prices drop </a></li>
											<li><a href="#">New products</a></li>
											<li><a href="#">Best sales</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-12">
								<div class="single-footer br-2 xs-mb">
									<div class="footer-title mb-20">
										<h3>Our company</h3>
									</div>
									<div class="footer-mid-menu">
										<ul>
											<li><a href="contact.html">Contact us</a></li>
											<li><a href="#">Sitemap</a></li>
											<li><a href="#">Stores</a></li>
											<li><a href="register.html">My account </a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-12">
								<div class="single-footer br-2 xs-mb">
									<div class="footer-title mb-20">
										<h3>Your account</h3>
									</div>
									<div class="footer-mid-menu">
										<ul>
											<li><a href="contact.html">Addresses</a></li>
											<li><a href="#">Credit slips </a></li>
											<li><a href="#"> Orders</a></li>
											<li><a href="#">Personal info</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-12">
						<div class="single-footer mrg-sm">
							<div class="footer-title mb-20">
								<h3>STORE INFORMATION</h3>
							</div>
							<div class="footer-contact">
								<p class="adress">
									<span>My Company</span> Your address goes here.
								</p>
								<p>
									<span>Call us now:</span> 0123456789
								</p>
								<p>
									<span>Email:</span> demo@example.com
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer-mid-end -->
		<!-- footer-bottom-start -->
		<div class="footer-bottom">
			<div class="container">
				<div class="row bt-2">
					<div class="col-lg-6 col-md-6 col-12">
						<div class="copy-right-area">
							<p>
								&copy; 2022 <strong> Koparion </strong> Mede with ❤️ by <a
									href="https://hasthemes.com/" target="_blank"><strong>HasThemes</strong></a>
							</p>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-12">
						<div class="payment-img text-end">
							<a href="#"><img src="img/1.png" alt="payment" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer-bottom-end -->
	</footer>
	<!-- footer-area-end -->


	<!-- all js here -->
	<!-- jquery latest version -->
	<script src="js/vendor/jquery-1.12.4.min.js"></script>


	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- owl.carousel js -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- meanmenu js -->
	<script src="js/jquery.meanmenu.js"></script>
	<!-- wow js -->
	<script src="js/wow.min.js"></script>
	<!-- jquery.parallax-1.1.3.js -->
	<script src="js/jquery.parallax-1.1.3.js"></script>
	<!-- jquery.countdown.min.js -->
	<script src="js/jquery.countdown.min.js"></script>
	<!-- jquery.flexslider.js -->
	<script src="js/jquery.flexslider.js"></script>
	<!-- chosen.jquery.min.js -->
	<script src="js/chosen.jquery.min.js"></script>
	<!-- jquery.counterup.min.js -->
	<script src="js/jquery.counterup.min.js"></script>
	<!-- waypoints.min.js -->
	<script src="js/waypoints.min.js"></script>
	<!-- plugins js -->
	<script src="js/plugins.js"></script>
	<!-- main js -->
	<script src="js/main.js"></script>
	<!-- Paypal -->
	<script src="https://www.paypal.com/sdk/js?client-id=AYNtFibTKN4CT9N1pohi7nmCYAyfsMxf7L_TcUBLq1cHBMgnR5lwHG7wI1bdS8qAJrtL9dz0kD__9FKV&disable-funding=credit,card"></script>
	<script>paypal.Buttons().render('body')</script>
</body>
</html>
