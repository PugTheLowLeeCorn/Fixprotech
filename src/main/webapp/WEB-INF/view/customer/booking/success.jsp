<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
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
        .success-container {
            max-width: 600px;
            margin: 100px auto;
            text-align: center;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            background: white;
        }
        .success-icon {
            font-size: 4rem;
            color: #28a745;
            margin-bottom: 20px;
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
    </style>
</head>
<body style="background-color: #f8f9fa; padding-top: 50px;">
    
    <!-- Header -->
    <jsp:include page="../layout/header.jsp"/>
    
    <div class="container">
        <div class="success-container">
            <div class="success-icon">
                <i class="bi bi-check-circle-fill"></i>
            </div>
            
            <h2 class="text-success mb-3">Đặt lịch thành công!</h2>
            
            <p class="text-muted mb-4">
                Yêu cầu đặt lịch sửa chữa của bạn đã được gửi thành công. 
                Chúng tôi sẽ xem xét và phản hồi trong thời gian sớm nhất.
            </p>
            
            <div class="alert alert-info" role="alert">
                <h6 class="alert-heading">
                    <i class="bi bi-info-circle"></i> Lưu ý:
                </h6>
                <ul class="mb-0 text-start">
                    <li>Vui lòng kiểm tra email hoặc điện thoại để nhận thông báo</li>
                    <li>Bạn có thể theo dõi trạng thái đặt lịch trong phần "Lịch sử đặt lịch"</li>
                    <li>Nếu có thắc mắc, vui lòng liên hệ với chúng tôi</li>
                </ul>
            </div>
            
            <div class="mt-4">
                <a href="/booking/history" class="btn btn-primary me-2">
                    <i class="bi bi-clock-history"></i> Xem lịch sử đặt lịch
                </a>
                <a href="/" class="btn btn-outline-secondary">
                    <i class="bi bi-house"></i> Về trang chủ
                </a>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <jsp:include page="../layout/footer.jsp"/>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 