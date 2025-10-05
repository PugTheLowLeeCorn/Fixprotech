<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý đặt lịch - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <style>
        .main-content {
            padding: 20px;
        }
        .status-badge {
            font-size: 0.8rem;
            padding: 5px 10px;
        }
        .table-responsive {
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .btn-sm {
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
        }
    </style>
</head>
<body>
    
    <div class="main-content">
        <div class="container-fluid">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <a href="/admin" class="btn btn-outline-secondary mb-2">
                        <i class="bi bi-arrow-left"></i> Quay lại Admin
                    </a>
                    <h2 class="text-primary">
                        <i class="bi bi-calendar-check"></i> Quản lý đặt lịch sửa chữa
                    </h2>
                </div>
                <div class="btn-group" role="group">
                    <a href="/admin/booking" class="btn btn-outline-primary">
                        <i class="bi bi-list"></i> Tất cả
                    </a>
                    <a href="/admin/booking/pending" class="btn btn-outline-warning">
                        <i class="bi bi-clock"></i> Chờ xử lý
                    </a>
                    <a href="/admin/booking/approved" class="btn btn-outline-success">
                        <i class="bi bi-check-circle"></i> Đã chấp nhận
                    </a>
                </div>
            </div>
            
            <c:if test="${empty bookings}">
                <div class="text-center py-5">
                    <i class="bi bi-inbox display-1 text-muted"></i>
                    <h4 class="text-muted mt-3">Chưa có yêu cầu đặt lịch nào</h4>
                    <p class="text-muted">Hiện tại chưa có khách hàng nào đặt lịch sửa chữa.</p>
                </div>
            </c:if>
            
            <c:if test="${not empty bookings}">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>Khách hàng</th>
                                <th>Laptop</th>
                                <th>Dịch vụ</th>
                                <th>Ngày đặt</th>
                                <th>Giờ đặt</th>
                                <th>Trạng thái</th>
                                <th>Ngày tạo</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${bookings}" var="booking">
                                <tr>
                                    <td>
                                        <div>
                                            <strong>${booking.customerName}</strong>
                                            <br>
                                            <small class="text-muted">
                                                <i class="bi bi-telephone"></i> ${booking.phoneNumber}
                                            </small>
                                            <c:if test="${not empty booking.email}">
                                                <br>
                                                <small class="text-muted">
                                                    <i class="bi bi-envelope"></i> ${booking.email}
                                                </small>
                                            </c:if>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <strong>${booking.laptopModel}</strong>
                                            <c:if test="${not empty booking.laptopBrand}">
                                                <br>
                                                <small class="text-muted">${booking.laptopBrand}</small>
                                            </c:if>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="badge bg-info">
                                            ${booking.serviceType.displayName}
                                        </span>
                                    </td>
                                    <td>
                                        ${booking.bookingDate}
                                    </td>
                                    <td>
                                        ${booking.bookingTime}
                                    </td>
                                    <td>
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
                                    </td>
                                    <td>
                                        ${booking.createdAt}
                                    </td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a href="/admin/booking/${booking.id}" 
                                               class="btn btn-sm btn-outline-primary" 
                                               title="Xem chi tiết">
                                                <i class="bi bi-eye"></i>
                                            </a>
                                            <button type="button" 
                                                    class="btn btn-sm btn-outline-danger" 
                                                    title="Xóa"
                                                    onclick="confirmDelete(${booking.id})">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>
    
    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Xác nhận xóa</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>Bạn có chắc chắn muốn xóa yêu cầu đặt lịch này?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <form id="deleteForm" method="post" style="display: inline;">
                        <button type="submit" class="btn btn-danger">Xóa</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function confirmDelete(bookingId) {
            const modal = new bootstrap.Modal(document.getElementById('deleteModal'));
            const form = document.getElementById('deleteForm');
            form.action = `/admin/booking/${bookingId}/delete`;
            modal.show();
        }
    </script>
</body>
</html> 