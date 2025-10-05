package group04.gundamshop.service;

import group04.gundamshop.domain.Booking;
import group04.gundamshop.domain.BookingStatus;
import group04.gundamshop.domain.ServiceType;
import group04.gundamshop.domain.User;
import group04.gundamshop.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

@Service
public class BookingService {
    
    @Autowired
    private BookingRepository bookingRepository;
    
    public List<Booking> getAllBookings() {
        return bookingRepository.findAllOrderByCreatedAtDesc();
    }
    
    public List<Booking> getBookingsByUser(User user) {
        return bookingRepository.findByUserOrderByCreatedAtDesc(user);
    }
    
    public List<Booking> getBookingsByStatus(BookingStatus status) {
        return bookingRepository.findByStatusOrderByCreatedAtDesc(status);
    }
    
    public Optional<Booking> getBookingById(long id) {
        return bookingRepository.findById(id);
    }
    
    public Booking createBooking(Booking booking) {
        return bookingRepository.save(booking);
    }
    
    public Booking updateBookingStatus(long bookingId, BookingStatus status, String adminNotes) {
        Optional<Booking> optionalBooking = bookingRepository.findById(bookingId);
        if (optionalBooking.isPresent()) {
            Booking booking = optionalBooking.get();
            booking.setStatus(status);
            if (adminNotes != null && !adminNotes.trim().isEmpty()) {
                booking.setAdminNotes(adminNotes);
            }
            return bookingRepository.save(booking);
        }
        return null;
    }
    
    public boolean isTimeSlotAvailable(LocalDate date, LocalTime time) {
        List<Booking> conflictingBookings = bookingRepository.findConflictingBookings(date, time);
        return conflictingBookings.isEmpty();
    }
    
    public List<ServiceType> getAllServiceTypes() {
        return List.of(ServiceType.values());
    }
    
    public List<BookingStatus> getAllBookingStatuses() {
        return List.of(BookingStatus.values());
    }
    
    public boolean deleteBooking(long id) {
        if (bookingRepository.existsById(id)) {
            bookingRepository.deleteById(id);
            return true;
        }
        return false;
    }
} 