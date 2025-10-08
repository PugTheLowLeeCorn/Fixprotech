<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Your Contacts</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container mt-5">
        <h2>Danh sách liên hệ của bạn</h2>
        <c:if test="${empty contacts}">
            <p>Bạn chưa gửi bất kỳ tin nhắn liên hệ nào.</p>
        </c:if>
        <c:if test="${not empty contacts}">
            <table class="table table-bordered">
                <thead>
<tr>
                        <th>Chủ đề</th>
                        <th>Nội dung</th>
                        <th>Phản hồi của Admin</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="contact" items="${contacts}">
                        <c:set var="highlight" value="${highlightMap[contact.id]}" />
                        <tr class="${highlight ? 'table-warning' : 'table-light'}">
                            <td>${contact.subjectName}</td>
                            <td>${contact.note}</td>
                        <td>
                                <c:choose>
                                    <c:when test="${not empty contact.replyMessage}">
                                        ${contact.replyMessage}
                                    </c:when>
                                    <c:when test="${contact.status}">
                                        Cảm ơn bạn đã liên hệ với chúng tôi, chúng tôi sẽ xem xét yêu cầu của bạn
                                    </c:when>
                                    <c:otherwise>
                                        Chưa có phản hồi
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <a href="/" class="btn btn-primary mt-3">Quay lại trang chủ</a>
    </div>
</body>

</html>
