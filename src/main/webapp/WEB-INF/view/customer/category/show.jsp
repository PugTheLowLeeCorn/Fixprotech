<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>${selectedCategory != null ? selectedCategory.name : 'Products'} - Gundam Shop</title>

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
                    /* Modern Category Page Styles */
                    .category-header {
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                        padding: 60px 0;
                        margin-bottom: 40px;
                        border-radius: 0 0 30px 30px;
                    }

                    .category-title {
                        font-size: 3rem;
                        font-weight: 800;
                        margin-bottom: 10px;
                    }

                    .category-subtitle {
                        font-size: 1.2rem;
                        opacity: 0.9;
                    }

                    .filter-section {
                        background: white;
                        border-radius: 20px;
                        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                        padding: 30px;
                        margin-bottom: 40px;
                    }

                    .filter-header {
                        display: flex;
                        align-items: center;
                        gap: 10px;
                        margin-bottom: 25px;
                        padding-bottom: 15px;
                        border-bottom: 2px solid #f1f5f9;
                    }

                    .filter-icon {
                        font-size: 1.5rem;
                        color: #667eea;
                    }

                    .filter-title {
                        font-size: 1.5rem;
                        font-weight: 700;
                        color: #2d3748;
                        margin: 0;
                    }

                    .filter-tip {
                        background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%);
                        border-radius: 15px;
                        padding: 20px;
                        margin-bottom: 25px;
                        border-left: 4px solid #2196f3;
                    }

                    .filter-tip-content {
                        color: #1976d2;
                        font-size: 0.95rem;
                        margin: 0;
                        display: flex;
                        align-items: center;
                        gap: 10px;
                    }

                    .filter-row {
                        display: grid;
                        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                        gap: 20px;
                        margin-bottom: 20px;
                    }

                    .filter-group {
                        display: flex;
                        flex-direction: column;
                    }

                    .filter-group label {
                        font-weight: 600;
                        margin-bottom: 8px;
                        color: #374151;
                        font-size: 0.95rem;
                    }

                    .filter-group select,
                    .filter-group input {
                        padding: 12px 16px;
                        border: 2px solid #e5e7eb;
                        border-radius: 12px;
                        font-size: 14px;
                        transition: all 0.3s ease;
                        background: #f9fafb;
                    }

                    .filter-group select:focus,
                    .filter-group input:focus {
                        outline: none;
                        border-color: #667eea;
                        background: white;
                        box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
                    }

                    .price-range {
                        display: flex;
                        align-items: center;
                        gap: 15px;
                    }

                    .price-range input {
                        flex: 1;
                        min-width: 120px;
                    }

                    .price-separator {
                        color: #6b7280;
                        font-weight: 600;
                    }

                    .filter-actions {
                        display: flex;
                        gap: 15px;
                        flex-wrap: wrap;
                    }

                    .btn-filter {
                        padding: 12px 24px;
                        border: none;
                        border-radius: 12px;
                        font-weight: 600;
                        font-size: 14px;
                        cursor: pointer;
                        transition: all 0.3s ease;
                        display: flex;
                        align-items: center;
                        gap: 8px;
                    }

                    .btn-apply {
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                    }

                    .btn-apply:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
                        color: white;
                    }

                    .btn-clear {
                        background: linear-gradient(135deg, #6b7280 0%, #4b5563 100%);
                        color: white;
                    }

                    .btn-clear:hover {
                        transform: translateY(-2px);
                        box-shadow: 0 10px 25px rgba(107, 114, 128, 0.4);
                        color: white;
                    }

                    /* Product Grid */
                    .products-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                        gap: 30px;
                        margin-bottom: 40px;
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

                    /* Pagination */
                    .pagination-container {
                        display: flex;
                        justify-content: center;
                        margin-top: 40px;
                    }

                    .pagination {
                        display: flex;
                        gap: 10px;
                        align-items: center;
                    }

                    .page-item {
                        list-style: none;
                    }

                    .page-link {
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        width: 45px;
                        height: 45px;
                        border-radius: 12px;
                        background: white;
                        color: #667eea;
                        text-decoration: none;
                        font-weight: 600;
                        border: 2px solid #e5e7eb;
                        transition: all 0.3s ease;
                    }

                    .page-link:hover {
                        background: #667eea;
                        color: white;
                        border-color: #667eea;
                        transform: translateY(-2px);
                    }

                    .page-item.active .page-link {
                        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        color: white;
                        border-color: #667eea;
                    }

                    .page-item.disabled .page-link {
                        background: #f3f4f6;
                        color: #9ca3af;
                        cursor: not-allowed;
                        transform: none;
                    }

                    /* Empty State */
                    .empty-state {
                        text-align: center;
                        padding: 60px 20px;
                        background: white;
                        border-radius: 20px;
                        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
                    }

                    .empty-icon {
                        font-size: 4rem;
                        color: #9ca3af;
                        margin-bottom: 20px;
                    }

                    .empty-title {
                        font-size: 1.5rem;
                        font-weight: 700;
                        color: #374151;
                        margin-bottom: 10px;
                    }

                    .empty-description {
                        color: #6b7280;
                        font-size: 1rem;
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
                        .category-title {
                            font-size: 2rem;
                        }
                        
                        .filter-row {
                            grid-template-columns: 1fr;
                        }
                        
                        .products-grid {
                            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                            gap: 20px;
                        }
                        
                        .filter-actions {
                            flex-direction: column;
                        }
                        
                        .btn-filter {
                            width: 100%;
                            justify-content: center;
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
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
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

                <!-- Category Header -->
                <div class="category-header">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-8">
                                <h1 class="category-title">${selectedCategory != null ? selectedCategory.name : 'All Products'}</h1>
                                <p class="category-subtitle">Discover amazing products in our collection</p>
                            </div>
                            <div class="col-lg-4 text-end">
                                <div class="d-flex align-items-center justify-content-end gap-3">
                                    <i class="fas fa-box-open fa-2x opacity-75"></i>
                                    <div>
                                        <div class="fw-bold fs-5">${products.size()} Products</div>
                                        <div class="opacity-75">Available now</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Products Section -->
                <div class="container">
                    <!-- Filter Section -->
                    <div class="filter-section">
                        <div class="filter-header">
                            <i class="fas fa-filter filter-icon"></i>
                            <h3 class="filter-title">Filter Products</h3>
                        </div>
                        
                        <div class="filter-tip">
                            <p class="filter-tip-content">
                                <i class="fas fa-lightbulb"></i>
                                <strong>Tip:</strong> Use filters to find products by brand, target, price range, or sort by price for the best shopping experience.
                            </p>
                        </div>
                        
                        <form id="filterForm" method="GET" action="/category">
                            <input type="hidden" name="categoryId" value="${selectedCategory.id}">
                            
                            <div class="filter-row">
                                <div class="filter-group">
                                    <label for="sort">
                                        <i class="fas fa-sort-amount-down me-2"></i>Sort by
                                    </label>
                                    <select name="sort" id="sort">
                                        <option value="">Default</option>
                                        <option value="gia-tang-dan" ${param.sort == 'gia-tang-dan' ? 'selected' : ''}>Price: Low to High</option>
                                        <option value="gia-giam-dan" ${param.sort == 'gia-giam-dan' ? 'selected' : ''}>Price: High to Low</option>
                                    </select>
                                </div>
                                
                                <div class="filter-group">
                                    <label for="factory">
                                        <i class="fas fa-industry me-2"></i>Brand
                                    </label>
                                    <select name="factory" id="factory">
                                        <option value="">All Brands</option>
                                        <c:forEach var="factory" items="${factories}">
                                            <option value="${factory.id}" ${param.factory == factory.id.toString() ? 'selected' : ''}>${factory.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                                <div class="filter-group">
                                    <label for="target">
                                        <i class="fas fa-bullseye me-2"></i>Target
                                    </label>
                                    <select name="target" id="target">
                                        <option value="">All Targets</option>
                                        <c:forEach var="target" items="${targets}">
                                            <option value="${target.id}" ${param.target == target.id.toString() ? 'selected' : ''}>${target.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="filter-row">
                                <div class="filter-group">
                                    <label>
                                        <i class="fas fa-dollar-sign me-2"></i>Price Range (VND)
                                    </label>
                                    <div class="price-range">
                                        <input type="number" name="minPrice" placeholder="Min Price" value="${param.minPrice}" min="0">
                                        <span class="price-separator">-</span>
                                        <input type="number" name="maxPrice" placeholder="Max Price" value="${param.maxPrice}" min="0">
                                    </div>
                                </div>
                                
                                <div class="filter-group">
                                    <label>&nbsp;</label>
                                    <div class="filter-actions">
                                        <button type="submit" class="btn-filter btn-apply">
                                            <i class="fas fa-check"></i>
                                            Apply Filters
                                        </button>
                                        <button type="button" class="btn-filter btn-clear" onclick="clearFilters()">
                                            <i class="fas fa-times"></i>
                                            Clear All
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <!-- Products Grid -->
                    <div class="products-grid">
                        <c:choose>
                            <c:when test="${not empty products}">
                                <c:forEach var="product" items="${products}">
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
                                                    <form action="/add-products-to-cart/${product.id}" method="post" style="width: 100%;">
                                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                        <button type="submit" class="btn-add-cart">
                                                            <i class="fas fa-shopping-cart"></i>
                                                            Add to Cart
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="empty-state">
                                    <i class="fas fa-box-open empty-icon"></i>
                                    <h3 class="empty-title">No Products Found</h3>
                                    <p class="empty-description">
                                        No products available in this category with the current filters. 
                                        Try adjusting your search criteria or browse other categories.
                                    </p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Pagination -->
                    <c:if test="${totalPages > 1}">
                        <div class="pagination-container">
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                        <a class="page-link" href="/category?page=${currentPage - 1}&${queryString}" aria-label="Previous">
                                            <i class="fas fa-chevron-left"></i>
                                        </a>
                                    </li>
                                    <c:forEach begin="1" end="${totalPages}" var="i">
                                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                                            <a class="page-link" href="/category?page=${i}&${queryString}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                        <a class="page-link" href="/category?page=${currentPage + 1}&${queryString}" aria-label="Next">
                                            <i class="fas fa-chevron-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </c:if>
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

                    // Clear filters function
                    function clearFilters() {
                        const categoryId = '${selectedCategory.id}';
                        window.location.href = '/category?categoryId=' + categoryId;
                    }

                    // Auto-submit form when filters change
                    document.getElementById('sort').addEventListener('change', function() {
                        document.getElementById('filterForm').submit();
                    });

                    document.getElementById('factory').addEventListener('change', function() {
                        document.getElementById('filterForm').submit();
                    });

                    document.getElementById('target').addEventListener('change', function() {
                        document.getElementById('filterForm').submit();
                    });

                    // Validate price range
                    document.getElementById('filterForm').addEventListener('submit', function(e) {
                        const minPrice = document.querySelector('input[name="minPrice"]').value;
                        const maxPrice = document.querySelector('input[name="maxPrice"]').value;
                        
                        if (minPrice && maxPrice && parseFloat(minPrice) > parseFloat(maxPrice)) {
                            e.preventDefault();
                            alert('Minimum price cannot be greater than maximum price!');
                            return false;
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
                </script>
            </body>

            </html>