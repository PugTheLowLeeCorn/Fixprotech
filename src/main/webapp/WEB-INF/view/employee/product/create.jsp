<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Group 4 - Dự án Legoshop" />
    <meta name="author" content="Group 4" />
    <title>Create Product</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(() => {
            const avatarFile = $("#productFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#productPreview").attr("src", imgURL);
                $("#productPreview").css({ "display": "block" });
            });
        });
    
        function isValidText(text) {
            const trimmed = text.trim();
    
            // Phải có ít nhất 1 chữ cái
            if (!/[a-zA-Z]/.test(trimmed)) return false;
    
            // Không được có 2 dấu cách liên tiếp
            if (/[\s]{2,}/.test(text)) return false;
    
            // Không được có 2 ký tự đặc biệt liên tiếp
            if (/[^a-zA-Z0-9\s]{2,}/.test(text)) return false;
    
            return true;
        }
    
        function validateForm() {
            const name = document.querySelector('[name="name"]').value.trim();
            const material = document.querySelector('[name="material"]').value.trim();
            const detailDesc = document.querySelector('[name="detailDesc"]').value.trim();
            const shortDesc = document.querySelector('[name="shortDesc"]').value.trim();
            const quantity = document.querySelector('[name="quantity"]').value;
            const image = document.querySelector('#productFile').files.length;
    
            let errors = [];
    
            if (!isValidText(name)) {
                errors.push("Product name must contain at least one letter, and cannot have two consecutive spaces or special characters.");
            }
    
            // Material validation: must start with a letter, followed by letters, numbers, spaces
            const materialPattern = /^[a-zA-Z][a-zA-Z0-9 ]*$/;
            if (!materialPattern.test(material)) {
                errors.push("Material must start with a letter and contain only letters, numbers, and spaces.");
            }
    
            if (!quantity || quantity <= 0) {
                errors.push("Quantity must be greater than 0.");
            }
    
            if (image === 0) {
                errors.push("Please select a product image.");
            }
    
            if (errors.length > 0) {
                alert(errors.join("\n"));
                return false;
            }
    
            return true;
        }
    
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelector("form").onsubmit = function(e) {
                // Remove empty target and type options before submit
                const targetSelect = document.querySelector('select[name="target.id"]');
                const typeSelect = document.querySelector('select[name="type.id"]');
                
                if (targetSelect && targetSelect.value === "") {
                    targetSelect.disabled = true;
                }
                
                if (typeSelect && typeSelect.value === "") {
                    typeSelect.disabled = true;
                }
                
                return validateForm();
            };
        });
    </script>
    
</head>

<body class="sb-nav-fixed">
    <div id="layoutSidenav">
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Dashboard</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/employee">Dashboard</a></li>
                        <li class="breadcrumb-item"><a href="/employee/product">Products</a></li>
                        <li class="breadcrumb-item active">Create</li>
                    </ol>
                    <div class="mt-5">
                        <div class="row">
                            <div class="col-md-6 col-12 mx-auto">
                                <h3>Create a Product</h3>
                                <hr />
                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger">${error}</div>
                                </c:if>
                                <form:form method="post" action="/employee/product/create" class="row" 
                                           enctype="multipart/form-data" modelAttribute="newProduct">
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Name:</label>
                                        <form:input type="text" class="form-control" path="name" 
                                                    required="required" minlength="4"
                                                    oninvalid="this.setCustomValidity('Product name must be at least 4 characters')" 
                                                    oninput="this.setCustomValidity('')" />
                                        <form:errors path="name" cssClass="text-danger" />
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Price:</label>
                                        <form:input type="number" class="form-control" path="price" 
                                                    required="required" min="1001"
                                                    oninvalid="this.setCustomValidity('Price must be greater than 1000 VND')" 
                                                    oninput="this.setCustomValidity('')" />
                                        <form:errors path="price" cssClass="text-danger" />
                                    </div>
                                    <div class="mb-3 col-12">
                                        <label class="form-label">Detail description:</label>
                                        <form:textarea class="form-control" path="detailDesc"
                                                       required="required" minlength="10" />
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Short description:</label>
                                        <form:input type="text" class="form-control" path="shortDesc"
                                                  />
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Quantity:</label>
                                        <form:input type="number" min="1" class="form-control" path="quantity"
                                                    required="required" />
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Brand:</label>
                                        <form:select class="form-select" path="factory.id">
                                            <c:forEach var="factory" items="${factories}">
                                                <form:option value="${factory.id}">${factory.name}</form:option>
                                            </c:forEach>
                                        </form:select>
                                        <form:errors path="factory" cssClass="text-danger" />
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Themes:</label>
                                        <form:select class="form-select" path="category.name">
                                            <c:forEach var="category" items="${categories}">
                                                <form:option value="${category.name}">${category.name}</form:option>
                                            </c:forEach>
                                        </form:select>
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Product Type:</label>
                                        <form:select class="form-select" path="type.id">
                                            <option value="">Select Type</option>
                                            <c:forEach var="type" items="${types}">
                                                <form:option value="${type.id}">${type.name}</form:option>
                                            </c:forEach>
                                        </form:select>
                                        <form:errors path="type" cssClass="text-danger" />
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Target:</label>
                                        <form:select class="form-select" path="target.id">
                                            <option value="">Select Target</option>
                                            <c:forEach var="target" items="${targets}">
                                                <form:option value="${target.id}">${target.name}</form:option>
                                            </c:forEach>
                                        </form:select>
                                        <form:errors path="target" cssClass="text-danger" />
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label class="form-label">Material:</label>
                                        <form:input class="form-control" type="text" path="material" />
                                        <form:errors path="material" cssClass="text-danger" />
                                    </div>
                                    <div class="mb-3 col-12 col-md-6">
                                        <label for="productFile" class="form-label">Image:</label>
                                        <input class="form-control" type="file" id="productFile" 
                                               accept=".png, .jpg, .jpeg" name="productFile" required="required" />
                                    </div>
                                    <div class="col-12 mb-3">
                                        <img style="max-height: 250px; display: none;" alt="product preview" 
                                             id="productPreview" />
                                    </div>
                                    <div class="col-12 mb-5">
                                        <button type="submit" class="btn btn-primary">Create</button>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
            crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
</body>

</html>
