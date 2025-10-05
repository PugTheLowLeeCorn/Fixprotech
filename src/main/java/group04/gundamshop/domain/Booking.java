package group04.gundamshop.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "bookings")
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    
    @NotBlank(message = "Customer name is required")
    @Size(min = 2, max = 100, message = "Customer name must be between 2 and 100 characters")
    @Pattern(regexp = "^\\p{L}.*", message = "Customer name must start with a letter")
    @Column(name = "customer_name", nullable = false)
    private String customerName;
    
    @NotBlank(message = "Phone number is required")
    @Pattern(regexp = "0[0-9]{9}", message = "Phone number must start with 0 and have 10 digits")
    @Column(name = "phone_number", nullable = false)
    private String phoneNumber;
    
    @Pattern(regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$", message = "Please enter a valid email address")
    @Column(name = "email")
    private String email;
    
    @NotBlank(message = "Laptop model is required")
    @Size(min = 2, max = 100, message = "Laptop model must be between 2 and 100 characters")
    @Column(name = "laptop_model", nullable = false)
    private String laptopModel;
    
    @Size(max = 50, message = "Laptop brand must not exceed 50 characters")
    @Column(name = "laptop_brand")
    private String laptopBrand;
    
    @NotNull(message = "Service type is required")
    @Enumerated(EnumType.STRING)
    @Column(name = "service_type", nullable = false)
    private ServiceType serviceType;
    
    @Size(max = 1000, message = "Description must not exceed 1000 characters")
    @Column(name = "description", columnDefinition = "TEXT")
    private String description;
    
    @NotNull(message = "Booking date is required")
    @Column(name = "booking_date", nullable = false)
    private LocalDate bookingDate;
    
    @NotNull(message = "Booking time is required")
    @Column(name = "booking_time", nullable = false)
    private LocalTime bookingTime;
    
    @NotNull(message = "Status is required")
    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    private BookingStatus status = BookingStatus.PENDING;
    
    @Size(max = 1000, message = "Admin notes must not exceed 1000 characters")
    @Column(name = "admin_notes", columnDefinition = "TEXT")
    private String adminNotes;
    
    @Column(name = "created_at")
    private LocalDate createdAt = LocalDate.now();
    
    // Constructors
    public Booking() {}
    
    public Booking(User user, String customerName, String phoneNumber, String email, 
                   String laptopModel, String laptopBrand, ServiceType serviceType, 
                   String description, LocalDate bookingDate, LocalTime bookingTime) {
        this.user = user;
        this.customerName = customerName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.laptopModel = laptopModel;
        this.laptopBrand = laptopBrand;
        this.serviceType = serviceType;
        this.description = description;
        this.bookingDate = bookingDate;
        this.bookingTime = bookingTime;
    }
    
    // Getters and Setters
    public long getId() {
        return id;
    }
    
    public void setId(long id) {
        this.id = id;
    }
    
    public User getUser() {
        return user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    
    public String getCustomerName() {
        return customerName;
    }
    
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    
    public String getPhoneNumber() {
        return phoneNumber;
    }
    
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getLaptopModel() {
        return laptopModel;
    }
    
    public void setLaptopModel(String laptopModel) {
        this.laptopModel = laptopModel;
    }
    
    public String getLaptopBrand() {
        return laptopBrand;
    }
    
    public void setLaptopBrand(String laptopBrand) {
        this.laptopBrand = laptopBrand;
    }
    
    public ServiceType getServiceType() {
        return serviceType;
    }
    
    public void setServiceType(ServiceType serviceType) {
        this.serviceType = serviceType;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public LocalDate getBookingDate() {
        return bookingDate;
    }
    
    public void setBookingDate(LocalDate bookingDate) {
        this.bookingDate = bookingDate;
    }
    
    public LocalTime getBookingTime() {
        return bookingTime;
    }
    
    public void setBookingTime(LocalTime bookingTime) {
        this.bookingTime = bookingTime;
    }
    
    public BookingStatus getStatus() {
        return status;
    }
    
    public void setStatus(BookingStatus status) {
        this.status = status;
    }
    
    public String getAdminNotes() {
        return adminNotes;
    }
    
    public void setAdminNotes(String adminNotes) {
        this.adminNotes = adminNotes;
    }
    
    public LocalDate getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(LocalDate createdAt) {
        this.createdAt = createdAt;
    }
    
    @Override
    public String toString() {
        return "Booking [id=" + id + ", customerName=" + customerName + ", phoneNumber=" + phoneNumber + 
               ", email=" + email + ", laptopModel=" + laptopModel + ", laptopBrand=" + laptopBrand + 
               ", serviceType=" + serviceType + ", status=" + status + "]";
    }
} 