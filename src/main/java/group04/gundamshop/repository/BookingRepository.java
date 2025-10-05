package group04.gundamshop.repository;

import group04.gundamshop.domain.Booking;
import group04.gundamshop.domain.BookingStatus;
import group04.gundamshop.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {
    
    List<Booking> findByUserOrderByCreatedAtDesc(User user);
    
    List<Booking> findByStatusOrderByCreatedAtDesc(BookingStatus status);
    
    List<Booking> findByBookingDateOrderByBookingTime(LocalDate bookingDate);
    
    @Query("SELECT b FROM Booking b WHERE b.bookingDate = :date AND b.bookingTime = :time AND b.status IN ('PENDING', 'APPROVED')")
    List<Booking> findConflictingBookings(@Param("date") LocalDate date, @Param("time") LocalTime time);
    
    @Query("SELECT b FROM Booking b ORDER BY b.createdAt DESC")
    List<Booking> findAllOrderByCreatedAtDesc();
} 