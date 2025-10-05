package group04.gundamshop.controller;

import group04.gundamshop.domain.Category;
import group04.gundamshop.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import java.util.List;

@ControllerAdvice
public class GlobalControllerAdvice {

    @Autowired
    private CategoryService categoryService;

    @ModelAttribute("categories")
    public List<Category> categories() {
        try {
            return categoryService.getCategoryByStatus(true); // Lấy danh mục có status = true
        } catch (Exception e) {
            System.err.println("Error loading categories: " + e.getMessage());
            return new java.util.ArrayList<>();
        }
    }
    
//    @ExceptionHandler(Exception.class)
//    public String handleGlobalException(Exception ex, HttpServletRequest request, RedirectAttributes redirectAttributes) {
//        System.err.println("Global exception handler caught: " + ex.getMessage());
//        ex.printStackTrace();
//        String requestURI = request.getRequestURI();
//        if (requestURI != null && requestURI.contains("/category")) {
//            redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra khi tải trang danh mục. Vui lòng thử lại.");
//            return "redirect:/products";
//        }
//        redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra. Vui lòng thử lại.");
//        return "redirect:/";
//    }
}