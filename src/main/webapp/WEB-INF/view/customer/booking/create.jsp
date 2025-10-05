<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
            <title>Tin Tức</title>
            <!-- Google Web Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link
                href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                rel="stylesheet">

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
            <!-- default header name is X-CSRF-TOKEN -->
            <meta name="_csrf_header" content="${_csrf.headerName}" />

            <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
                rel="stylesheet">
    <style>
        .booking-form {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            background: white;
        }
        .form-label {
            font-weight: 600;
            color: #333;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            padding: 12px 30px;
            font-weight: 600;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .alert {
            border-radius: 10px;
        }
    </style>
</head>
<body style="background-color: #f8f9fa; padding-top: 100px;">
    
    <jsp:include page="../layout/header.jsp"/>
    
    <div class="container">
        <div class="booking-form">
            <div class="text-center mb-4">
                <h2 class="fw-bold text-primary">
                    <i class="bi bi-tools"></i> Đặt lịch sửa chữa laptop
                </h2>
                <p class="text-muted">Vui lòng điền đầy đủ thông tin để đặt lịch</p>
            </div>
            
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="bi bi-exclamation-triangle-fill"></i> ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            
            <form action="/booking/create" method="post" class="needs-validation" novalidate>
                
                <div class="row mb-4">
                    <div class="col-12">
                        <h5 class="text-primary mb-3">
                            <i class="bi bi-person-fill"></i> Thông tin cá nhân
                        </h5>
                    </div>
                    
                    <div class="col-md-6 mb-3">
                        <label for="customerName" class="form-label">Họ và tên *</label>
                        <input type="text" class="form-control" id="customerName" name="customerName" 
                               value="${booking.customerName}" required maxlength="100">
                        <div class="invalid-feedback">
                            Vui lòng nhập họ và tên
                        </div>
                    </div>
                    
                    <div class="col-md-6 mb-3">
                        <label for="phoneNumber" class="form-label">Số điện thoại *</label>
                        <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" 
                               value="${booking.phoneNumber}" required pattern="0[0-9]{9}">
                        <div class="invalid-feedback">
                            Vui lòng nhập số điện thoại hợp lệ (VD: 0123456789)
                        </div>
                    </div>
                    
                    <div class="col-12 mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" 
                               value="${booking.email}" maxlength="100">
                        <div class="invalid-feedback">
                            Vui lòng nhập email hợp lệ
                        </div>
                    </div>
                </div>
                
                <div class="row mb-4">
                    <div class="col-12">
                        <h5 class="text-primary mb-3">
                            <i class="bi bi-laptop"></i> Thông tin laptop
                        </h5>
                    </div>
                    
                    <div class="col-md-6 mb-3">
                        <label for="laptopBrand" class="form-label">Hãng laptop</label>
                        <input type="text" class="form-control" id="laptopBrand" name="laptopBrand" 
                               value="${booking.laptopBrand}" placeholder="VD: Dell, HP, Lenovo, Asus..." maxlength="50">
                    </div>
                    
                    <div class="col-md-6 mb-3">
                        <label for="laptopModel" class="form-label">Model laptop *</label>
                        <input type="text" class="form-control" id="laptopModel" name="laptopModel" 
                               value="${booking.laptopModel}" required placeholder="VD: Inspiron 15, ThinkPad X1..." maxlength="100">
                        <div class="invalid-feedback">
                            Vui lòng nhập model laptop
                        </div>
                    </div>
                </div>
                
                <div class="row mb-4">
                    <div class="col-12">
                        <h5 class="text-primary mb-3">
                            <i class="bi bi-gear-fill"></i> Loại dịch vụ
                        </h5>
                    </div>
                    
                    <div class="col-12 mb-3">
                        <label for="serviceType" class="form-label">Chọn dịch vụ *</label>
                        <select class="form-select" id="serviceType" name="serviceType" required>
                            <option value="">-- Chọn dịch vụ --</option>
                            <c:forEach items="${serviceTypes}" var="serviceType">
                                <option value="${serviceType}" ${booking.serviceType == serviceType ? 'selected' : ''}>
                                    ${serviceType.displayName}
                                </option>
                            </c:forEach>
                        </select>
                        <div class="invalid-feedback">
                            Vui lòng chọn loại dịch vụ
                        </div>
                    </div>
                    
                    <div class="col-12 mb-3">
                        <label for="description" class="form-label">Mô tả chi tiết vấn đề</label>
                        <textarea class="form-control" id="description" name="description" rows="4" 
                                  placeholder="Mô tả chi tiết vấn đề của laptop..." maxlength="1000">${booking.description}</textarea>
                    </div>
                </div>
                
                <div class="row mb-4">
                    <div class="col-12">
                        <h5 class="text-primary mb-3">
                            <i class="bi bi-calendar-event"></i> Thời gian đặt lịch
                        </h5>
                    </div>
                    
                    <div class="col-md-6 mb-3">
                        <label for="bookingDate" class="form-label">Ngày đặt lịch *</label>
                        <input type="date" class="form-control" id="bookingDate" name="bookingDate" 
                               required min="${java.time.LocalDate.now()}">
                        <div class="invalid-feedback">
                            Vui lòng chọn ngày đặt lịch
                        </div>
                    </div>
                    
                    <div class="col-md-6 mb-3">
                        <label for="bookingTime" class="form-label">Giờ đặt lịch *</label>
                        <select class="form-select" id="bookingTime" name="bookingTime" required>
                            <option value="">-- Chọn giờ --</option>
                            <option value="08:00">08:00</option>
                            <option value="09:00">09:00</option>
                            <option value="10:00">10:00</option>
                            <option value="11:00">11:00</option>
                            <option value="13:00">13:00</option>
                            <option value="14:00">14:00</option>
                            <option value="15:00">15:00</option>
                            <option value="16:00">16:00</option>
                            <option value="17:00">17:00</option>
                        </select>
                        <div class="invalid-feedback">
                            Vui lòng chọn giờ đặt lịch
                        </div>
                    </div>
                </div>
                
                <div class="text-center">
                    <button type="submit" class="btn btn-primary btn-lg">
                        <i class="bi bi-send"></i> Gửi yêu cầu đặt lịch
                    </button>
                    <a href="/" class="btn btn-outline-secondary btn-lg ms-2">
                        <i class="bi bi-arrow-left"></i> Quay lại
                    </a>
                </div>
            </form>
        </div>
    </div>
    
    <jsp:include page="../layout/footer.jsp"/>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var forms = document.getElementsByClassName('needs-validation');
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
        document.getElementById('bookingDate').min = new Date().toISOString().split('T')[0];
    </script>
</body>
</html>
