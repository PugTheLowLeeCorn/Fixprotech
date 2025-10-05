<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title> Sản Phẩm - Legoshop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
        rel="stylesheet">
    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
        rel="stylesheet">
    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet">
    <!-- CSRF Security Tokens -->
    <meta name="_csrf" content="${_csrf.token}" />
    <meta name="_csrf_header" content="${_csrf.headerName}" />
    <!-- Toast Notification Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
        rel="stylesheet">
    <style>
        .page-link.disabled {
            color: var(--bs-pagination-disabled-color);
            pointer-events: none;
            background-color: var(--bs-pagination-disabled-bg);
        }
        /* Container sản phẩm */
        .custom-product-blog {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            /* Tăng khoảng cách giữa các sản phẩm */
            justify-content: center;
            padding: 20px;
            /* Tạo khoảng cách giữa sản phẩm với viền ngoài */
        }
        /* Cấu trúc sản phẩm */
        .custom-product-blog .product-item {
            flex: 0 0 calc(33.333% - 20px);
            /* 3 sản phẩm trên mỗi hàng */
            max-width: calc(33.333% - 20px);
            box-sizing: border-box;
            margin-bottom: 24px;
            padding: 15px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            /* Hiệu ứng bóng */
            transition: transform 0.2s ease-in-out;
        }
        /* Hiệu ứng hover cho sản phẩm */
        .custom-product-blog .product-item:hover {
            transform: translateY(-5px);
        }
        /* Điều chỉnh khi màn hình nhỏ hơn */
        @media (max-width: 1024px) {
            .custom-product-blog .product-item {
                flex: 0 0 calc(50% - 20px);
                /* 2 sản phẩm trên mỗi hàng */
                max-width: calc(50% - 20px);
            }
        }
        @media (max-width: 768px) {
            .custom-product-blog .product-item {
                flex: 0 0 calc(100% - 20px);
                /* 1 sản phẩm trên mỗi hàng */
                max-width: calc(100% - 20px);
            }
        }
        /* Hình ảnh sản phẩm */
        .custom-product-blog .product-item img {
            width: 100%;
            height: 220px;
            /* Cao hơn để đồng đều */
            object-fit: cover;
            border-radius: 8px;
        }
        /* Mô tả sản phẩm */
        .custom-product-blog .product-item .product-desc {
            font-size: 14px;
            color: #555;
            margin-top: 8px;
            text-align: center;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        /* Nút bấm */
        .custom-product-blog .product-item .btn {
            margin-top: 10px;
            width: 100%;
            text-align: center;
            padding: 12px;
            border-radius: 20px;
            background: #62f826;
            color: black;
            font-weight: bold;
            transition: background 0.3s;
        }
        /* Hiệu ứng hover cho nút */
        .custom-product-blog .product-item .btn:hover {
            background: #1e600b;
        }
        #chat-icon {
            position: fixed;
            bottom: 100px;
            right: 30px;
            background-color: #007bff;
            color: white;
            width: 50px;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
            cursor: pointer;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            font-size: 24px;
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

    <!-- Single Product Start -->
    <div class="container-fluid py-5 mt-5">
        <div class="container py-5">
            <div class="row g-4 mb-5">
                <div>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Products List
                            </li>
                        </ol>
                    </nav>
                </div>
                <div class="row g-4 fruite">
                    <div class="col-12 col-md-4">
                        <div style="margin-bottom: 15px; padding: 10px; background: #e3f2fd; border-radius: 5px; border-left: 4px solid #2196f3;">
                            <small style="color: #1976d2;">
                                <i class="fas fa-info-circle"></i> 
                                <strong>Tip:</strong> Select a Product Type first to see only relevant brands and targets for that category.
                            </small>
                        </div>
                        <div class="row g-4">
                            <div class="col-12" id="typeFilter">
                                <div class="mb-2"><b>Product Type</b></div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio"
                                        name="type" id="type-all" value=""
                                        <c:if test="${param.type == null || param.type == ''}">checked</c:if>>
                                    <label class="form-check-label" for="type-all">All Types</label>
                                </div>
                                <c:forEach var="type" items="${types}">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio"
                                            name="type" id="type-${type.id}" value="${type.id}"
                                            <c:if test="${param.type == type.id}">checked</c:if>>
                                        <label class="form-check-label"
                                            for="type-${type.id}">${type.name}</label>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="col-12" id="factoryFilter">
                                <div class="mb-2"><b>Brand</b></div>
                                <c:forEach var="factory" items="${factories}">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox"
                                            name="factory" id="factory-${factory.id}" value="${factory.id}"
                                            <c:if test="${fn:contains(param.factory, factory.id)}">checked</c:if>>
                                        <label class="form-check-label"
                                            for="factory-${factory.id}">${factory.name}</label>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="col-12" id="targetFilter">
                                <div class="mb-2"><b>Classify</b></div>
                                <c:forEach var="target" items="${targets}">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox"
                                            name="target" id="target-${target.id}" value="${target.id}"
                                            <c:if test="${fn:contains(param.target, target.id)}">checked</c:if>>
                                        <label class="form-check-label"
                                            for="target-${target.id}">${target.name}</label>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="col-12" id="priceFilter">
                                <div class="mb-2"><b>Prices</b></div>
                                <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="price-2"
                                            value="duoi-10-trieu" name="price"
                                            <c:if test="${fn:contains(param.price, 'duoi-10-trieu')}">checked</c:if>>
                                    <label class="form-check-label" for="price-2">Under 10 million</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="price-3"
                                        value="10-15-trieu" name="price"
                                        <c:if test="${fn:contains(param.price, '10-15-trieu')}">checked</c:if>>
                                    <label class="form-check-label" for="price-3">Between 10 - 15 million</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="price-4"
                                        value="15-20-trieu" name="price"
                                        <c:if test="${fn:contains(param.price, '15-20-trieu')}">checked</c:if>>
                                    <label class="form-check-label" for="price-4">From 15 - 20 Million</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="price-5"
                                        value="tren-20-trieu" name="price"
                                        <c:if test="${fn:contains(param.price, 'tren-20-trieu')}">checked</c:if>>
                                    <label class="form-check-label" for="price-5">Above 20 Million</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="col-12">
                                    <div class="mb-2"><b>Sorting</b></div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" id="sort-1"
                                            value="priceAsc" name="sort"
                                            <c:if test="${param.sort == 'priceAsc'}">checked</c:if>>
                                        <label class="form-check-label" for="sort-1">Price increase</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" id="sort-2"
                                            value="priceDesc" name="sort"
                                            <c:if test="${param.sort == 'priceDesc'}">checked</c:if>>
                                        <label class="form-check-label" for="sort-2">Price decrease</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" id="sort-3"
                                            value="priceNone" name="sort"
                                            <c:if test="${param.sort == null || param.sort == 'priceNone'}">checked</c:if>>
                                        <label class="form-check-label" for="sort-3">Non sorting</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <button
                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4"
                                    id="btnFilter" onclick="applyFilters()">
                                    Products sorting
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-8 text-center">
                        <div class="row g-4">
                            <c:if test="${totalPages ==  0}">
                                <div>Products not found !!! </div>
                            </c:if>
                            <div class="custom-product-blog">
                                <c:forEach var="product" items="${products}">
                                    <c:if test="${product.status == true}">
                                        <div class="product-item">
                                            <div class="rounded position-relative">
                                                <div class="fruite-img">
                                                    <img src="/images/product/${product.image}"
                                                        class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                    style="top: 10px; left: 10px;">
                                                    ${product.category.name}
                                                </div>
                                                <div
                                                    class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4 style="font-size: 15px;">
                                                        <a
                                                            href="/product/${product.id}">${product.name}</a>
                                                    </h4>
                                                    <p class="product-desc">${product.shortDesc}</p>
                                                    <p style="font-size: 15px; text-align: center; width: 100%;"
                                                        class="text-dark fw-bold mb-3">
                                                        <fmt:formatNumber type="number"
                                                            value="${product.price}" /> đ
                                                    </p>
                                                    <c:choose>
                                                        <c:when test="${product.quantity > 0}">
                                                            <form
                                                                action="/add-products-to-cart/${product.id}"
                                                                method="post">
                                                                <input type="hidden"
                                                                    name="${_csrf.parameterName}"
                                                                    value="${_csrf.token}" />
                                                                <button type="submit" class="btn-add-cart">
                                                                    <i class="fas fa-shopping-cart"></i>
                                                                    Add to Cart
                                                                </button>
                                                            </form>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button class="btn btn-secondary"
                                                                disabled>Sold Out</button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <c:if test="${totalPages > 0}">
                                <div class="pagination d-flex justify-content-center mt-5">
                                    <li class="page-item">
                                        <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                            href="/products?page=${currentPage - 1}${queryString}"
                                            aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                        <li class="page-item">
                                            <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                                href="/products?page=${loop.index + 1}${queryString}">
                                                ${loop.index + 1}
                                            </a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                        <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                            href="/products?page=${currentPage + 1}${queryString}"
                                            aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Single Product End -->
    <jsp:include page="../layout/footer.jsp" />
    <!-- Back to Top -->
    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
            class="fa fa-arrow-up"></i></a>
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/easing/easing.min.js"></script>
    <script src="/client/lib/waypoints/waypoints.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
    <!-- Template Javascript -->
    <script src="/client/js/main.js"></script>
    <script>
        document.querySelectorAll('.product-desc').forEach(function (desc) {
            const words = desc.textContent.trim().split(/\s+/);
            if (words.length > 4) {
                desc.textContent = words.slice(0, 4).join(' ') + '...';
            }
        });

function applyFilters() {
    const url = new URL(window.location.href);
    const params = new URLSearchParams();

    // Add selected type filter
    const type = document.querySelector('input[name="type"]:checked');
    if (type) {
        params.set('type', type.value);
    }

    // Add selected factory filters
    const factoryValues = [];
    document.querySelectorAll('input[name="factory"]:checked').forEach(el => {
        factoryValues.push(el.value);
    });
    if (factoryValues.length > 0) {
        params.set('factory', factoryValues.join(','));
    }

    // Add selected target filters
    const targetValues = [];
    document.querySelectorAll('input[name="target"]:checked').forEach(el => {
        targetValues.push(el.value);
    });
    if (targetValues.length > 0) {
        params.set('target', targetValues.join(','));
    }

    // Add selected price filters
    const priceValues = [];
    document.querySelectorAll('input[name="price"]:checked').forEach(el => {
        priceValues.push(el.value);
    });
    if (priceValues.length > 0) {
        params.set('price', priceValues.join(','));
    }

    // Add selected sort filter
    const sort = document.querySelector('input[name="sort"]:checked');
    if (sort) {
        params.set('sort', sort.value);
    }

    // Reset to first page on filter change
    params.set('page', '1');

    // Show loading spinner
    document.getElementById('spinner').classList.add('show');

    // Redirect with updated query params
    window.location.href = url.pathname + '?' + params.toString();
}

// Auto-submit when type changes
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('input[name="type"]').forEach(function(radio) {
        radio.addEventListener('change', function() {
            // Clear factory and target selections when type changes
            document.querySelectorAll('input[name="factory"]:checked').forEach(el => el.checked = false);
            document.querySelectorAll('input[name="target"]:checked').forEach(el => el.checked = false);
            
            // Apply filters immediately
            applyFilters();
        });
    });
});

        document.getElementById('btnFilter').addEventListener('click', function (e) {
            e.preventDefault();
            applyFilters();
        });
    </script>
    <div id="chat-icon" onclick="redirectToCareService()">
        <i class="fas fa-comment-alt"></i>
    </div>
    <script>
        function redirectToCareService() {
            window.location.href = "/careservice";
        }
    </script>
</body>
</html>
