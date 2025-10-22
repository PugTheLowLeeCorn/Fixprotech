<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        .footer {
            background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
            color: white;
            padding: 3rem 0 1rem;
            margin-top: 3rem;
        }
        
        .footer h5 {
            color: #667eea;
            font-weight: 600;
            margin-bottom: 1rem;
        }
        
        .footer a {
            color: #a0aec0;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        
        .footer a:hover {
            color: #667eea;
        }
        
        .footer-bottom {
            border-top: 1px solid #4a5568;
            margin-top: 2rem;
            padding-top: 1rem;
            text-align: center;
            color: #a0aec0;
        }
        
        .social-links a {
            display: inline-block;
            width: 40px;
            height: 40px;
            background: #4a5568;
            border-radius: 50%;
            text-align: center;
            line-height: 40px;
            margin: 0 5px;
            transition: all 0.3s ease;
        }
        
        .social-links a:hover {
            background: #667eea;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4">
                    <h5>Fix ProTech</h5>
                    <p>Dịch vụ sửa chữa laptop chuyên nghiệp tại Cần Thơ với giá minh bạch, đặt lịch online dễ dàng.</p>
                    <div class="social-links">
                        <a href="https://www.facebook.com/profile.php?id=61576730232361" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" title="Zalo"><i class="fab fa-whatsapp"></i></a>
                        <a href="#" title="Instagram"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6 mb-4">
                    <h5>Dịch vụ</h5>
                    <ul class="list-unstyled">
                        <li><a href="/booking/create">Sửa chữa laptop</a></li>
                        <li><a href="/booking/create">Bảo trì định kỳ</a></li>
                        <li><a href="/booking/create">Cài đặt phần mềm</a></li>
                        <li><a href="/booking/create">Nâng cấp phần cứng</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-6 mb-4">
                    <h5>Hỗ trợ</h5>
                    <ul class="list-unstyled">
                        <li><a href="/contact/new">Liên hệ</a></li>
                        <li><a href="/aboutus">Về chúng tôi</a></li>
                        <li><a href="/news">Tin tức</a></li>
                        <li><a href="/booking/history">Lịch sử sửa chữa</a></li>
                    </ul>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <h5>Thông tin liên hệ</h5>
                    <div class="contact-info">
                        <p><i class="fas fa-map-marker-alt me-2"></i>Nguyễn Văn Cừ, Quận Ninh Kiều, TP. Cần Thơ</p>
                        <p><i class="fas fa-phone me-2"></i>091 841 9293</p>
                        <p><i class="fas fa-envelope me-2"></i>info@fixprotech.com</p>
                        <p><i class="fas fa-clock me-2"></i>Thứ 2 - Thứ 7: 8:00 - 18:00</p>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 Fix ProTech. Tất cả quyền được bảo lưu.</p>
            </div>
        </div>
    </footer>
</body>
</html>