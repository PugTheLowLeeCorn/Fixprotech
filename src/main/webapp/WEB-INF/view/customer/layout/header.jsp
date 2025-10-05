<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
        /* Modern Header Styles */
        .navbar {
            background: rgba(255, 255, 255, 0.95) !important;
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            padding: 15px 0;
        }

        .navbar-brand {
            font-weight: 800;
            font-size: 1.5rem;
            color: #2d3748 !important;
        }

        .nav-link {
            font-weight: 600;
            color: #4a5568 !important;
            transition: all 0.3s ease;
            padding: 10px 15px !important;
            border-radius: 8px;
            margin: 0 5px;
        }

        .nav-link:hover,
        .nav-link.active {
            color: #667eea !important;
            background: rgba(102, 126, 234, 0.1);
            transform: translateY(-2px);
        }

        /* Search Bar */
        .nav-item.search-bar {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 5px;
            position: relative;
            margin: 0 15px;
        }

        .nav-search {
            width: 200px;
            padding: 12px 20px;
            border: 2px solid #e2e8f0;
            border-radius: 25px;
            outline: none;
            font-size: 14px;
            transition: all 0.3s ease;
            background: #f8fafc;
        }

        .nav-search:focus {
            width: 300px;
            border-color: #667eea;
            background: white;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .nav-search::placeholder {
            color: #a0aec0;
            font-style: italic;
        }

        /* Dropdown */
        .dropdown-menu {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 10px 0;
            margin-top: 10px;
        }

        .dropdown-item {
            padding: 10px 20px;
            color: #4a5568;
            transition: all 0.3s ease;
            border-radius: 8px;
            margin: 2px 10px;
        }

        .dropdown-item:hover {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            transform: translateX(5px);
        }

        /* User Actions */
        .user-actions {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .action-icon {
            position: relative;
            color: #4a5568;
            font-size: 1.3rem;
            transition: all 0.3s ease;
            padding: 8px;
            border-radius: 50%;
        }

        .action-icon:hover {
            color: #667eea;
            background: rgba(102, 126, 234, 0.1);
            transform: translateY(-2px);
        }

        .notification-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background: linear-gradient(135deg, #e53e3e 0%, #c53030 100%);
            color: white;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.7rem;
            font-weight: 600;
        }

        .cart-badge {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        /* User Dropdown */
        .user-dropdown {
            position: relative;
        }

        .user-dropdown .dropdown-menu {
            min-width: 280px;
            padding: 20px;
        }

        .user-profile {
            text-align: center;
            padding-bottom: 15px;
            border-bottom: 1px solid #e2e8f0;
            margin-bottom: 15px;
        }

        .user-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            border: 3px solid #667eea;
            margin-bottom: 10px;
        }

        .user-name {
            font-weight: 600;
            color: #2d3748;
            margin: 0;
        }

        /* Logo */
        .nav-logo {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            transition: transform 0.3s ease;
        }

        .nav-logo:hover {
            transform: scale(1.1);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .nav-search {
                width: 150px;
            }
            
            .nav-search:focus {
                width: 200px;
            }
            
            .user-actions {
                gap: 10px;
            }
            
            .action-icon {
                font-size: 1.1rem;
            }
        }

        /* Fix for content being hidden behind fixed header */
        body {
            padding-top: 80px;
        }

        .hero-section {
            margin-top: -80px;
            padding-top: 80px;
        }
    </style>
</head>

<body>
    <!-- Navbar Start -->
    <div class="container-fluid fixed-top">
        <div class="container px-0">
            <nav class="navbar navbar-light navbar-expand-xl">
                <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars text-primary"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between mx-5" id="navbarCollapse">
                    <div class="navbar-nav align-items-center">
                        <li class="nav-item logo-item">
                            <a href="/" class="navbar-brand d-flex align-items-center">
                                <img class="nav-logo me-2" src="/client/img/logo.jpg" alt="Laptop Shop Logo">
                                <span class="d-none d-md-block">Laptop Shop</span>
                            </a>
                        </li>
                        
                        <!-- Search Form -->
                        <form action="/search" method="get" class="nav-item search-bar d-flex" id="searchForm">
                            <input class="nav-search" type="text" name="query" id="searchInput" placeholder="Search laptops, services...">
                            <button type="submit" class="btn p-0 ms-2" style="background: none; border: none;">
                                <i class="fas fa-search fa-lg text-primary"></i>
                            </button>
                        </form>
                        
                        <a href="/booking/create" class="nav-item nav-link">Repair Service</a>
                        <a href="/news" class="nav-item nav-link">News</a>
                        <a href="/contact/new" class="nav-item nav-link">Contact</a>
                        <a href="/aboutus" class="nav-item nav-link">About Us</a>
                        <a href="/voucher/all" class="nav-item nav-link">Vouchers</a>
                        
                        <!-- Dropdown Category -->
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                Categories
                            </a>
                            <ul class="dropdown-menu">
                                <c:forEach var="category" items="${categories}">
                                    <li><a class="dropdown-item" href="/category?categoryId=${category.id}">${category.name}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="user-actions">
                        <c:if test="${not empty pageContext.request.userPrincipal}">
                            <!-- Shopping Cart -->
                            <a href="/cart" class="action-icon" title="Shopping Cart">
                                <i class="fa fa-shopping-bag"></i>
                                <span class="notification-badge cart-badge" id="sumCart">
                                    ${sessionScope.sum}
                                </span>
                            </a>
                            
                            <!-- Wishlist -->
                            <a href="/wishlist" class="action-icon" title="Wishlist">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16z"></path>
                                    <path d="M12 7C11.17 7 10.5 7.67 10.5 8.5C10.5 9.11 10.04 10.59 12 12.5C13.96 10.59 13.5 9.11 13.5 8.5C13.5 7.67 12.83 7 12 7Z"></path>
                                </svg>
                                <span class="notification-badge cart-badge" id="sumWishlist">
                                    <c:out value="${sessionScope.wishlistSize != null ? sessionScope.wishlistSize : 0}" />
                                </span>
                            </a>
                            
                            <!-- Contact Reply Notification -->
                            <c:if test="${replyNotificationCount != null && replyNotificationCount > 0}">
                                <a href="/contact/list" class="action-icon" title="Contact Replies">
                                    <i class="fas fa-envelope"></i>
                                    <span class="notification-badge">
                                        ${replyNotificationCount}
                                    </span>
                                </a>
                            </c:if>
                            
                            <!-- User Dropdown -->
                            <div class="dropdown user-dropdown">
                                <a href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false" class="action-icon">
                                    <i class="fas fa-user"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuLink">
                                    <li class="user-profile">
                                        <img class="user-avatar" src="/images/avatar/${sessionScope.avatar}" alt="User Avatar" />
                                        <p class="user-name"><c:out value="${sessionScope.username}" /></p>
                                    </li>
                                    <li><a class="dropdown-item" href="/customer/profile/${sessionScope.id}">
                                        <i class="fas fa-user-cog me-2"></i>Account Management
                                    </a></li>
                                    <li><a class="dropdown-item" href="/customer/order/tracking">
                                        <i class="fas fa-shopping-cart me-2"></i>Order Management
                                    </a></li>
                                    <li><a class="dropdown-item" href="/booking/history">
                                        <i class="fas fa-tools me-2"></i>Repair History
                                    </a></li>
                                    <li><a class="dropdown-item" href="/customer/order/history">
                                        <i class="fas fa-history me-2"></i>Purchase History
                                    </a></li>
                                    <li><a class="dropdown-item" href="/customer/changepass/pass">
                                        <i class="fas fa-key me-2"></i>Change Password
                                    </a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><form id="logoutForm" action="/logout" method="post" style="display:none;">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    </form>
                                    <a class="dropdown-item" href="#" onclick="document.getElementById('logoutForm').submit(); return false;">
                                        <i class="fas fa-sign-out-alt me-2"></i>Logout
                                    </a>
                                    </li>
                                </ul>
                            </div>
                        </c:if>
                        
                        <c:if test="${empty pageContext.request.userPrincipal}">
                            <a href="/login" class="action-icon" title="Login">
                                <i class="fas fa-sign-in-alt"></i>
                            </a>
                            <a href="/register" class="action-icon" title="Register">
                                <i class="fas fa-user-plus"></i>
                            </a>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->
    <script>
        document.getElementById('searchForm').addEventListener('submit', function(event) {
            var query = document.getElementById('searchInput').value.trim();
            if (query === '') {
                event.preventDefault();
                // Redirect to advanced search page
                window.location.href = '/search/advanced';
            }
        });
    </script>
</body>

</html>
