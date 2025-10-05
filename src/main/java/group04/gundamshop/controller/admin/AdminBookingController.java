package group04.gundamshop.controller.admin;

import group04.gundamshop.domain.Booking;
import group04.gundamshop.domain.BookingStatus;
import group04.gundamshop.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/booking")
public class AdminBookingController {
    
    @Autowired
    private BookingService bookingService;
    
    @GetMapping
    public String showAllBookings(Model model) {
        List<Booking> allBookings = bookingService.getAllBookings();
        model.addAttribute("bookings", allBookings);
        model.addAttribute("statuses", bookingService.getAllBookingStatuses());
        return "admin/booking/show";
    }
    
    @GetMapping("/{id}")
    public String showBookingDetail(@PathVariable long id, Model model) {
        Booking booking = bookingService.getBookingById(id).orElse(null);
        if (booking == null) {
            return "redirect:/admin/booking";
        }
        
        model.addAttribute("booking", booking);
        model.addAttribute("statuses", bookingService.getAllBookingStatuses());
        return "admin/booking/detail";
    }
    
    @PostMapping("/{id}/update-status")
    public String updateBookingStatus(@PathVariable long id,
                                     @RequestParam BookingStatus status,
                                     @RequestParam(required = false) String adminNotes) {
        bookingService.updateBookingStatus(id, status, adminNotes);
        return "redirect:/admin/booking/" + id;
    }
    
    @GetMapping("/pending")
    public String showPendingBookings(Model model) {
        List<Booking> pendingBookings = bookingService.getBookingsByStatus(BookingStatus.PENDING);
        model.addAttribute("bookings", pendingBookings);
        model.addAttribute("statuses", bookingService.getAllBookingStatuses());
        return "admin/booking/show";
    }
    
    @GetMapping("/approved")
    public String showApprovedBookings(Model model) {
        List<Booking> approvedBookings = bookingService.getBookingsByStatus(BookingStatus.APPROVED);
        model.addAttribute("bookings", approvedBookings);
        model.addAttribute("statuses", bookingService.getAllBookingStatuses());
        return "admin/booking/show";
    }
    
    @PostMapping("/{id}/delete")
    public String deleteBooking(@PathVariable long id) {
        bookingService.deleteBooking(id);
        return "redirect:/admin/booking";
    }
} 