<%@page import="book.store.service.GenreService"%>
<%@page import="book.store.entity.Genre"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Koparion â Book Shop HTML5 Template</title>
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
    <body class="product-details">
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
													<a href="cart?command=REMOVE_CART&bookId=${item.value.isbn}"><i class="fa fa-remove"></i></a>
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
											<a class="view-cart" href="cart?command=VIEW_CART">view cart</a> 
											 
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
								<li><a href="#" class="active">product-details</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- breadcrumbs-area-end -->
		<!-- product-main-area-start -->
		<div class="product-main-area mb-70">
			<div class="container">
				<div class="row">
					<div class="col-lg-9 col-md-12 col-12 order-lg-1 order-1">
						<!-- product-main-area-start -->
						<div class="product-main-area">
							<div class="row">
								<div class="col-lg-5 col-md-6 col-12">
									<div class="flexslider">
										<ul class="slides">
											<li data-thumb="img/thum-2/1.jpg">
											  <img src="img/flex/1.jpg" alt="woman" />
											</li>
											<li data-thumb="img/thum-2/4.jpg">
											  <img src="img/flex/5.jpg" alt="woman" />
											</li>
											<li data-thumb="img/thum-2/2.jpg">
											  <img src="img/flex/2.jpg" alt="woman" />
											</li>
											<li data-thumb="img/thum-2/5.jpg">
											  <img src="img/flex/5.jpg" alt="woman" />
											</li>
										</ul>
									</div>
								</div>
								<div class="col-lg-7 col-md-6 col-12">
									<div class="product-info-main">
										<div class="page-title">
											<h1>${book.title}</h1>
										</div>
										<div class="product-info-stock-sku">
											<span>In stock</span>
											<div class="product-attribute">
												<span>SKU</span>
												<span class="value">24-WB05</span>
											</div>
										</div>
										<div class="product-reviews-summary">
											<div class="rating-summary">
												<a href="#"><i class="fa fa-star"></i></a>
												<a href="#"><i class="fa fa-star"></i></a>
												<a href="#"><i class="fa fa-star"></i></a>
												<a href="#"><i class="fa fa-star"></i></a>
												<a href="#"><i class="fa fa-star"></i></a>
											</div>
											<div class="reviews-actions">
												<a href="#">3 Reviews</a>
												<a href="#" class="view">Add Your Review</a>
											</div>
										</div>
										<div class="product-info-price">
											<div class="price-final">
												<span>${book.price}</span>
												<span><a href="#"> Author : ${author.name}</a></span>
											</div>
										</div>
										<div class="product-add-form">
											<form action="cart">
												<div class="quality-button">
													<input class="qty" type="number" value="1">
												</div>
												<a href="cart?command=ADD_TO_CART&bookId=${book.isbn}">Add to cart</a>
											</form>
										</div>
										<div class="product-social-links">
											<div class="product-addto-links">
												<a href="#"><i class="fa fa-heart"></i></a>
												<a href="#"><i class="fa fa-pie-chart"></i></a>
												<a href="#"><i class="fa fa-envelope-o"></i></a>
											</div>
											<div class="product-addto-links-text">
												<p>Powerwalking to the gym or strolling to the local coffeehouse, the Savvy Shoulder Tote lets you stash your essentials in sporty style! A top-loading compartment provides quick and easy access to larger items, while zippered pockets on the front and side hold cash, credit cards and phone.</p>
											</div>
										</div>
									</div>
								</div>
							</div>	
						</div>
						<!-- product-main-area-end -->
						<!-- product-info-area-start -->
						<div class="product-info-area mt-80">
							<!-- Nav tabs -->
							<ul class="nav">
								<li><a class="active" href="#Details" data-bs-toggle="tab">Details</a></li>
								<li><a href="#Reviews" data-bs-toggle="tab">Reviews 3</a></li>
							</ul>
							<div class="tab-content">
                                <div class="tab-pane fade show active" id="Details">
                                    <div class="valu">
                                      <p>The sporty Joust Duffle Bag can't be beat - not in the gym, not on the luggage carousel, not anywhere. Big enough to haul a basketball or soccer ball and some sneakers with plenty of room to spare, it's ideal for athletes with places to go.</p>
                                      <ul>
                                        <li><i class="fa fa-circle"></i>Dual top handles.</li>
                                        <li><i class="fa fa-circle"></i>Adjustable shoulder strap.</li>
                                        <li><i class="fa fa-circle"></i>Full-length zipper.</li>
                                        <li><i class="fa fa-circle"></i>L 29" x W 13" x H 11".</li>
                                      </ul>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="Reviews">
                                    <div class="valu valu-2">
                                        <div class="section-title mb-60 mt-60">
                                            <h2>Customer Reviews</h2>
                                        </div>
                                        <ul>
                                            <li>
                                                <div class="review-title">
                                                    <h3>themes</h3>
                                                </div>
                                                <div class="review-left">
                                                    <div class="review-rating">
                                                        <span>Price</span>
                                                        <div class="rating-result">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="review-rating">
                                                        <span>Value</span>
                                                        <div class="rating-result">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="review-rating">
                                                        <span>Quality</span>
                                                        <div class="rating-result">
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                            <a href="#"><i class="fa fa-star"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="review-right">
                                                    <div class="review-content">
                                                        <h4>themes </h4>
                                                    </div>
                                                    <div class="review-details">
                                                        <p class="review-author">Review by<a href="#">plaza</a></p>
                                                        <p class="review-date">Posted on <span>12/9/16</span></p>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <div class="review-add">
                                            <h3>You're reviewing:</h3>
                                            <h4>Joust Duffle Bag</h4>
                                        </div>
                                        <div class="review-field-ratings">
                                            <span>Your Rating <sup>*</sup></span>
                                            <div class="control">
                                                <div class="single-control">
                                                    <span>Value</span>
                                                    <div class="review-control-vote">
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                    </div>
                                                </div>
                                                <div class="single-control">
                                                    <span>Quality</span>
                                                    <div class="review-control-vote">
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                    </div>
                                                </div>
                                                <div class="single-control">
                                                    <span>Price</span>
                                                    <div class="review-control-vote">
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review-form">
                                            <div class="single-form">
                                                <label>Nickname <sup>*</sup></label>
                                                <form action="#">
                                                    <input type="text" />
                                                </form>
                                            </div>
                                            <div class="single-form single-form-2">
                                                <label>Summary <sup>*</sup></label>
                                                <form action="#">
                                                    <input type="text" />
                                                </form>
                                            </div>
                                            <div class="single-form">
                                                <label>Review <sup>*</sup></label>
                                                <form action="#">
                                                    <textarea name="massage" cols="10" rows="4"></textarea>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="review-form-button">
                                            <a href="#">Submit Review</a>
                                        </div>
                                    </div>
                                </div>
                            </div>	
						</div>
						<!-- product-info-area-end -->
						<!-- new-book-area-start -->
						<div class="new-book-area mt-60">
							<div class="section-title text-center mb-30">
								<h3>upsell products</h3>
							</div>
							<div class="tab-active-2 owl-carousel">
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#">
											<img src="img/product/1.jpg" alt="book" class="primary" />
										</a>
										<div class="quick-view">
                                            <a class="action-view" href="#" data-bs-target="#productModal" data-bs-toggle="modal" title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                        </div>
                                        <div class="product-flag">
                                            <ul>
                                                <li><span class="sale">new</span></li>
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
										<h4><a href="#">Joust Duffle Bag</a></h4>
										<div class="product-price">
											<ul>
												<li>$60.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
                                            <ul>
                                                <li><a href="product-details.html" title="Details"><i class="fa fa-external-link"></i></a></li>
                                            </ul>
                                        </div>
									</div>	
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#">
											<img src="img/product/3.jpg" alt="book" class="primary" />
										</a>
										<div class="quick-view">
                                            <a class="action-view" href="#" data-bs-target="#productModal" data-bs-toggle="modal" title="Quick View">
                                                <i class="fa fa-search-plus"></i>
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
										<h4><a href="#">Chaz Kangeroo Hoodie</a></h4>
										<div class="product-price">
											<ul>
												<li>$52.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
                                            <ul>
                                                <li><a href="product-details.html" title="Details"><i class="fa fa-external-link"></i></a></li>
                                            </ul>
                                        </div>
									</div>	
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#">
											<img src="img/product/5.jpg" alt="book" class="primary" />
										</a>
										<div class="quick-view">
                                            <a class="action-view" href="#" data-bs-target="#productModal" data-bs-toggle="modal" title="Quick View">
                                                <i class="fa fa-search-plus"></i>
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
										<h4><a href="#">Set of Sprite Yoga Straps</a></h4>
										<div class="product-price">
											<ul>
												<li> <span>Starting at</span>$34.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
                                            <ul>
                                                <li><a href="product-details.html" title="Details"><i class="fa fa-external-link"></i></a></li>
                                            </ul>
                                        </div>
									</div>	
								</div>
								<!-- single-product-end -->
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a href="#">
											<img src="img/product/7.jpg" alt="book" class="primary" />
										</a>
										<div class="quick-view">
                                            <a class="action-view" href="#" data-bs-target="#productModal" data-bs-toggle="modal" title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                        </div>
                                        <div class="product-flag">
                                            <ul>
                                                <li><span class="sale">new</span></li>
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
										<h4><a href="#">Strive Shoulder Pack</a></h4>
										<div class="product-price">
											<ul>
												<li>$30.00</li>
												<li class="old-price">$32.00</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<a href="#" title="Add to cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<div class="add-to-link">
                                            <ul>
                                                <li><a href="product-details.html" title="Details"><i class="fa fa-external-link"></i></a></li>
                                            </ul>
                                        </div>
									</div>	
								</div>
								<!-- single-product-end -->	
							</div>
						</div>
						<!-- new-book-area-start -->
					</div>
					<div class="col-lg-3 col-md-12 col-12 order-lg-2 order-2">
						<div class="shop-left">
							<div class="left-title mb-20">
								<h4>Related Products</h4>
							</div>
							<div class="random-area mb-30">
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
												<h4><a href="#">Endeavor Daytrip</a></h4>
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
												<h4><a href="#">Savvy Shoulder Tote</a></h4>
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
												<h4><a href="#">Compete Track Tote</a></h4>
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
												<h4><a href="#">Voyage Yoga Bag</a></h4>
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
												<h4><a href="#">Impulse Duffle</a></h4>
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
												<h4><a href="#">Fusion Backpack</a></h4>
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
							<div class="banner-area mb-30">
								<div class="banner-img-2">
									<a href="#"><img src="img/banner/33.jpg" alt="banner" /></a>
								</div>
							</div>
							<div class="left-title-2 mb-30">
								<h2>Compare Products</h2>
								<p>You have no items to compare.</p>
							</div>
							<div class="left-title-2">
								<h2>My Wish List</h2>
								<p>You have no items in your wish list.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- product-main-area-end -->
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
                                        <span>My Company</span>
                                        Your address goes here.
                                    </p>
                                    <p><span>Call us now:</span> 0123456789</p>
                                    <p><span>Email:</span>  demo@example.com</p>
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
								<p>&copy; 2022 <strong> Koparion </strong> Mede with â¤ï¸ by <a href="https://hasthemes.com/" target="_blank"><strong>HasThemes</strong></a></p>
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
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
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
                                    <div class="product-details-small quickview-active owl-carousel">
                                        <a class="active" href="#image-1"><img src="img/product/quickview-s4.jpg" alt="" /></a>
                                        <a href="#image-2"><img src="img/product/quickview-s2.jpg" alt="" /></a>
                                        <a href="#image-3"><img src="img/product/quickview-s3.jpg" alt="" /></a>
                                        <a href="#image-4"><img src="img/product/quickview-s5.jpg" alt="" /></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7 col-sm-7 col-xs-12">
                                <div class="modal-pro-content">
                                    <h3>Chaz Kangeroo Hoodie3</h3>
                                    <div class="price">
                                        <span>$70.00</span>
                                    </div>
                                    <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet.</p>	
                                    <div class="quick-view-select">
                                        <div class="select-option-part">
                                            <label>Size*</label>
                                            <select class="select">
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
