<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết đặt lịch - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <style>
        .main-content {
            padding: 20px;
        }
        .detail-card {
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        .status-badge {
            font-size: 1rem;
            padding: 8px 15px;
        }
    </style>
</head>
<body>
    
    <div class="main-content">
        <div class="container-fluid">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <a href="/admin/booking" class="btn btn-outline-secondary mb-2">
                        <i class="bi bi-arrow-left"></i> Quay lại danh sách
                    </a>
                    <h2 class="text-primary">
                        <i class="bi bi-calendar-check"></i> Chi tiết đặt lịch #${booking.id}
                    </h2>
                </div>
                <a href="/admin" class="btn btn-outline-secondary">
                    <i class="bi bi-house"></i> Về Admin
                </a>
            </div>
            
            <div class="row">
                <div class="col-md-8">
                    <div class="card detail-card">
                        <div class="card-header bg-primary text-white">
                            <h5 class="mb-0">
                                <i class="bi bi-info-circle"></i> Thông tin đặt lịch
                            </h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <h6 class="text-primary">
                                        <i class="bi bi-person"></i> Thông tin khách hàng
                                    </h6>
                                    <p><strong>Họ tên:</strong> ${booking.customerName}</p>
                                    <p><strong>Số điện thoại:</strong> ${booking.phoneNumber}</p>
                                    <c:if test="${not empty booking.email}">
                                        <p><strong>Email:</strong> ${booking.email}</p>
                                    </c:if>
                                    <p><strong>Người dùng:</strong> ${booking.user.fullName} (${booking.user.email})</p>
                                </div>
                                
                                <div class="col-md-6">
                                    <h6 class="text-primary">
                                        <i class="bi bi-laptop"></i> Thông tin laptop
                                    </h6>
                                    <p><strong>Model:</strong> ${booking.laptopModel}</p>
                                    <c:if test="${not empty booking.laptopBrand}">
                                        <p><strong>Hãng:</strong> ${booking.laptopBrand}</p>
                                    </c:if>
                                    <p><strong>Dịch vụ:</strong> 
                                        <span class="badge bg-info">${booking.serviceType.displayName}</span>
                                    </p>
                                </div>
                            </div>
                            
                            <hr>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <h6 class="text-primary">
                                        <i class="bi bi-calendar-event"></i> Thời gian đặt lịch
                                    </h6>
                                    <p><strong>Ngày:</strong> ${booking.bookingDate}</p>
                                    <p><strong>Giờ:</strong> ${booking.bookingTime}</p>
                                    <p><strong>Ngày tạo:</strong> ${booking.createdAt}</p>
                                </div>
                                
                                <div class="col-md-6">
                                    <h6 class="text-primary">
                                        <i class="bi bi-chat-dots"></i> Mô tả vấn đề
                                    </h6>
                                    <c:choose>
                                        <c:when test="${not empty booking.description}">
                                            <p class="bg-light p-3 rounded">${booking.description}</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p class="text-muted"><em>Không có mô tả</em></p>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card detail-card">
                        <div class="card-header bg-success text-white">
                            <h5 class="mb-0">
                                <i class="bi bi-gear"></i> Quản lý trạng thái
                            </h5>
                        </div>
                        <div class="card-body">
                            <div class="text-center mb-3">
                                <h6>Trạng thái hiện tại:</h6>
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
                            
                            <form action="/admin/booking/${booking.id}/update-status" method="post">
                                <div class="mb-3">
                                    <label for="status" class="form-label">Cập nhật trạng thái:</label>
                                    <select class="form-select" id="status" name="status" required>
                                        <c:forEach items="${statuses}" var="status">
                                            <option value="${status}" ${booking.status == status ? 'selected' : ''}>
                                                ${status.displayName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="adminNotes" class="form-label">Ghi chú (tùy chọn):</label>
                                    <textarea class="form-control" id="adminNotes" name="adminNotes" 
                                              rows="4" placeholder="Nhập ghi chú cho khách hàng...">${booking.adminNotes}</textarea>
                                </div>
                                
                                <button type="submit" class="btn btn-primary w-100">
                                    <i class="bi bi-check-circle"></i> Cập nhật trạng thái
                                </button>
                            </form>
                            
                            <c:if test="${not empty booking.adminNotes}">
                                <hr>
                                <h6 class="text-primary">
                                    <i class="bi bi-chat-dots"></i> Ghi chú hiện tại:
                                </h6>
                                <p class="bg-light p-2 rounded small">${booking.adminNotes}</p>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 