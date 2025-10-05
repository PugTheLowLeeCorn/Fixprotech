package group04.gundamshop.domain;

public enum BookingStatus {
    PENDING("Chờ xử lý"),
    APPROVED("Đã chấp nhận"),
    REJECTED("Từ chối"),
    COMPLETED("Hoàn thành"),
    CANCELLED("Đã hủy");
    
    private final String displayName;
    
    BookingStatus(String displayName) {
        this.displayName = displayName;
    }
    
    public String getDisplayName() {
        return displayName;
    }
} 