<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <style>
            /* Modern Footer Styles */
            .footer {
                background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
                color: #fff;
                padding: 60px 0 20px;
                font-family: 'Open Sans', sans-serif;
                position: relative;
                overflow: hidden;
            }

            .footer::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: linear-gradient(90deg, #667eea 0%, #764ba2 50%, #667eea 100%);
            }

            .footer-container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 20px;
            }

            .footer-header {
                text-align: center;
                margin-bottom: 40px;
            }

            .footer-title {
                font-size: 2.5rem;
                font-weight: 800;
                margin-bottom: 10px;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            }

            .footer-subtitle {
                font-size: 1.1rem;
                color: #a0aec0;
                margin-bottom: 30px;
            }

            .footer-content {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 40px;
                margin-bottom: 40px;
            }

            .footer-section {
                text-align: center;
            }

            .footer-section h4 {
                font-size: 1.3rem;
                font-weight: 700;
                color: #667eea;
                margin-bottom: 20px;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .footer-info {
                background: rgba(255, 255, 255, 0.05);
                border-radius: 15px;
                padding: 25px;
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.1);
            }

            .footer-info ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .footer-info li {
                margin-bottom: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
                color: #e2e8f0;
                font-size: 0.95rem;
            }

            .footer-info li i {
                color: #667eea;
                font-size: 1.1rem;
                width: 20px;
            }

            .footer-info a {
                color: #667eea;
                text-decoration: none;
                transition: all 0.3s ease;
                font-weight: 600;
            }

            .footer-info a:hover {
                color: #764ba2;
                transform: translateX(5px);
            }

            .footer-services {
                background: rgba(255, 255, 255, 0.05);
                border-radius: 15px;
                padding: 25px;
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.1);
            }

            .service-item {
                display: flex;
                align-items: center;
                gap: 12px;
                margin-bottom: 15px;
                padding: 10px;
                border-radius: 8px;
                transition: all 0.3s ease;
            }

            .service-item:hover {
                background: rgba(102, 126, 234, 0.1);
                transform: translateX(5px);
            }

            .service-icon {
                width: 40px;
                height: 40px;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-size: 1.1rem;
            }

            .service-text {
                color: #e2e8f0;
                font-weight: 500;
            }

            .footer-contact {
                background: rgba(255, 255, 255, 0.05);
                border-radius: 15px;
                padding: 25px;
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.1);
            }

            .contact-item {
                display: flex;
                align-items: center;
                gap: 15px;
                margin-bottom: 20px;
                padding: 15px;
                border-radius: 10px;
                transition: all 0.3s ease;
            }

            .contact-item:hover {
                background: rgba(102, 126, 234, 0.1);
                transform: translateY(-2px);
            }

            .contact-icon {
                width: 50px;
                height: 50px;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-size: 1.2rem;
            }

            .contact-details h5 {
                color: #667eea;
                font-weight: 600;
                margin-bottom: 5px;
                font-size: 1rem;
            }

            .contact-details p {
                color: #e2e8f0;
                margin: 0;
                font-size: 0.9rem;
            }

            .footer-social {
                text-align: center;
                margin-bottom: 30px;
            }

            .social-title {
                font-size: 1.2rem;
                font-weight: 600;
                color: #667eea;
                margin-bottom: 20px;
            }

            .social-icons {
                display: flex;
                justify-content: center;
                gap: 20px;
            }

            .social-icon {
                width: 50px;
                height: 50px;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-size: 1.3rem;
                transition: all 0.3s ease;
                text-decoration: none;
            }

            .social-icon:hover {
                transform: translateY(-5px) scale(1.1);
                box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
                color: white;
            }

            .footer-bottom {
                background: rgba(0, 0, 0, 0.3);
                padding: 20px 0;
                text-align: center;
                border-top: 1px solid rgba(255, 255, 255, 0.1);
                margin-top: 30px;
            }

            .footer-bottom p {
                margin: 0;
                color: #a0aec0;
                font-size: 0.9rem;
            }

            .footer-bottom .highlight {
                color: #667eea;
                font-weight: 600;
            }

            /* Responsive Design */
            @media (max-width: 768px) {
                .footer-title {
                    font-size: 2rem;
                }
                
                .footer-content {
                    grid-template-columns: 1fr;
                    gap: 30px;
                }
                
                .social-icons {
                    gap: 15px;
                }
                
                .social-icon {
                    width: 45px;
                    height: 45px;
                    font-size: 1.1rem;
                }
            }

            /* Animation */
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .footer-section {
                animation: fadeInUp 0.6s ease-out;
            }

            .footer-section:nth-child(2) {
                animation-delay: 0.2s;
            }

            .footer-section:nth-child(3) {
                animation-delay: 0.4s;
            }
        </style>

        <footer class="footer">
            <div class="footer-container">
                <div class="footer-header">
                    <h2 class="footer-title">Laptop Shop & Repair Service</h2>
                    <p class="footer-subtitle">Người bạn đồng hành đáng tin cậy của bạn trong lĩnh vực laptop và dịch vụ sửa chữa chuyên nghiệp</p>
                </div>

                <div class="footer-content">
                    <div class="footer-section">
                        <div class="footer-info">
                            <h4>Thông tin công ty</h4>
                            <ul>
                                <li>
                                    <i class="fas fa-map-marker-alt"></i>
                                    Đại học FPT, 600 Nguyễn Văn Cừ, Phường An Bình, Quận Ninh Kiều, Thành phố Cần Thơ, Việt Nam
                                </li>
                                <li>
                                    <i class="fas fa-phone"></i>
                                    <a href="tel:091849999">091.849.999</a>
                                </li>
                                <li>
                                    <i class="fas fa-envelope"></i>
                                    <a href="mailto:kienchung72@gmail.com">chushop@gmail.com</a>
                                </li>
                                <li>
                                    <i class="fas fa-id-card"></i>
                                    Business Registration: 0123456789
                                </li>
                                <li>
                                    <i class="fas fa-calendar-alt"></i>
                                    Established: 14/04/2025
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="footer-section">
                        <div class="footer-services">
                            <h4>Our Services</h4>
                            <div class="service-item">
                                <div class="service-icon">
                                    <i class="fas fa-laptop"></i>
                                </div>
                                <span class="service-text">Laptop sales</span>
                            </div>
                            <div class="service-item">
                                <div class="service-icon">
                                    <i class="fas fa-tools"></i>
                                </div>
                                <span class="service-text">Dịch vụ sửa chữa phần cứng</span>
                            </div>
                            <div class="service-item">
                                <div class="service-icon">
                                    <i class="fas fa-shield-alt"></i>
                                </div>
                                <span class="service-text">Dịch vụ phần mềm</span>
                            </div>
                            <div class="service-item">
                                <div class="service-icon">
                                    <i class="fas fa-headset"></i>
                                </div>
                                <span class="service-text">Hỗ trợ kỹ thuật</span>
                            </div>
                            <div class="service-item">
                                <div class="service-icon">
                                    <i class="fas fa-shipping-fast"></i>
                                </div>
                                <span class="service-text">Dịch vụ bảo hành</span>
                            </div>
                        </div>
                    </div>

                    <div class="footer-section">
                        <div class="footer-contact">
                            <h4>Thông tin liên hệ</h4>
                            <div class="contact-item">
                                <div class="contact-icon">
                                    <i class="fas fa-map-marker-alt"></i>
                                </div>
                                <div class="contact-details">
                                    <h5>Địa chỉ</h5>
                                    <p>Đại học FPT, Thành phố Cần Thơ</p>
                                </div>
                            </div>
                            <div class="contact-item">
                                <div class="contact-icon">
                                    <i class="fas fa-phone"></i>
                                </div>
                                <div class="contact-details">
                                    <h5>Điện thoại</h5>
                                    <p>091.849.999</p>
                                </div>
                            </div>
                            <div class="contact-item">
                                <div class="contact-icon">
                                    <i class="fas fa-envelope"></i>
                                </div>
                                <div class="contact-details">
                                    <h5>Email</h5>
                                    <p>chushop@gmail.com</p>
                                </div>
                            </div>
                            <div class="contact-item">
                                <div class="contact-icon">
                                    <i class="fas fa-clock"></i>
                                </div>
                                <div class="contact-details">
                                    <h5>Giờ làm việc</h5>
                                    <p>Thứ 2 - Thứ 7: 8:00 AM - 8:00 PM</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="footer-social">
                    <h4 class="social-title">Theo dõi chúng tôi</h4>
                    <div class="social-icons">
                        <a href="https://www.facebook.com" class="social-icon" title="Facebook">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="social-icon" title="Instagram">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a href="#" class="social-icon" title="Twitter">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" class="social-icon" title="LinkedIn">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a href="#" class="social-icon" title="YouTube">
                            <i class="fab fa-youtube"></i>
                        </a>
                    </div>
                </div>

                <div class="footer-bottom">
                    <p>&copy; 2025 <span class="highlight">Laptop và Dịch vụ sửa chữa</span>. All rights reserved. | Designed with ❤️ for our customers</p>
                </div>
            </div>
        </footer>