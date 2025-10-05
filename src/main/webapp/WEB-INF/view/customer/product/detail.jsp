<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>${product.name} - Gundam Shop</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">

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
                    <meta name="_csrf_header" content="${_csrf.headerName}" />

                    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
                        rel="stylesheet">
                    
                    <style>
                        /* Modern Product Detail Styles */
                        .product-detail-container {
                            background: white;
                            border-radius: 20px;
                            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                            overflow: hidden;
                            margin-bottom: 40px;
                        }

                        .product-image-section {
                            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
                            padding: 30px;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            min-height: 400px;
                        }

                        .product-image {
                            max-width: 100%;
                            max-height: 400px;
                            object-fit: contain;
                            border-radius: 15px;
                            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                            transition: transform 0.3s ease;
                        }

                        .product-image:hover {
                            transform: scale(1.05);
                        }

                        .product-info-section {
                            padding: 40px;
                        }

                        .product-title {
                            font-size: 2.5rem;
                            font-weight: 800;
                            color: #2d3748;
                            margin-bottom: 15px;
                            line-height: 1.2;
                        }

                        .product-brand {
                            color: #667eea;
                            font-size: 1.1rem;
                            font-weight: 600;
                            margin-bottom: 20px;
                            display: flex;
                            align-items: center;
                            gap: 8px;
                        }

                        .product-price {
                            font-size: 2rem;
                            font-weight: 800;
                            color: #e53e3e;
                            margin-bottom: 25px;
                            display: flex;
                            align-items: center;
                            gap: 10px;
                        }

                        .price-label {
                            font-size: 1rem;
                            color: #718096;
                            font-weight: 500;
                        }

                        .product-rating {
                            display: flex;
                            align-items: center;
                            gap: 10px;
                            margin-bottom: 25px;
                        }

                        .rating-stars {
                            display: flex;
                            gap: 5px;
                        }

                        .rating-stars i {
                            color: #fbb040;
                            font-size: 1.2rem;
                        }

                        .rating-text {
                            color: #718096;
                            font-weight: 500;
                        }

                        .product-description {
                            color: #4a5568;
                            font-size: 1.1rem;
                            line-height: 1.7;
                            margin-bottom: 30px;
                        }

                        .product-actions {
                            display: flex;
                            gap: 15px;
                            margin-bottom: 30px;
                            flex-wrap: wrap;
                        }

                        .quantity-control {
                            display: flex;
                            align-items: center;
                            background: #f7fafc;
                            border-radius: 25px;
                            padding: 5px;
                            border: 2px solid #e2e8f0;
                        }

                        .quantity-btn {
                            background: white;
                            border: none;
                            width: 40px;
                            height: 40px;
                            border-radius: 50%;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            font-size: 1.2rem;
                            color: #667eea;
                            cursor: pointer;
                            transition: all 0.3s ease;
                            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                        }

                        .quantity-btn:hover {
                            background: #667eea;
                            color: white;
                            transform: scale(1.1);
                        }

                        .quantity-input {
                            border: none;
                            background: transparent;
                            text-align: center;
                            font-size: 1.1rem;
                            font-weight: 600;
                            color: #2d3748;
                            width: 60px;
                            margin: 0 10px;
                        }

                        .btn-primary-custom {
                            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                            border: none;
                            color: white;
                            padding: 15px 30px;
                            border-radius: 25px;
                            font-weight: 600;
                            font-size: 1rem;
                            transition: all 0.3s ease;
                            display: flex;
                            align-items: center;
                            gap: 10px;
                            text-decoration: none;
                        }

                        .btn-primary-custom:hover {
                            transform: translateY(-2px);
                            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
                            color: white;
                        }

                        .btn-secondary-custom {
                            background: linear-gradient(135deg, #4a5568 0%, #2d3748 100%);
                            border: none;
                            color: white;
                            padding: 15px 30px;
                            border-radius: 25px;
                            font-weight: 600;
                            font-size: 1rem;
                            transition: all 0.3s ease;
                            display: flex;
                            align-items: center;
                            gap: 10px;
                            text-decoration: none;
                        }

                        .btn-secondary-custom:hover {
                            transform: translateY(-2px);
                            box-shadow: 0 10px 25px rgba(74, 85, 104, 0.4);
                            color: white;
                        }

                        .btn-disabled {
                            background: #cbd5e0;
                            color: #718096;
                            cursor: not-allowed;
                        }

                        .btn-disabled:hover {
                            transform: none;
                            box-shadow: none;
                        }

                        /* Product Details Tabs */
                        .product-tabs {
                            background: white;
                            border-radius: 20px;
                            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                            overflow: hidden;
                            margin-bottom: 40px;
                        }

                        .tab-header {
                            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                            padding: 20px 30px;
                        }

                        .tab-title {
                            color: white;
                            font-size: 1.5rem;
                            font-weight: 700;
                            margin: 0;
                        }

                        .tab-content {
                            padding: 30px;
                        }

                        .tab-description {
                            color: #4a5568;
                            font-size: 1.1rem;
                            line-height: 1.8;
                            margin-bottom: 20px;
                        }

                        .product-specs {
                            display: grid;
                            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                            gap: 20px;
                            margin-top: 20px;
                        }

                        .spec-item {
                            background: #f7fafc;
                            padding: 20px;
                            border-radius: 15px;
                            border-left: 4px solid #667eea;
                        }

                        .spec-label {
                            font-weight: 600;
                            color: #2d3748;
                            margin-bottom: 5px;
                        }

                        .spec-value {
                            color: #718096;
                        }

                        /* Reviews Section */
                        .reviews-section {
                            background: white;
                            border-radius: 20px;
                            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                            overflow: hidden;
                        }

                        .reviews-header {
                            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                            padding: 20px 30px;
                            display: flex;
                            align-items: center;
                            justify-content: space-between;
                        }

                        .reviews-title {
                            color: white;
                            font-size: 1.5rem;
                            font-weight: 700;
                            margin: 0;
                        }

                        .reviews-count {
                            color: rgba(255, 255, 255, 0.8);
                            font-size: 1rem;
                        }

                        .reviews-content {
                            padding: 30px;
                        }

                        .review-item {
                            background: #f7fafc;
                            border-radius: 15px;
                            padding: 25px;
                            margin-bottom: 20px;
                            border-left: 4px solid #667eea;
                            transition: transform 0.3s ease;
                        }

                        .review-item:hover {
                            transform: translateX(5px);
                        }

                        .review-header {
                            display: flex;
                            align-items: center;
                            gap: 15px;
                            margin-bottom: 15px;
                        }

                        .reviewer-avatar {
                            width: 50px;
                            height: 50px;
                            border-radius: 50%;
                            object-fit: cover;
                            border: 3px solid #667eea;
                        }

                        .reviewer-info {
                            flex: 1;
                        }

                        .reviewer-name {
                            font-weight: 600;
                            color: #2d3748;
                            margin-bottom: 5px;
                        }

                        .review-rating {
                            display: flex;
                            gap: 3px;
                        }

                        .review-rating i {
                            color: #fbb040;
                            font-size: 0.9rem;
                        }

                        .review-content {
                            color: #4a5568;
                            line-height: 1.6;
                            font-style: italic;
                        }

                        .review-hidden {
                            color: #a0aec0;
                            font-style: italic;
                        }

                        /* Breadcrumb */
                        .breadcrumb-section {
                            background: #f7fafc;
                            padding: 20px 0;
                            margin-bottom: 30px;
                            border-radius: 15px;
                        }

                        .breadcrumb {
                            background: transparent;
                            padding: 0;
                            margin: 0;
                        }

                        .breadcrumb-item a {
                            color: #667eea;
                            text-decoration: none;
                            font-weight: 500;
                            transition: color 0.3s ease;
                        }

                        .breadcrumb-item a:hover {
                            color: #764ba2;
                        }

                        .breadcrumb-item.active {
                            color: #718096;
                        }

                        /* Responsive Design */
                        @media (max-width: 768px) {
                            .product-title {
                                font-size: 2rem;
                            }
                            
                            .product-actions {
                                flex-direction: column;
                            }
                            
                            .product-info-section {
                                padding: 25px;
                            }
                            
                            .product-image-section {
                                padding: 20px;
                                min-height: 300px;
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

                    <!-- Product Detail Start -->
                    <div class="container-fluid py-5 mt-5">
                        <div class="container">
                            <!-- Breadcrumb -->
                            <div class="breadcrumb-section">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                                        <li class="breadcrumb-item"><a href="/category?categoryId=${product.category.id}">${product.category.name}</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">${product.name}</li>
                                    </ol>
                                </nav>
                            </div>

                            <!-- Product Detail Container -->
                            <div class="product-detail-container">
                                <div class="row g-0">
                                    <!-- Product Image -->
                                    <div class="col-lg-6">
                                        <div class="product-image-section">
                                            <img src="/images/product/${product.image}" 
                                                 class="product-image" 
                                                 alt="${product.name}">
                                        </div>
                                    </div>
                                    
                                    <!-- Product Info -->
                                    <div class="col-lg-6">
                                        <div class="product-info-section">
                                            <h1 class="product-title">${product.name}</h1>
                                            
                                            <div class="product-brand">
                                                <i class="fas fa-tag"></i>
                                                ${product.factory.name}
                                            </div>
                                            
                                            <div class="product-price">
                                                <span class="price-label">Price:</span>
                                                <fmt:formatNumber type="number" value="${product.price}" /> đ
                                            </div>
                                            
                                            <div class="product-rating">
                                                <div class="rating-stars">
                                                    <c:forEach var="i" begin="1" end="5">
                                                        <i class="fa fa-star ${i <= averageRating ? 'text-warning' : 'text-muted'}"></i>
                                                    </c:forEach>
                                                </div>
                                                <span class="rating-text">(${averageRating}/5)</span>
                                            </div>
                                            
                                            <p class="product-description">
                                                ${product.shortDesc}
                                            </p>

                                            <div class="product-actions">
                                                <c:choose>
                                                    <c:when test="${product.quantity > 0}">
                                                        <!-- Quantity Control -->
                                                        <div class="quantity-control">
                                                            <button class="quantity-btn" onclick="decreaseQuantity()">
                                                                <i class="fa fa-minus"></i>
                                                            </button>
                                                            <input type="text" 
                                                                   class="quantity-input" 
                                                                   id="quantity" 
                                                                   value="1" 
                                                                   readonly>
                                                            <button class="quantity-btn" onclick="increaseQuantity()">
                                                                <i class="fa fa-plus"></i>
                                                            </button>
                                                        </div>

                                                        <!-- Add to Cart Form -->
                                                        <form action="/add-product-from-view-detail" method="post" style="display: inline;">
                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                            <input type="hidden" name="id" value="${product.id}" />
                                                            <input type="hidden" name="quantity" id="cartQuantity" value="1" />
                                                            <button type="submit" class="btn-primary-custom">
                                                                <i class="fas fa-shopping-cart"></i>
                                                                Add to Cart
                                                            </button>
                                                        </form>

                                                        <!-- Wishlist Form -->
                                                        <form action="/wishlist/add/${product.id}" method="post" style="display: inline;">
                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                            <input type="hidden" name="id" value="${product.id}" />
                                                            <button type="submit" class="btn-secondary-custom">
                                                                <i class="fas fa-heart"></i>
                                                                Add to Wishlist
                                                            </button>
                                                        </form>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="btn-primary-custom btn-disabled" disabled>
                                                            <i class="fas fa-times-circle"></i>
                                                            Out of Stock
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Product Details Tabs -->
                            <div class="product-tabs">
                                <div class="tab-header">
                                    <h3 class="tab-title">Product Details</h3>
                                </div>
                                <div class="tab-content">
                                    <p class="tab-description">
                                        ${product.detailDesc}
                                    </p>
                                    
                                    <div class="product-specs">
                                        <div class="spec-item">
                                            <div class="spec-label">Material</div>
                                            <div class="spec-value">${product.material}</div>
                                        </div>
                                        <div class="spec-item">
                                            <div class="spec-label">Category</div>
                                            <div class="spec-value">${product.category.name}</div>
                                        </div>
                                        <div class="spec-item">
                                            <div class="spec-label">Brand</div>
                                            <div class="spec-value">${product.factory.name}</div>
                                        </div>
                                        <div class="spec-item">
                                            <div class="spec-label">Stock</div>
                                            <div class="spec-value">${product.quantity} units</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Reviews Section -->
                            <div class="reviews-section">
                                <div class="reviews-header">
                                    <h3 class="reviews-title">Customer Reviews</h3>
                                    <span class="reviews-count">${reviews.size()} reviews</span>
                                </div>
                                <div class="reviews-content">
                                    <c:choose>
                                        <c:when test="${not empty reviews}">
                                            <c:forEach var="review" items="${reviews}">
                                                <div class="review-item">
                                                    <div class="review-header">
                                                        <img src="/images/avatar/${review.user.avatar}" 
                                                             alt="${review.user.fullName}" 
                                                             class="reviewer-avatar">
                                                        <div class="reviewer-info">
                                                            <div class="reviewer-name">${review.user.fullName}</div>
                                                            <div class="review-rating">
                                                                <c:forEach begin="1" end="5">
                                                                    <i class="fa fa-star ${i <= review.rating ? 'text-warning' : 'text-muted'}"></i>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="review-content">
                                                        <c:choose>
                                                            <c:when test="${review.visible == 'Yes'}">
                                                                ${review.reviewContent}
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="review-hidden">
                                                                    This review has been hidden due to inappropriate content.
                                                                </span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="text-center py-5">
                                                <i class="fas fa-comments fa-3x text-muted mb-3"></i>
                                                <p class="text-muted">No reviews yet. Be the first to review this product!</p>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Product Detail End -->

                    <jsp:include page="../layout/footer.jsp" />

                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top">
                        <i class="fa fa-arrow-up"></i>
                    </a>

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
                        // Quantity control functions
                        function decreaseQuantity() {
                            const input = document.getElementById('quantity');
                            const cartInput = document.getElementById('cartQuantity');
                            let value = parseInt(input.value);
                            if (value > 1) {
                                value--;
                                input.value = value;
                                cartInput.value = value;
                            }
                        }

                        function increaseQuantity() {
                            const input = document.getElementById('quantity');
                            const cartInput = document.getElementById('cartQuantity');
                            const maxQuantity = parseInt('${product.quantity}');
                            let value = parseInt(input.value);
                            if (value < maxQuantity) {
                                value++;
                                input.value = value;
                                cartInput.value = value;
                            }
                        }

                        // Smooth scroll for back to top
                        document.querySelector('.back-to-top').addEventListener('click', function(e) {
                            e.preventDefault();
                            window.scrollTo({
                                top: 0,
                                behavior: 'smooth'
                            });
                        });

                        // Add loading animation
                        document.addEventListener('DOMContentLoaded', function() {
                            const productImage = document.querySelector('.product-image');
                            if (productImage) {
                                productImage.style.opacity = '0';
                                productImage.style.transform = 'scale(0.9)';
                                productImage.style.transition = 'all 0.6s ease';
                                
                                setTimeout(() => {
                                    productImage.style.opacity = '1';
                                    productImage.style.transform = 'scale(1)';
                                }, 300);
                            }
                        });
                    </script>
                </body>

                </html>