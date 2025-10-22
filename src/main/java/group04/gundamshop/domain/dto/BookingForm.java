package group04.gundamshop.domain.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public class BookingForm {
    
    @NotBlank(message = "Họ tên không được để trống")
    @Size(min = 2, max = 100, message = "Họ tên phải có từ 2 đến 100 ký tự")
    private String name;
    
    @NotBlank(message = "Số điện thoại không được để trống")
    @Pattern(regexp = "^(0|\\+84)[0-9]{9,10}$", message = "Số điện thoại không hợp lệ")
    private String phone;
    
    @NotNull(message = "Vui lòng chọn ít nhất một vấn đề")
    @Size(min = 1, message = "Vui lòng chọn ít nhất một vấn đề")
    private List<String> issues;
    
    @NotNull(message = "Vui lòng chọn ngày hẹn")
    private LocalDate appointmentDate;
    
    @NotNull(message = "Vui lòng chọn giờ hẹn")
    private LocalTime appointmentTime;
    
    private String otherIssue; // For "Khác" option
    
    // Constructors
    public BookingForm() {}
    
    public BookingForm(String name, String phone, List<String> issues, LocalDate appointmentDate, LocalTime appointmentTime) {
        this.name = name;
        this.phone = phone;
        this.issues = issues;
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
    }
    
    // Getters and Setters
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getPhone() {
        return phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public List<String> getIssues() {
        return issues;
    }
    
    public void setIssues(List<String> issues) {
        this.issues = issues;
    }
    
    public LocalDate getAppointmentDate() {
        return appointmentDate;
    }
    
    public void setAppointmentDate(LocalDate appointmentDate) {
        this.appointmentDate = appointmentDate;
    }
    
    public LocalTime getAppointmentTime() {
        return appointmentTime;
    }
    
    public void setAppointmentTime(LocalTime appointmentTime) {
        this.appointmentTime = appointmentTime;
    }
    
    public String getOtherIssue() {
        return otherIssue;
    }
    
    public void setOtherIssue(String otherIssue) {
        this.otherIssue = otherIssue;
    }
    
    @Override
    public String toString() {
        return "BookingForm{" +
                "name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", issues=" + issues +
                ", appointmentDate=" + appointmentDate +
                ", appointmentTime=" + appointmentTime +
                ", otherIssue='" + otherIssue + '\'' +
                '}';
    }
}
