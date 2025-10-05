<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Home Page - Laptop Shop & Repair Service</title>

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/client/css/style.css" rel="stylesheet">

                <meta name="_csrf" content="${_csrf.token}" />
                <!-- default header name is X-CSRF-TOKEN -->
                <meta name="_csrf_header" content="${_csrf.headerName}" />

                <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
                    rel="stylesheet">
                <style>
                    /* Banner and Layout Fixes */
                    #hero-banner {
                        margin-top: -80px;
                        padding-top: 80px;
                        position: relative;
                        z-index: 1;
                    }

                    .carousel-caption {
                        position: absolute;
                        top: 50%;
                        left: 50%;
                        transform: translate(-50%, -50%);
                        text-align: center;
                        z-index: 10;
                    }

                    .carousel-caption h2 {
                        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);
                        margin-bottom: 20px;
                    }

                    .carousel-caption p {
                        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.8);
                        margin-bottom: 25px;
                    }

                    .carousel-caption .btn:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.4);
                    }



                    /* News Ticker */
                    .news-section {
                        background: white;
                        border-radius: 20px;
                        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                        padding: 25px;
                        margin-bottom: 50px;
                    }

                    .news-header {
                        display: flex;
                        align-items: center;
                        gap: 15px;
                        margin-bottom: 20px;
                        padding-bottom: 15px;
                        border-bottom: 2px solid #f1f5f9;
                    }

                    .news-icon {
                        font-size: 1.8rem;
                        color: #e53e3e;
                        animation: pulse 2s infinite;
                    }

                    .news-title {
                        font-size: 1.5rem;
                        font-weight: 700;
                        color: #2d3748;
                        margin: 0;
                    }

                    .news-ticker {
                        width: 100%;
                        overflow: hidden;
                        white-space: nowrap;
                        box-sizing: border-box;
                        position: relative;
                        background: linear-gradient(135deg, #f7fafc 0%, #edf2f7 100%);
                        border-radius: 15px;
                        padding: 15px 20px;
                    }

                    .news-ticker ul {
                        display: inline-block;
                        padding-left: 100%;
                        animation: ticker 40s linear infinite;
                        margin: 0;
                        padding: 0;
                    }

                    .news-ticker li {
                        display: inline-block;
                        margin-right: 60px;
                        font-size: 1rem;
                        color: #4a5568;
                    }

                    .news-ticker a {
                        color: inherit;
                        text-decoration: none;
                        transition: color 0.3s ease;
                    }

                    .news-ticker a:hover {
                        color: #667eea;
                    }

                    @keyframes ticker {
                        0% { transform: translateX(100%); }
                        100% { transform: translateX(-100%); }
                    }

                    @keyframes pulse {
                        0%, 100% { transform: scale(1); }
                        50% { transform: scale(1.1); }
                    }

                    /* Products Section */
                    .products-section {
                        padding: 60px 0;
                    }

                    .section-header {
                        text-align: center;
                        margin-bottom: 50px;
                    }

                    .section-title {
                        font-size: 2.5rem;
                        font-weight: 800;
                        color: #2d3748;
                        margin-bottom: 15px;
                    }

                    .section-subtitle {
                        font-size: 1.1rem;
                        color: #6b7280;
                        max-width: 600px;
                        margin: 0 auto;
                    }

                    /* Product Grid */
                    .products-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                        gap: 30px;
                        margin-bottom: 50px;
                    }

                    .product-card {
                        background: white;
                        border-radius: 20px;
                        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
                        overflow: hidden;
                        transition: all 0.3s ease;
                        position: relative;
                    }

                    .product-card:hover {
                        transform: translateY(-10px);
                        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
                    }

                    .product-image-container {
                        position: relative;
                        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
                        padding: 20px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        min-height: 250px;
                    }

                    .product-image {
                        max-width: 100%;
                        max-height: 200px;
                        object-fit: contain;
                        border-radius: 15px;
                        transition: transform 0.3s ease;
                    }

                    .product-card:hover .product-image {
                        transform: scale(1.05);
                    }

                    .product-category-badge {
                        position: absolute;
                        top: 15px;
                        left: 15px;
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                        padding: 8px 16px;
                        border-radius: 20px;
                        font-size: 0.8rem;
                        font-weight: 600;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                    }

                    .product-info {
                        padding: 25px;
                    }

                    .product-name {
                        font-size: 1.1rem;
                        font-weight: 700;
                        color: #2d3748;
                        margin-bottom: 10px;
                        line-height: 1.4;
                        display: -webkit-box;
                        -webkit-line-clamp: 2;
                        -webkit-box-orient: vertical;
                        overflow: hidden;
                    }

                    .product-name a {
                        color: inherit;
                        text-decoration: none;
                        transition: color 0.3s ease;
                    }

                    .product-name a:hover {
                        color: #667eea;
                    }

                    .product-description {
                        color: #6b7280;
                        font-size: 0.9rem;
                        line-height: 1.5;
                        margin-bottom: 15px;
                        display: -webkit-box;
                        -webkit-line-clamp: 2;
                        -webkit-box-orient: vertical;
                        overflow: hidden;
                    }

                    .product-price {
                        font-size: 1.3rem;
                        font-weight: 800;
                        color: #e53e3e;
                        margin-bottom: 20px;
                        text-align: center;
                    }

                    .product-actions {
                        display: flex;
                        gap: 10px;
                    }

                    .btn-add-cart {
                        flex: 1;
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                        border: none;
                        padding: 12px 20px;
                        border-radius: 12px;
                        font-weight: 600;
                        font-size: 0.9rem;
                        cursor: pointer;
                        transition: all 0.3s ease;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        gap: 8px;
                    }

                    .btn-add-cart:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
                        color: white;
                    }

                    /* Category Sections */
                    .category-section {
                        margin-bottom: 60px;
                    }

                    .category-header {
                        display: flex;
                        align-items: center;
                        gap: 15px;
                        margin-bottom: 30px;
                        padding-bottom: 15px;
                        border-bottom: 2px solid #f1f5f9;
                    }

                    .category-icon {
                        font-size: 2rem;
                        color: #667eea;
                    }

                    .category-title {
                        font-size: 2rem;
                        font-weight: 700;
                        color: #2d3748;
                        margin: 0;
                    }

                    /* Chat Icon */
                    #chat-icon {
                        position: fixed;
                        bottom: 100px;
                        right: 30px;
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                        width: 60px;
                        height: 60px;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        border-radius: 50%;
                        cursor: pointer;
                        box-shadow: 0 10px 30px rgba(102, 126, 234, 0.3);
                        font-size: 24px;
                        transition: all 0.3s ease;
                        z-index: 1000;
                    }

                    #chat-icon:hover {
                        transform: scale(1.1);
                        box-shadow: 0 15px 40px rgba(102, 126, 234, 0.4);
                    }

                    /* Responsive Design */
                    @media (max-width: 768px) {
                        .hero-title {
                            font-size: 2.5rem;
                        }
                        
                        .hero-stats {
                            flex-direction: column;
                            gap: 20px;
                        }
                        
                        .products-grid {
                            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                            gap: 20px;
                        }
                        
                        .category-title {
                            font-size: 1.5rem;
                        }
                    }

                    /* Loading Animation */
                    .loading {
                        animation: pulse 1.5s infinite;
                    }

                    @keyframes pulse {
                        0% { opacity: 1; }
                        50% { opacity: 0.7; }
                        100% { opacity: 1; }
                    }
                </style>
            </head>

            <body>

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->

                <jsp:include page="../layout/header.jsp" />

                <!-- Flash Messages -->
                <c:if test="${not empty success}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert" style="margin: 20px; border-radius: 15px; border: none; box-shadow: 0 5px 15px rgba(0,0,0,0.1);">
                        <i class="fas fa-check-circle me-2"></i>
                        ${success}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert" style="margin: 20px; border-radius: 15px; border: none; box-shadow: 0 5px 15px rgba(0,0,0,0.1);">
                        <i class="fas fa-exclamation-circle me-2"></i>
                        ${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <!-- Banner Section -->
                <jsp:include page="../layout/banner.jsp" />

                <div class="container">
                    <!-- News Section -->
                    <div class="news-section">
                        <div class="news-header">
                            <i class="fas fa-bell news-icon"></i>
                            <h3 class="news-title">Hot News & Updates</h3>
                        </div>
                        <div class="news-ticker">
                            <ul class="list-unstyled d-inline-block mb-0">
                                <c:forEach var="news" items="${newsList}">
                                    <li class="d-inline-block me-5">
                                        <a href="/news/${news.id}">
                                            ${news.title}
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                    <!-- Featured Products Section -->
                    <div class="products-section">
                        <div class="section-header">
                            <h2 class="section-title">Featured Products</h2>
                            <p class="section-subtitle">Handpicked products for you to explore</p>
                        </div>
                        
                        <div class="products-grid">
                            <c:set var="count" value="0" />
                            <c:forEach var="product" items="${products}">
                                <c:if test="${count < 4}">
                                    <c:if test="${product.quantity > 0}">
                                        <div class="product-card">
                                            <div class="product-image-container">
                                                <img src="/images/product/${product.image}"
                                                     class="product-image" 
                                                     alt="${product.name}">
                                                <div class="product-category-badge">
                                                    ${product.category.name}
                                                </div>
                                            </div>
                                            <div class="product-info">
                                                <h4 class="product-name">
                                                    <a href="/product/${product.id}">${product.name}</a>
                                                </h4>
                                                <p class="product-description">${product.shortDesc}</p>
                                                <div class="product-price">
                                                    <fmt:formatNumber type="number" value="${product.price}" /> đ
                                                </div>
                                                <div class="product-actions">
                                                    <form action="/add-product-to-cart/${product.id}" method="post" style="width: 100%;">
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                        <button type="submit" class="btn-add-cart">
                                                            <i class="fas fa-shopping-cart"></i>
                                                            Add to Cart
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <c:set var="count" value="${count + 1}" />
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- Category Products -->
                    <c:forEach var="category" items="${categories}">
                        <div class="category-section">
                            <div class="category-header">
                                <i class="fas fa-tags category-icon"></i>
                                <h3 class="category-title">${category.name}</h3>
                            </div>
                            
                            <div class="products-grid">
                                <c:set var="count" value="0" />
                                <c:forEach var="product" items="${category.products}">
                                    <c:if test="${count < 4}">
                                        <c:if test="${product.quantity > 0}">
                                            <div class="product-card">
                                                <div class="product-image-container">
                                                    <img src="/images/product/${product.image}"
                                                         class="product-image" 
                                                         alt="${product.name}">
                                                    <div class="product-category-badge">
                                                        ${category.name}
                                                    </div>
                                                </div>
                                                <div class="product-info">
                                                    <h4 class="product-name">
                                                        <a href="/product/${product.id}">${product.name}</a>
                                                    </h4>
                                                    <p class="product-description">${product.shortDesc}</p>
                                                    <div class="product-price">
                                                        <fmt:formatNumber type="number" value="${product.price}" /> đ
                                                    </div>
                                                    <div class="product-actions">
                                                        <form action="/add-product-to-cart/${product.id}" method="post" style="width: 100%;">
                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                            <button type="submit" class="btn-add-cart">
                                                                <i class="fas fa-shopping-cart"></i>
                                                                Add to Cart
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:set var="count" value="${count + 1}" />
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <jsp:include page="../layout/feature.jsp" />

                <jsp:include page="../layout/footer.jsp" />

                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top">
                    <i class="fa fa-arrow-up"></i>
                </a>

                <!-- Chat Icon -->
                <div id="chat-icon" onclick="redirectToCareService()">
                    <i class="fas fa-comment-alt"></i>
                </div>

                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>

                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
                
                <script>
                    // Product description truncation
                    document.querySelectorAll('.product-description').forEach(function (desc) {
                        const words = desc.textContent.trim().split(/\s+/);
                        if (words.length > 8) {
                            desc.textContent = words.slice(0, 8).join(' ') + '...';
                        }
                    });

                    // Chat service redirect
                    function redirectToCareService() {
                        window.location.href = "/careservice";
                    }

                    // Smooth scroll for back to top
                    document.querySelector('.back-to-top').addEventListener('click', function(e) {
                        e.preventDefault();
                        window.scrollTo({
                            top: 0,
                            behavior: 'smooth'
                        });
                    });

                    // Product card animations
                    document.addEventListener('DOMContentLoaded', function() {
                        const productCards = document.querySelectorAll('.product-card');
                        productCards.forEach((card, index) => {
                            setTimeout(() => {
                                card.style.opacity = '0';
                                card.style.transform = 'translateY(20px)';
                                card.style.transition = 'all 0.6s ease';
                                
                                setTimeout(() => {
                                    card.style.opacity = '1';
                                    card.style.transform = 'translateY(0)';
                                }, 100);
                            }, index * 100);
                        });
                    });

                    // Hero section parallax effect
                    window.addEventListener('scroll', function() {
                        const scrolled = window.pageYOffset;
                        const hero = document.querySelector('.hero-section');
                        if (hero) {
                            hero.style.transform = `translateY(${scrolled * 0.5}px)`;
                        }
                    });
                </script>
            </body>

            </html>