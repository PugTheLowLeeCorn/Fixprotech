<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fix ProTech - Đồng hành cùng công nghệ của bạn</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">

    <!-- Embedded CSS to improve the design -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }

        /* Hero Section */
        .hero-section {
            position: relative;
            background: linear-gradient(135deg, #007bff, #00c6ff);
            color: white;
            padding: 100px 0;
            overflow: hidden;
        }

        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.3);
            z-index: 1;
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .hero-title {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .hero-subtitle {
            font-size: 1.5rem;
            margin-bottom: 30px;
        }

        .hero-image img {
            position: relative;
            z-index: 2;
            max-height: 400px;
            object-fit: cover;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }

        .hero-image img:hover {
            transform: scale(1.05);
        }

        .cta-button {
            background-color: #ffc107;
            border: none;
            padding: 15px 30px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .cta-button:hover {
            background-color: #ffca2c;
        }

        /* About Section */
        .about-section {
            background-color: white;
            padding: 80px 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        .section-title {
            font-size: 2.5rem;
            font-weight: bold;
            margin-bottom: 40px;
            position: relative;
        }

        .section-title::after {
            content: '';
            width: 60px;
            height: 4px;
            background: #007bff;
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
        }

        .about-card {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .about-card:hover {
            transform: translateY(-10px);
        }

        .about-icon {
            font-size: 3rem;
            color: #007bff;
            margin-bottom: 20px;
        }

        .about-description {
            font-size: 1.2rem;
            line-height: 1.8;
        }

        /* Packages Section */
        .packages-section {
            padding: 80px 0;
        }

        .package-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            height: 100%;
            position: relative;
            transition: box-shadow 0.3s;
        }

        .package-card:hover {
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }

        .featured {
            border: 2px solid #ffc107;
        }

        .featured-badge {
            position: absolute;
            top: -15px;
            left: 50%;
            transform: translateX(-50%);
            background: #ffc107;
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
        }

        .package-icon {
            font-size: 2.5rem;
            color: #007bff;
            margin-bottom: 15px;
        }

        .package-name {
            font-size: 1.8rem;
            margin-bottom: 10px;
        }

        .package-description {
            color: #6c757d;
            margin-bottom: 20px;
        }

        .feature-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            font-size: 1rem;
        }

        .feature-item i {
            color: #28a745;
            margin-right: 10px;
        }

        .package-price {
            font-size: 1.5rem;
            font-weight: bold;
            color: #007bff;
            margin: 20px 0;
        }

        .package-action .btn {
            width: 100%;
            transition: background-color 0.3s;
        }

        /* How It Works Section */
        .how-it-works-section {
            background: #f8f9fa;
            padding: 80px 0;
        }

        .step-card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            position: relative;
            transition: transform 0.3s;
        }

        .step-card:hover {
            transform: translateY(-10px);
        }

        .step-number {
            position: absolute;
            top: -20px;
            left: 50%;
            transform: translateX(-50%);
            background: #007bff;
            color: white;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            font-weight: bold;
        }

        .step-icon {
            font-size: 2.5rem;
            color: #007bff;
            margin-bottom: 15px;
        }

        /* Booking Section */
        .booking-section {
            padding: 80px 0;
            background: linear-gradient(135deg, #007bff, #0056b3);
        }

        .booking-cta .btn {
            font-size: 1.5rem;
            padding: 15px 40px;
            border-radius: 50px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s;
        }

        .booking-cta .btn:hover {
            transform: scale(1.05);
        }

        /* Trust Section */
        .trust-section {
            padding: 80px 0;
            background: white;
        }

        .trust-item {
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .trust-item:hover {
            transform: translateY(-10px);
        }

        .trust-icon {
            font-size: 2.5rem;
            color: #28a745;
            margin-bottom: 15px;
        }

        /* Smooth Scroll */
        .smooth-scroll {
            scroll-behavior: smooth;
        }
    </style>
</head>

<body>
    <!-- Include Header -->
    <jsp:include page="../layout/header.jsp" />

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-overlay"></div>
        <div class="container">
            <div class="row align-items-center min-vh-100">
                <div class="col-lg-6">
                    <div class="hero-content">
                        <h1 class="hero-title">Fix ProTech - Đồng hành cùng công nghệ của bạn</h1>
                        <p class="hero-subtitle">Dịch vụ sửa chữa laptop chuyên nghiệp tại Cần Thơ với giá minh bạch, đặt lịch online dễ dàng</p>
                        <a href="#booking-section" class="btn btn-primary btn-lg cta-button smooth-scroll">
                            <i class="fas fa-calendar-plus me-2"></i>Đặt lịch ngay
                        </a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="hero-image">
                        <img src="${pageContext.request.contextPath}/images/product/1751344207244-lenovo ThinkPad.png" alt="Dịch vụ sửa chữa laptop chuyên nghiệp" class="img-fluid rounded-3 shadow-lg">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section class="about-section py-5">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center mb-5">
                    <h2 class="section-title">Fix ProTech là gì?</h2>
                </div>
            </div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="about-card text-center">
                        <div class="about-icon">
                            <i class="fas fa-wrench"></i>
                        </div>
                        <h4>Chuyên nghiệp</h4>
                        <p>Đội ngũ kỹ thuật viên giàu kinh nghiệm</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="about-card text-center">
                        <div class="about-icon">
                            <i class="fas fa-clock"></i>
                        </div>
                        <h4>Tiết kiệm thời gian</h4>
                        <p>Đặt lịch online, chọn khung giờ</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="about-card text-center">
                        <div class="about-icon">
                            <i class="fas fa-shield-alt"></i>
                        </div>
                        <h4>Minh bạch</h4>
                        <p>Báo giá rõ ràng trước khi sửa</p>
                    </div>
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-12 text-center">
                    <p class="about-description">
                        Khác với các cửa hàng truyền thống, Fix ProTech mang đến trải nghiệm hiện đại với booking online,
                        theo dõi tiến độ real-time và giá cả minh bạch ngay từ đầu.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Service Packages Section -->
    <section class="packages-section py-5 bg-light">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center mb-5">
                    <h2 class="section-title">Chọn gói dịch vụ phù hợp với bạn</h2>
                </div>
            </div>
            <div class="row g-4">
                <c:forEach var="servicePackage" items="${servicePackages}" varStatus="status">
                    <div class="col-lg-4 col-md-6">
                        <div class="package-card ${servicePackage.isFeatured ? 'featured' : ''}">
                            <c:if test="${servicePackage.isFeatured}">
                                <div class="featured-badge">
                                    <i class="fas fa-star"></i> Phổ biến
                                </div>
                            </c:if>
                            <div class="package-header">
                                <div class="package-icon">
                                    <i class="${servicePackage.icon}"></i>
                                </div>
                                <h3 class="package-name">${servicePackage.name}</h3>
                                <p class="package-description">${servicePackage.description}</p>
                            </div>
                            <div class="package-features">
                                <c:forTokens var="feature" items="${servicePackage.features}" delims=",">
                                    <div class="feature-item">
                                        <i class="fas fa-check"></i>
                                        <span>${feature}</span>
                                    </div>
                                </c:forTokens>
                            </div>
                            <div class="package-price">
                                <c:choose>
                                    <c:when test="${servicePackage.priceType == 'contact'}">
                                        <span class="price-text">Liên hệ</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="price-text">Từ
                                            <fmt:formatNumber value="${servicePackage.priceFrom}" type="number" pattern="#,###đ" />
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="package-action">
                                <a href="/booking/create" class="btn ${servicePackage.isFeatured ? 'btn-primary' : 'btn-outline-primary'}">
                                    Xem chi tiết
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <!-- How It Works Section -->
    <section class="how-it-works-section py-5">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center mb-5">
                    <h2 class="section-title">Quy trình đơn giản chỉ 4 bước</h2>
                </div>
            </div>
            <div class="row g-4">
                <div class="col-lg-3 col-md-6">
                    <div class="step-card text-center">
                        <div class="step-number">1</div>
                        <div class="step-icon">
                            <i class="fas fa-calendar-check"></i>
                        </div>
                        <h4>Đặt lịch online</h4>
                        <p>Chọn ngày giờ phù hợp với bạn</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="step-card text-center">
                        <div class="step-number">2</div>
                        <div class="step-icon">
                            <i class="fas fa-laptop"></i>
                        </div>
                        <h4>Chúng tôi liên hệ bạn</h4>
                        <p>Lấy máy theo lịch đã hẹn</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="step-card text-center">
                        <div class="step-number">3</div>
                        <div class="step-icon">
                            <i class="fas fa-tools"></i>
                        </div>
                        <h4>Sửa chữa & cập nhật</h4>
                        <p>Theo dõi tiến độ online</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="step-card text-center">
                        <div class="step-number">4</div>
                        <div class="step-icon">
                            <i class="fas fa-handshake"></i>
                        </div>
                        <h4>Nhận máy</h4>
                        <p>Kiểm tra và thanh toán</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Booking Section -->
    <section id="booking-section" class="booking-section py-5 bg-primary text-white">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center mb-5">
                    <h2 class="section-title text-white">Sẵn sàng sửa máy? Đặt lịch trong 2 phút!</h2>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8 text-center">
                    <div class="booking-cta">
                        <a href="/booking/create" class="btn btn-warning btn-lg px-5 mb-4">
                            <i class="fas fa-calendar-plus me-2"></i>ĐẶT LỊCH NGAY
                        </a>
                        <p class="mb-0">
                            <i class="fas fa-phone me-2"></i>
                            Hoặc hotline: <strong>091 841 9293</strong>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Trust Section -->
    <section class="trust-section py-5">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center mb-5">
                    <h2 class="section-title">Tại sao chọn Fix ProTech?</h2>
                </div>
            </div>
            <div class="row g-4">
                <div class="col-lg-3 col-md-6">
                    <div class="trust-item text-center">
                        <div class="trust-icon">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <h4>khách hàng hài lòng tại Cần Thơ</h4>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="trust-item text-center">
                        <div class="trust-icon">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <h4>Linh kiện chính hãng, bảo hành rõ ràng</h4>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="trust-item text-center">
                        <div class="trust-icon">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <h4>Theo dõi tiến độ online mọi lúc</h4>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="trust-item text-center">
                        <div class="trust-icon">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <h4>Giá cả minh bạch, không phát sinh</h4>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Include Footer -->
    <jsp:include page="../layout/footer.jsp" />

    <!-- Custom JS -->
    <script src="${pageContext.request.contextPath}/resources/js/home.js"></script>
</body>
</html>