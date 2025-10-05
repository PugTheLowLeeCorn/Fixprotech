<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/client/css/style.css" rel="stylesheet">

    <meta name="_csrf" content="${_csrf.token}" />
    <meta name="_csrf_header" content="${_csrf.headerName}" />

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css" rel="stylesheet">

    <style>
        .history-container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            background: white;
        }
        .status-badge {
            font-size: 0.8rem;
            padding: 5px 10px;
        }
        .booking-card {
            border: 1px solid #dee2e6;
            border-radius: 10px;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }
        .booking-card:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transform: translateY(-2px);
        }
        .toggle-btn i {
            transition: transform 0.3s ease;
        }
        .toggle-btn[aria-expanded="true"] i {
            transform: rotate(180deg);
        }
    </style>
</head>
<body style="background-color: #f8f9fa; padding-top: 100px;">
    
    <!-- Header -->
    <jsp:include page="../layout/header.jsp"/>
    
    <div class="container">
        <div class="history-container">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="text-primary">
                    <i class="bi bi-clock-history"></i> Lịch sử đặt lịch
                </h2>
                <a href="/booking/create" class="btn btn-primary">
                    <i class="bi bi-plus-circle"></i> Đặt lịch mới
                </a>
            </div>
            
            <c:if test="${empty bookings}">
                <div class="text-center py-5">
                    <i class="bi bi-inbox display-1 text-muted"></i>
                    <h4 class="text-muted mt-3">Chưa có lịch đặt nào</h4>
                    <p class="text-muted">Bạn chưa có lịch đặt sửa chữa nào. Hãy tạo lịch đặt đầu tiên!</p>
                    <a href="/booking/create" class="btn btn-primary">
                        <i class="bi bi-plus-circle"></i> Đặt lịch ngay
                    </a>
                </div>
            </c:if>
            
            <c:if test="${not empty bookings}">
                <div class="row">
                    <c:forEach items="${bookings}" var="booking" >
                        <div class="col-12">
                            <div class="booking-card p-3">
                                <div class="row align-items-center">
                                    <div class="col-md-3">
                                        <h6 class="mb-1">
                                            <i class="bi bi-calendar-event text-primary"></i>
                                            Ngày đặt: ${booking.bookingDate}
                                        </h6>
                                        <small class="text-muted">
                                            <i class="bi bi-clock text-secondary"></i>
                                            Giờ: ${booking.bookingTime}
                                        </small>
                                    </div>
                                    
                                    <div class="col-md-3">
                                        <h6 class="mb-1">
                                            <i class="bi bi-laptop text-primary"></i>
                                            ${booking.laptopModel}
                                        </h6>
                                        <small class="text-muted">
                                            <c:if test="${not empty booking.laptopBrand}">
                                                ${booking.laptopBrand}
                                            </c:if>
                                        </small>
                                    </div>
                                    
                                    <div class="col-md-3">
                                        <h6 class="mb-1">
                                            <i class="bi bi-gear text-primary"></i>
                                            ${booking.serviceType.displayName}
                                        </h6>
                                        <small class="text-muted">
                                            <i class="bi bi-person text-secondary"></i>
                                            ${booking.customerName}
                                        </small>
                                    </div>
                                    
                                    <div class="col-md-2">
                                        <c:choose>
                                            <c:when test="${booking.status == 'PENDING'}">
                                                <span class="badge bg-warning status-badge">
                                                    <i class="bi bi-clock"></i> Chờ xử lý
                                                </span>
                                            </c:when>
                                            <c:when test="${booking.status == 'APPROVED'}">
                                                <span class="badge bg-success status-badge">
                                                    <i class="bi bi-check-circle"></i> Đã chấp nhận
                                                </span>
                                            </c:when>
                                            <c:when test="${booking.status == 'REJECTED'}">
                                                <span class="badge bg-danger status-badge">
                                                    <i class="bi bi-x-circle"></i> Từ chối
                                                </span>
                                            </c:when>
                                            <c:when test="${booking.status == 'COMPLETED'}">
                                                <span class="badge bg-info status-badge">
                                                    <i class="bi bi-check2-all"></i> Hoàn thành
                                                </span>
                                            </c:when>
                                            <c:when test="${booking.status == 'CANCELLED'}">
                                                <span class="badge bg-secondary status-badge">
                                                    <i class="bi bi-x-circle"></i> Đã hủy
                                                </span>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                    
                                    <div class="col-md-1">
                                        <button type="button" class="btn btn-sm btn-outline-primary toggle-btn" 
                                                data-bs-toggle="collapse" 
                                                data-bs-target="#details-${booking.id}" 
                                                aria-expanded="false" 
                                                aria-controls="details-${booking.id}">
                                            <i class="bi bi-chevron-down"></i>
                                        </button>
                                    </div>
                                </div>
                                
                                <!-- Collapsible details -->
                                <div class="collapse mt-3" id="details-${booking.id}">
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h6>Thông tin liên hệ:</h6>
                                            <p class="mb-1">
                                                <strong>SĐT:</strong> ${booking.phoneNumber}
                                            </p>
                                            <c:if test="${not empty booking.email}">
                                                <p class="mb-1">
                                                    <strong>Email:</strong> ${booking.email}
                                                </p>
                                            </c:if>
                                        </div>
                                        <div class="col-md-6">
                                            <h6>Mô tả vấn đề:</h6>
                                            <p class="mb-1">
                                                <c:choose>
                                                    <c:when test="${not empty booking.description}">
                                                        ${booking.description}
                                                    </c:when>
                                                    <c:otherwise>
                                                        <em class="text-muted">Không có mô tả</em>
                                                    </c:otherwise>
                                                </c:choose>
                                            </p>
                                        </div>
                                    </div>
                                    
                                    <c:if test="${not empty booking.adminNotes}">
                                        <div class="mt-3">
                                            <h6 class="text-primary">
                                                <i class="bi bi-chat-dots"></i> Ghi chú từ admin:
                                            </h6>
                                            <p class="mb-0 bg-light p-2 rounded">
                                                ${booking.adminNotes}
                                            </p>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
        </div>
    </div>
    
    <!-- Footer -->
    <jsp:include page="../layout/footer.jsp"/>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- <script>
    document.addEventListener('DOMContentLoaded', function () {
        const toggles = document.querySelectorAll('.toggle-btn');

        toggles.forEach(button => {
            const targetId = button.getAttribute('data-bs-target');
            const target = document.querySelector(targetId);
            const icon = button.querySelector('i');

            if (!target || !icon) return;

            // Khi mở
            target.addEventListener('show.bs.collapse', function () {
                icon.classList.remove('bi-chevron-down');
                icon.classList.add('bi-chevron-up');
            });

            // Khi đóng
            target.addEventListener('hide.bs.collapse', function () {
                icon.classList.remove('bi-chevron-up');
                icon.classList.add('bi-chevron-down');
            });
        });
    });
</script> -->


</body>
</html>