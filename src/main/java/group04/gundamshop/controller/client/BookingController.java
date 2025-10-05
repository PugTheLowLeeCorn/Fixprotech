package group04.gundamshop.controller.client;

import group04.gundamshop.domain.Booking;
import group04.gundamshop.domain.BookingStatus;
import group04.gundamshop.domain.ServiceType;
import group04.gundamshop.domain.User;
import group04.gundamshop.service.BookingService;
import group04.gundamshop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Optional;

@Controller
@RequestMapping("/booking")
public class BookingController {
    
    @Autowired
    private BookingService bookingService;
    
    @Autowired
    private UserService userService;
    
    @GetMapping("/create")
    public String showBookingForm(Model model) {
        model.addAttribute("serviceTypes", bookingService.getAllServiceTypes());
        model.addAttribute("booking", new Booking());
        return "customer/booking/create";
    }
    
    @PostMapping("/create")
    public String createBooking(@RequestParam("customerName") String customerName,
                               @RequestParam("phoneNumber") String phoneNumber,
                               @RequestParam(value = "email", required = false) String customerEmail,
                               @RequestParam("laptopModel") String laptopModel,
                               @RequestParam(value = "laptopBrand", required = false) String laptopBrand,
                               @RequestParam("serviceType") String serviceTypeStr,
                               @RequestParam(value = "description", required = false) String description,
                               @RequestParam("bookingDate") String bookingDateStr,
                               @RequestParam("bookingTime") String bookingTimeStr,
                               Model model) {
        
        try {
            // Get current user
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String email = authentication.getName();
            Optional<User> userOptional = userService.findByEmail(email);
            
            if (userOptional.isEmpty()) {
                model.addAttribute("error", "User not found");
                return "redirect:/login";
            }
            
            User user = userOptional.get();
            
            // Parse date and time
            LocalDate bookingDate;
            LocalTime bookingTime;
            
            try {
                bookingDate = LocalDate.parse(bookingDateStr);
            } catch (DateTimeParseException e) {
                model.addAttribute("error", "Ngày đặt lịch không hợp lệ");
                model.addAttribute("serviceTypes", bookingService.getAllServiceTypes());
                return "customer/booking/create";
            }
            
            try {
                bookingTime = LocalTime.parse(bookingTimeStr, DateTimeFormatter.ofPattern("HH:mm"));
            } catch (DateTimeParseException e) {
                model.addAttribute("error", "Giờ đặt lịch không hợp lệ. Vui lòng chọn lại giờ.");
                model.addAttribute("serviceTypes", bookingService.getAllServiceTypes());
                return "customer/booking/create";
            }
            
            // Parse service type
            ServiceType serviceType;
            try {
                serviceType = ServiceType.valueOf(serviceTypeStr);
            } catch (IllegalArgumentException e) {
                model.addAttribute("error", "Loại dịch vụ không hợp lệ");
                model.addAttribute("serviceTypes", bookingService.getAllServiceTypes());
                return "customer/booking/create";
            }
            
            // Validate booking date (not in the past)
            if (bookingDate.isBefore(LocalDate.now())) {
                model.addAttribute("error", "Không thể đặt lịch trong quá khứ");
                model.addAttribute("serviceTypes", bookingService.getAllServiceTypes());
                return "customer/booking/create";
            }
            
            // Validate booking time (between 8:00 and 17:00)
            if (bookingTime.isBefore(LocalTime.of(8, 0)) || bookingTime.isAfter(LocalTime.of(17, 0))) {
                model.addAttribute("error", "Thời gian đặt lịch phải từ 8:00 đến 17:00");
                model.addAttribute("serviceTypes", bookingService.getAllServiceTypes());
                return "customer/booking/create";
            }
            
            // Check if time slot is available
            if (!bookingService.isTimeSlotAvailable(bookingDate, bookingTime)) {
                model.addAttribute("error", "Thời gian này đã được đặt. Vui lòng chọn thời gian khác.");
                model.addAttribute("serviceTypes", bookingService.getAllServiceTypes());
                return "customer/booking/create";
            }
            
            // Create booking object
            Booking booking = new Booking();
            booking.setUser(user);
            booking.setCustomerName(customerName);
            booking.setPhoneNumber(phoneNumber);
            booking.setEmail(customerEmail);
            booking.setLaptopModel(laptopModel);
            booking.setLaptopBrand(laptopBrand);
            booking.setServiceType(serviceType);
            booking.setDescription(description);
            booking.setBookingDate(bookingDate);
            booking.setBookingTime(bookingTime);
            booking.setStatus(BookingStatus.PENDING);
            
            // Save booking
            bookingService.createBooking(booking);
            
            return "redirect:/booking/success";
            
        } catch (Exception e) {
            model.addAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
            model.addAttribute("serviceTypes", bookingService.getAllServiceTypes());
            return "customer/booking/create";
        }
    }
    
    @GetMapping("/success")
    public String bookingSuccess() {
        return "customer/booking/success";
    }
    
    @GetMapping("/history")
    public String showBookingHistory(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();
        
        Optional<User> userOptional = userService.findByEmail(email);
        
        if (userOptional.isPresent()) {
            User user = userOptional.get();
            var bookings = bookingService.getBookingsByUser(user);
            model.addAttribute("bookings", bookings);
        }
        
        return "customer/booking/history";
    }
} 