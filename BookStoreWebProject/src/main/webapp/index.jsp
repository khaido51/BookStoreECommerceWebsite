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
						<div class="my-cart" id="cart-section">
							<ul>
								<li><a href="cart?command=VIEW_CART"><i
										class="fa fa-shopping-cart"></i>My Cart</a> <span id="cart-count">${empty sessionScope.cart? 0 : sessionScope.cart.size()}</span>
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
												cart</a> <a href="cart?command=CHECKOUT">Check out</a>
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
	<!-- slider-area-start -->
	<div class="slider-area mt-30">
		<div class="container">
			<div class="slider-active owl-carousel">
				<div class="single-slider pt-100 pb-145 bg-img"
					style="background-image: url(img/slider/13.jpg);">
					<div class="row">
						<div class="col-md-12">
							<div class="slider-content-3 slider-animated-1 pl-100">
								<h1>
									A Game <br>Fuck up
								</h1>
								<p class="slider-sale">
									<span class="sale1">-20%</span> <span class="sale2"> <strong>£80.00</strong>
										£60.00
									</span>
								</p>
								<a href="#">Shop now!</a>
							</div>
						</div>
					</div>
				</div>
				<div class="single-slider pt-100 pb-145 bg-img"
					style="background-image: url(img/slider/12.jpg);">
					<div class="row">
						<div class="col-md-12">
							<div class="slider-content-3 slider-animated-1 pl-100">
								<h1>
									Wake The <br>of Thrones
								</h1>
								<p class="slider-sale">
									<span class="sale1">-20%</span> <span class="sale2"> <strong>£80.00</strong>
										£60.00
									</span>
								</p>
								<a href="#">Shop now!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- slider-area-end -->
	
	<!-- ***************************************************************************************************************************** -->
	<!-- ADDING IMAGES HERE-->

	<!-- featured-area-start -->
	<div class="new-book-area pt-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title section-title-res text-center mb-30">
						<h2>Featured</h2>
					</div>
				</div>
			</div>
			<div class="tab-active owl-carousel">
				<c:forEach var="book" items="${bookList }">
					<div class="tab-total">
						<!-- single-product-start -->

						<div class="product-wrapper">
							<div class="product-img">
								<a href="#"> <img src="img/product/1.jpg" alt="book"
									class="primary" />
								</a>
								<div class="quick-view">
									<a class="action-view" href="#" data-bs-target="#productModal"
										data-bs-toggle="modal" title="Quick View"> <i
										class="fa fa-search-plus"></i>
									</a>
								</div>
								<div class="product-flag">
									<ul>
										<li><span class="sale">new</span> <br></li>

									</ul>
								</div>
							</div>
							<div class="product-details text-center">
								<div class="product-rating">
									<ul>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
									</ul>
								</div>

								<h4>
									<a href="details?bookId=${book.isbn }">${book.title }</a>
								</h4>


								<div class="product-price">
									<ul>
										<li>${book.price }</li>
									</ul>
								</div>
							</div>
							<div class="product-link">
								<div class="product-button">
									<a href="cart?command=ADD_FROM_INDEX&bookId=${book.isbn }"
										title="Add to cart"><i class="fa fa-shopping-cart"></i>Add
										to cart</a>
								</div>
								<div class="add-to-link">
									<ul>
										<li><a href="product-details.html" title="Details"><i
												class="fa fa-external-link"></i></a></li>
									</ul>
								</div>
							</div>
						</div>

					</div>
				</c:forEach>
				<!-- single-product-end -->




			</div>
			<!-- featured-area-start -->
			<!-- banner-area-start -->
			<div class="banner-area-5 mtb-100">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="banner-img-2">
								<a href="#"><img src="img/banner/5.jpg" alt="banner" /></a>
								<div class="banner-text">
									<h3>G. Meyer Books & Spiritual Traveler Press</h3>
									<h2>Sale up to 30% off</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- banner-area-end -->
			<!-- bestseller-area-start -->
			<div class="bestseller-area pb-100">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 col-md-12 col-12">
							<div class="deal-active owl-carousel">
								<div class="single-deal">
									<div class="deal-off-day">
										<div class="deal-off-day-title">
											<h1>DEALS OF THE DAY</h1>
										</div>
										<h2>
											<a href="#">Sprite Yoga <br />Straps1
											</a>
										</h2>
										<div class="sale-area">
											<div class="price-box">
												<span class="old-sale">$38.00</span> <span class="new-sale">$36.00</span>
											</div>
										</div>
										<p>Long printed dress with thin adjustable straps.
											V-neckline and wiring under the bust with ruffles at the
											bottom of the dress.</p>
										<div class="timer">
											<div data-countdown="2023/5/15"></div>
										</div>
									</div>
									<div class="banner-img-3">
										<a href="#"><img src="img/product/3.jpg" alt="banner" /></a>
									</div>
								</div>
								<div class="single-deal">
									<div class="deal-off-day">
										<h2>
											<a href="#">Rival Field <br>Messenger
											</a>
										</h2>
										<div class="sale-area">
											<div class="price-box">
												<span class="old-sale">$99.00</span> <span class="new-sale">$50.00</span>
											</div>
										</div>
										<p>Long printed dress with thin adjustable straps.
											V-neckline and wiring under the bust with ruffles at the
											bottom of the dress.</p>
										<div class="timer">
											<div data-countdown="2023/08/20"></div>
										</div>
									</div>
									<div class="banner-img-3">
										<a href="#"><img src="img/product/11.jpg" alt="banner" /></a>
									</div>
								</div>
								<div class="single-deal">
									<div class="deal-off-day">
										<h2>
											<a href="#">Voyage Yoga <br /> Bag
											</a>
										</h2>
										<div class="sale-area">
											<div class="price-box">
												<span class="old-sale">$80.00</span> <span class="new-sale">$70.00</span>
											</div>
										</div>
										<p>Long printed dress with thin adjustable straps.
											V-neckline and wiring under the bust with ruffles at the
											bottom of the dress.</p>
										<div class="timer">
											<div data-countdown="2023/12/15"></div>
										</div>
									</div>
									<div class="banner-img-3">
										<a href="#"><img src="img/product/15.jpg" alt="banner" /></a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-12 col-12">
							<div class="bestseller-active owl-carousel">
								<div class="bestseller-total">
									<div class="single-bestseller mb-25">
										<div class="bestseller-img">
											<a href="#"><img src="img/product/13.jpg" alt="book" /></a>
										</div>
										<div class="bestseller-text text-center">
											<h3>
												<a href="#">Rival Messenger</a>
											</h3>
											<div class="price">
												<ul>
													<li><span class="new-price">$40.00</span></li>
													<li><span class="old-price">$45.00</span></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-bestseller">
										<div class="bestseller-img">
											<a href="#"><img src="img/product/14.jpg" alt="book" /></a>
										</div>
										<div class="bestseller-text text-center">
											<h3>
												<a href="#">Impulse Duffle</a>
											</h3>
											<div class="price">
												<ul>
													<li><span class="new-price">$70.00</span></li>
													<li><span class="old-price">$74.00</span></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="bestseller-total">
									<div class="single-bestseller mb-25">
										<div class="bestseller-img">
											<a href="#"><img src="img/product/15.jpg" alt="book" /></a>
										</div>
										<div class="bestseller-text text-center">
											<h3>
												<a href="#">Voyage Yoga Bag</a>
											</h3>
											<div class="price">
												<ul>
													<li><span class="new-price">$30.00</span></li>
													<li><span class="old-price">$32.00</span></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-bestseller">
										<div class="bestseller-img">
											<a href="#"><img src="img/product/16.jpg" alt="book" /></a>
										</div>
										<div class="bestseller-text text-center">
											<h3>
												<a href="#">Compete Track Tote</a>
											</h3>
											<div class="price">
												<ul>
													<li><span class="new-price">$32.00</span></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="bestseller-total">
									<div class="single-bestseller mb-25">
										<div class="bestseller-img">
											<a href="#"><img src="img/product/17.jpg" alt="book" /></a>
										</div>
										<div class="bestseller-text text-center">
											<h3>
												<a href="#">Fusion Backpack </a>
											</h3>
											<div class="price">
												<ul>
													<li><span class="new-price">$59.00</span></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-bestseller">
										<div class="bestseller-img">
											<a href="#"><img src="img/product/14.jpg" alt="book" /></a>
										</div>
										<div class="bestseller-text text-center">
											<h3>
												<a href="#">Impulse Duffle</a>
											</h3>
											<div class="price">
												<ul>
													<li><span class="new-price">$70.00</span></li>
													<li><span class="old-price">$74.00</span></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- bestseller-area-end -->
			<!-- product-area-start -->
			<div class="product-area pb-100">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="section-title bt text-center pt-100 mb-50">
								<h2>Our Products</h2>
								<p>
									Browse the collection of our best selling and top interresting
									products. <br /> ll definitely find what you are looking for.
								</p>
							</div>
						</div>
						<div class="col-lg-12">
							<!-- tab-menu-start -->
							<div class="tab-menu mb-40 text-center">
								<ul class="nav justify-content-center">
									<li><a class="active" href="#Audiobooks"
										data-bs-toggle="tab">New Arrival</a></li>
									<li><a href="#books" data-bs-toggle="tab">OnSale</a></li>
									<li><a href="#bussiness" data-bs-toggle="tab">Featured
											Products</a></li>
								</ul>
							</div>
							<!-- tab-menu-end -->
						</div>
					</div>
					<!-- tab-area-start -->
					<div class="tab-content">
						<div class="tab-pane fade show active" id="Audiobooks">
							<div class="tab-active owl-carousel">
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/1.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="sale">new</span> <br></li>
												<li><span class="discount-percentage">-5%</span></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Joust Duffle Bag</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$60.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/3.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="sale">new</span> <br></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Chaz Kangeroo Hoodie</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$52.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/5.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="sale">new</span> <br></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Set of Sprite Yoga Straps</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$34.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/7.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="sale">new</span> <br></li>
												<li><span class="discount-percentage">-5%</span></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Strive Shoulder Pack</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$30.00</li>
												<li class="old-price">$32.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/9.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="discount-percentage">-5%</span></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Wayfarer Messenger Bag</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$35.00</li>
												<li class="old-price">40.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/11.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="sale">new</span> <br></li>
												<li><span class="discount-percentage">-5%</span></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Impulse Duffle</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$74.00</li>
												<li class="old-price">78.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
							</div>
						</div>
						<div class="tab-pane fade" id="books">
							<div class="tab-active owl-carousel">
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/5.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="sale">new</span> <br></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Chaz Kangeroo Hoodie</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$52.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/7.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="sale">new</span></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Strive Shoulder Pack</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$30.00</li>
												<li class="old-price">$32.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/1.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="sale">new</span></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Joust Duffle Bag</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$60.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/3.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="sale">new</span> <br></li>
												<li><span class="discount-percentage">-5%</span></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Chaz Kangeroo Hoodie</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$52.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/9.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="sale">new</span> <br></li>
												<li><span class="discount-percentage">-5%</span></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Wayfarer Messenger Bag</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$35.00</li>
												<li class="old-price">40.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/11.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="discount-percentage">-5%</span></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Impulse Duffle</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$74.00</li>
												<li class="old-price">78.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
							</div>
						</div>
						<div class="tab-pane fade" id="bussiness">
							<div class="tab-active owl-carousel">
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/9.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="sale">new</span> <br></li>
												<li><span class="discount-percentage">-5%</span></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Wayfarer Messenger Bag</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$35.00</li>
												<li class="old-price">40.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/11.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="sale">new</span></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Impulse Duffle</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$74.00</li>
												<li class="old-price">78.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/1.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="sale">new</span> <br></li>
												<li><span class="discount-percentage">-5%</span></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Joust Duffle Bag</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$60.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/3.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="sale">new</span></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Chaz Kangeroo Hoodie</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$52.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/5.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="sale">new</span></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Set of Sprite Yoga Straps</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$34.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#"> <img src="img/product/7.jpg" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" href="#"
												data-bs-target="#productModal" data-bs-toggle="modal"
												title="Quick View"> <i class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="discount-percentage">-5%</span></li>
											</ul>
										</div>
									</div>
									<div class="product-details text-center">
										<div class="product-rating">
											<ul>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
												<li><a href="#"><i class="fa fa-star"></i></a></li>
											</ul>
										</div>
										<h4>
											<a href="#">Strive Shoulder Pack</a>
										</h4>
										<div class="product-price">
											<ul>
												<li>$30.00</li>
												<li class="old-price">$32.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i
												class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a href="product-details.html" title="Details"><i
														class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
							</div>
						</div>
					</div>
					<!-- tab-area-end -->
				</div>
			</div>
			<!-- product-area-end -->
			<!-- most-product-area-start -->
			<div class="most-product-area pb-100">
				<div class="container">
					<div class="row bt-3 pt-95">
						<div class="col-lg-3 col-md-4 col-12">
							<div class="section-title-2 mb-30">
								<h3>Book</h3>
							</div>
							<div class="product-active-2 owl-carousel">
								<div class="product-total-2">
									<div class="single-most-product bd mb-18">
										<div class="most-product-img">
											<a href="#"><img src="img/product/20.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Endeavor Daytrip</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$30.00</li>
													<li class="old-price">$33.00</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-most-product bd mb-18">
										<div class="most-product-img">
											<a href="#"><img src="img/product/21.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Savvy Shoulder Tote</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$30.00</li>
													<li class="old-price">$35.00</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-most-product">
										<div class="most-product-img">
											<a href="#"><img src="img/product/22.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Compete Track Tote</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$35.00</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="product-total-2">
									<div class="single-most-product bd mb-18">
										<div class="most-product-img">
											<a href="#"><img src="img/product/23.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Voyage Yoga Bag</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$30.00</li>
													<li class="old-price">$33.00</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-most-product bd mb-18">
										<div class="most-product-img">
											<a href="#"><img src="img/product/24.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Impulse Duffle</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$70.00</li>
													<li class="old-price">$74.00</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-most-product">
										<div class="most-product-img">
											<a href="#"><img src="img/product/22.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Fusion Backpack</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$59.00</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-4 col-12">
							<div class="section-title-2 mb-30">
								<h3>Audio books</h3>
							</div>
							<div class="product-active-2 owl-carousel">
								<div class="product-total-2">
									<div class="single-most-product bd mb-18">
										<div class="most-product-img">
											<a href="#"><img src="img/product/23.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Voyage Yoga Bag</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$30.00</li>
													<li class="old-price">$33.00</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-most-product bd mb-18">
										<div class="most-product-img">
											<a href="#"><img src="img/product/24.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Impulse Duffle</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$70.00</li>
													<li class="old-price">$74.00</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-most-product">
										<div class="most-product-img">
											<a href="#"><img src="img/product/26.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Driven Backpack1</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$40.00</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="product-total-2">
									<div class="single-most-product bd mb-18">
										<div class="most-product-img">
											<a href="#"><img src="img/product/20.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Endeavor Daytrip</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$30.00</li>
													<li class="old-price">$33.00</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-most-product bd mb-18">
										<div class="most-product-img">
											<a href="#"><img src="img/product/21.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Savvy Shoulder Tote</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$30.00</li>
													<li class="old-price">$35.00</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-most-product">
										<div class="most-product-img">
											<a href="#"><img src="img/product/22.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Compete Track Tote</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$35.00</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-4 col-12">
							<div class="section-title-2 mb-30">
								<h3>children’s books</h3>
							</div>
							<div class="product-active-2 owl-carousel">
								<div class="product-total-2">
									<div class="single-most-product bd mb-18">
										<div class="most-product-img">
											<a href="#"><img src="img/product/27.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Crown Summit</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$36.00</li>
													<li class="old-price">$38.00</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-most-product bd mb-18">
										<div class="most-product-img">
											<a href="#"><img src="img/product/28.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Driven Backpack</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$34.00</li>
													<li class="old-price">$36.00</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-most-product">
										<div class="most-product-img">
											<a href="#"><img src="img/product/29.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Endeavor Daytrip</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$30.00</li>
													<li class="old-price">$33.00</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="product-total-2">
									<div class="single-most-product bd mb-18">
										<div class="most-product-img">
											<a href="#"><img src="img/product/23.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Voyage Yoga Bag</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$30.00</li>
													<li class="old-price">$33.00</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-most-product bd mb-18">
										<div class="most-product-img">
											<a href="#"><img src="img/product/24.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Impulse Duffle</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$70.00</li>
													<li class="old-price">$74.00</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="single-most-product">
										<div class="most-product-img">
											<a href="#"><img src="img/product/22.jpg" alt="book" /></a>
										</div>
										<div class="most-product-content">
											<div class="product-rating">
												<ul>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
													<li><a href="#"><i class="fa fa-star"></i></a></li>
												</ul>
											</div>
											<h4>
												<a href="#">Fusion Backpack</a>
											</h4>
											<div class="product-price">
												<ul>
													<li>$59.00</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-12 col-12">
							<div class="block-newsletter">
								<h2>Sign up for send newsletter</h2>
								<p>You can be always up to date with our company new!</p>
								<form action="#">
									<input type="text" placeholder="Enter your email address" />
								</form>
								<a href="#">Send Email</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- most-product-area-end -->
			<!-- recent-post-area-start -->
			<div class="recent-post-area pb-100">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div
								class="section-title section-title-res pt-100 bt-3 text-center mb-30">
								<h2>Latest from our blog</h2>
							</div>
						</div>
						<div class="post-active owl-carousel text-center">
							<div class="col-lg-12">
								<div class="single-post">
									<div class="post-img">
										<a href="#"><img src="img/post/1.jpg" alt="post" /></a>
										<div class="blog-date-time">
											<span class="day-time">06</span> <span class="moth-time">Dec</span>
										</div>
									</div>
									<div class="post-content">
										<h3>
											<a href="#">The History and the Hype</a>
										</h3>
										<span class="meta-author"> Demo koparion </span>
										<p>Discover five of our favourite dresses from our new
											collection that are destined to be worn and loved
											immediately.</p>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="single-post">
									<div class="post-img">
										<a href="#"><img src="img/post/2.jpg" alt="post" /></a>
										<div class="blog-date-time">
											<span class="day-time">06</span> <span class="moth-time">Dec</span>
										</div>
									</div>
									<div class="post-content">
										<h3>
											<a href="#">Answers to your Questions</a>
										</h3>
										<span class="meta-author"> Demo koparion </span>
										<p>Discover five of our favourite dresses from our new
											collection that are destined to be worn and loved
											immediately.</p>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="single-post">
									<div class="post-img">
										<a href="#"><img src="img/post/3.jpg" alt="post" /></a>
										<div class="blog-date-time">
											<span class="day-time">06</span> <span class="moth-time">Dec</span>
										</div>
									</div>
									<div class="post-content">
										<h3>
											<a href="#">What is Bootstrap?</a>
										</h3>
										<span class="meta-author"> Demo koparion </span>
										<p>Discover five of our favourite dresses from our new
											collection that are destined to be worn and loved
											immediately.</p>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="single-post">
									<div class="post-img">
										<a href="#"><img src="img/post/4.jpg" alt="post" /></a>
										<div class="blog-date-time">
											<span class="day-time">06</span> <span class="moth-time">Dec</span>
										</div>
									</div>
									<div class="post-content">
										<h3>
											<a href="#">Etiam eros massa</a>
										</h3>
										<span class="meta-author"> Demo koparion </span>
										<p>Discover five of our favourite dresses from our new
											collection that are destined to be worn and loved
											immediately.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- recent-post-area-end -->
			<!-- banner-area-start -->
			<div class="banner-area banner-res-large pb-70">
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-md-6 col-sm-6 col-12">
							<div class="single-banner mb-30">
								<div class="banner-img">
									<a href="#"><img src="img/banner/1.png" alt="banner" /></a>
								</div>
								<div class="banner-text">
									<h4>Free shipping item</h4>
									<p>For all orders over $500</p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6 col-12">
							<div class="single-banner mb-30">
								<div class="banner-img">
									<a href="#"><img src="img/banner/2.png" alt="banner" /></a>
								</div>
								<div class="banner-text">
									<h4>Money back guarantee</h4>
									<p>100% money back guarante</p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6 col-12">
							<div class="single-banner mb-30">
								<div class="banner-img">
									<a href="#"><img src="img/banner/3.png" alt="banner" /></a>
								</div>
								<div class="banner-text">
									<h4>Cash on delivery</h4>
									<p>Lorem ipsum dolor consect</p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6 col-12">
							<div class="single-banner mb-30">
								<div class="banner-img">
									<a href="#"><img src="img/banner/4.png" alt="banner" /></a>
								</div>
								<div class="banner-text">
									<h4>Help & Support</h4>
									<p>Call us : + 0123.4567.89</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- banner-area-end -->
			<!-- social-group-area-start -->
			<div class="social-group-area ptb-60 bt">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 col-md-6 col-12">
							<div class="section-title-3">
								<h3>Latest Tweets</h3>
							</div>
							<div class="twitter-content">
								<div class="twitter-icon">
									<a href="#"><i class="fa fa-twitter"></i></a>
								</div>
								<div class="twitter-text">
									<p>Claritas est etiam processus dynamicus, qui sequitur
										mutationem consuetudium lectorum. Mirum notare quam</p>
									<a href="#">koparion</a>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-12">
							<div class="section-title-3">
								<h3>Stay Connected</h3>
							</div>
							<div class="link-follow">
								<ul>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-youtube"></i></a></li>
									<li><a href="#"><i class="fa fa-flickr"></i></a></li>
									<li><a href="#"><i class="fa fa-vimeo"></i></a></li>
									<li><a href="#"><i class="fa fa-instagram"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- social-group-area-end -->
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
							<div class="col-lg-8 col-12">
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
							<div class="col-lg-4 col-12">
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
			<!-- Modal -->
			<div class="modal fade" id="productModal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">x</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-md-5 col-sm-5 col-xs-12">
									<div class="modal-tab">
										<div class="product-details-large tab-content">
											<div class="tab-pane active" id="image-1">
												<img src="img/product/quickview-l4.jpg" alt="" />
											</div>
											<div class="tab-pane" id="image-2">
												<img src="img/product/quickview-l2.jpg" alt="" />
											</div>
											<div class="tab-pane" id="image-3">
												<img src="img/product/quickview-l3.jpg" alt="" />
											</div>
											<div class="tab-pane" id="image-4">
												<img src="img/product/quickview-l5.jpg" alt="" />
											</div>
										</div>
										<div
											class="product-details-small quickview-active owl-carousel">
											<a class="active" href="#image-1"><img
												src="img/product/quickview-s4.jpg" alt="" /></a> <a
												href="#image-2"><img src="img/product/quickview-s2.jpg"
												alt="" /></a> <a href="#image-3"><img
												src="img/product/quickview-s3.jpg" alt="" /></a> <a
												href="#image-4"><img src="img/product/quickview-s5.jpg"
												alt="" /></a>
										</div>
									</div>
								</div>
								<div class="col-md-7 col-sm-7 col-xs-12">
									<div class="modal-pro-content">
										<h3>Chaz Kangeroo Hoodie3</h3>
										<div class="price">
											<span>$70.00</span>
										</div>
										<p>Pellentesque habitant morbi tristique senectus et netus
											et malesuada fames ac turpis egestas. Vestibulum tortor quam,
											feugiat vitae, ultricies eget, tempor sit amet.</p>
										<div class="quick-view-select">
											<div class="select-option-part">
												<label>Size*</label> <select class="select">
													<option value="">S</option>
													<option value="">M</option>
													<option value="">L</option>
												</select>
											</div>
											<div class="quickview-color-wrap">
												<label>Color*</label>
												<div class="quickview-color">
													<ul>
														<li class="blue">b</li>
														<li class="red">r</li>
														<li class="pink">p</li>
													</ul>
												</div>
											</div>
										</div>
										<form action="#">
											<input type="number" value="1" />
											<button>Add to cart</button>
										</form>
										<span><i class="fa fa-check"></i> In stock</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal end -->



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
</body>

</html>