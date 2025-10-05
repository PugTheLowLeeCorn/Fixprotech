package group04.gundamshop.domain;

public enum ServiceType {
    CLEANING("Vệ sinh laptop"),
    THERMAL_PASTE("Thay keo tản nhiệt"),
    REPAIR("Sửa chữa linh kiện"),
    UPGRADE("Nâng cấp linh kiện"),
    DIAGNOSIS("Chẩn đoán lỗi"),
    OTHER("Dịch vụ khác");
    
    private final String displayName;
    
    ServiceType(String displayName) {
        this.displayName = displayName;
    }
    
    public String getDisplayName() {
        return displayName;
    }
} 