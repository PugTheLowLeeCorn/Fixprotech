package group04.gundamshop.domain.dto;

public class ServicePackageDto {
    
    private Long id;
    private String name;
    private String description;
    private String icon;
    private String features;
    private String priceFrom;
    private String priceType;
    private Boolean isFeatured;
    private Boolean isActive;
    private Integer sortOrder;
    
    // Constructors
    public ServicePackageDto() {}
    
    public ServicePackageDto(Long id, String name, String description, String icon, String features, 
                            String priceFrom, String priceType, Boolean isFeatured) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.icon = icon;
        this.features = features;
        this.priceFrom = priceFrom;
        this.priceType = priceType;
        this.isFeatured = isFeatured;
        this.isActive = true;
        this.sortOrder = 0;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getIcon() {
        return icon;
    }
    
    public void setIcon(String icon) {
        this.icon = icon;
    }
    
    public String getFeatures() {
        return features;
    }
    
    public void setFeatures(String features) {
        this.features = features;
    }
    
    public String getPriceFrom() {
        return priceFrom;
    }
    
    public void setPriceFrom(String priceFrom) {
        this.priceFrom = priceFrom;
    }
    
    public String getPriceType() {
        return priceType;
    }
    
    public void setPriceType(String priceType) {
        this.priceType = priceType;
    }
    
    public Boolean getIsFeatured() {
        return isFeatured;
    }
    
    public void setIsFeatured(Boolean isFeatured) {
        this.isFeatured = isFeatured;
    }
    
    public Boolean getIsActive() {
        return isActive;
    }
    
    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }
    
    public Integer getSortOrder() {
        return sortOrder;
    }
    
    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }
    
    @Override
    public String toString() {
        return "ServicePackageDto{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", icon='" + icon + '\'' +
                ", features='" + features + '\'' +
                ", priceFrom='" + priceFrom + '\'' +
                ", priceType='" + priceType + '\'' +
                ", isFeatured=" + isFeatured +
                ", isActive=" + isActive +
                ", sortOrder=" + sortOrder +
                '}';
    }
}
