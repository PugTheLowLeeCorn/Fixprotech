package group04.gundamshop.service;

import group04.gundamshop.domain.*;
import group04.gundamshop.domain.dto.ProductCriteriaDTO;
import group04.gundamshop.repository.*;
import group04.gundamshop.service.specification.ProductSpecs;
import jakarta.servlet.http.HttpSession;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final VoucherRepository voucherRepository;
    private final FactoryRepository factoryRepository;
    private final TargetRepository targetRepository;
    private final TypeRepository typeRepository;

    public ProductService(ProductRepository productRepository, CategoryRepository categoryRepository,
                          CartRepository cartRepository, CartDetailRepository cartDetailRepository,
                          UserService userService, OrderRepository orderRepository,
                          OrderDetailRepository orderDetailRepository, VoucherRepository voucherRepository,
                          FactoryRepository factoryRepository, TargetRepository targetRepository,
                          TypeRepository typeRepository) {
        this.userService = userService;
        this.cartDetailRepository = cartDetailRepository;
        this.productRepository = productRepository;
        this.categoryRepository = categoryRepository;
        this.cartRepository = cartRepository;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.voucherRepository = voucherRepository;
        this.factoryRepository = factoryRepository;
        this.targetRepository = targetRepository;
        this.typeRepository = typeRepository;
    }

    public boolean existsByCategoryId(Long categoryId) {
        return productRepository.existsByCategoryId(categoryId);
    }

    public boolean existsByNameAndFactoryIdAndTargetId(String name, Long factoryId, Long targetId) {
        return productRepository.existsByNameAndFactoryIdAndTargetId(name, factoryId, targetId);
    }

    public List<Product> findAllByNameAndFactoryIdAndTargetId(String name, Long factoryId, Long targetId) {
        return productRepository.findAllByNameAndFactoryIdAndTargetId(name, factoryId, targetId);
    }

    public Optional<OrderDetail> getOrderDetailById(long id) {
        return orderDetailRepository.findById(id);
    }

    public Page<Product> fetchProductsWithSpec(Pageable page, ProductCriteriaDTO productCriteriaDTO) {
        Specification<Product> combinedSpec = Specification.where(ProductSpecs.matchStatus(true));
        if (productCriteriaDTO.getCategoryId() != null && productCriteriaDTO.getCategoryId().isPresent()) {
            Specification<Product> categorySpec = ProductSpecs.matchCategoryId(Long.parseLong(productCriteriaDTO.getCategoryId().get()));
            combinedSpec = combinedSpec.and(categorySpec);
        }
        if (productCriteriaDTO.getTypeId() != null && productCriteriaDTO.getTypeId().isPresent()) {
            Specification<Product> typeSpec = ProductSpecs.matchTypeId(Long.parseLong(productCriteriaDTO.getTypeId().get()));
            combinedSpec = combinedSpec.and(typeSpec);
        }
        if (productCriteriaDTO.getTarget() != null && productCriteriaDTO.getTarget().isPresent()) {
            List<Long> targetIds = productCriteriaDTO.getTarget().get().stream().map(Long::parseLong).toList();
            Specification<Product> currentSpecs = ProductSpecs.matchListTarget(targetIds);
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getFactory() != null && productCriteriaDTO.getFactory().isPresent()) {
            List<Long> factoryIds = productCriteriaDTO.getFactory().get().stream().map(Long::parseLong).toList();
            Specification<Product> currentSpecs = ProductSpecs.matchListFactory(factoryIds);
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        // Apply price range filter if priceMin or priceMax is present
        if (productCriteriaDTO.getPriceMin() != null && productCriteriaDTO.getPriceMin().isPresent()
                && productCriteriaDTO.getPriceMax() != null && productCriteriaDTO.getPriceMax().isPresent()) {
            // Both min and max are present
            Double minPrice = productCriteriaDTO.getPriceMin().get();
            Double maxPrice = productCriteriaDTO.getPriceMax().get();
            System.out.println("Price filter - Min: " + minPrice + ", Max: " + maxPrice);
            Specification<Product> priceRangeSpec = ProductSpecs.matchMultiplePrice(minPrice, maxPrice);
            combinedSpec = combinedSpec.and(priceRangeSpec);
        } else if (productCriteriaDTO.getPriceMin() != null && productCriteriaDTO.getPriceMin().isPresent()) {
            // Only min is present
            Double minPrice = productCriteriaDTO.getPriceMin().get();
            System.out.println("Price filter - Min only: " + minPrice);
            Specification<Product> minPriceSpec = ProductSpecs.minPrice(minPrice);
            combinedSpec = combinedSpec.and(minPriceSpec);
        } else if (productCriteriaDTO.getPriceMax() != null && productCriteriaDTO.getPriceMax().isPresent()) {
            // Only max is present
            Double maxPrice = productCriteriaDTO.getPriceMax().get();
            System.out.println("Price filter - Max only: " + maxPrice);
            Specification<Product> maxPriceSpec = ProductSpecs.maxPrice(maxPrice);
            combinedSpec = combinedSpec.and(maxPriceSpec);
        } else if (productCriteriaDTO.getPrice() != null && productCriteriaDTO.getPrice().isPresent()) {
            Specification<Product> currentSpecs = this.buildPriceSpecification(productCriteriaDTO.getPrice().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getMaterial() != null && productCriteriaDTO.getMaterial().isPresent()) {
            List<String> materials = productCriteriaDTO.getMaterial().get();
            Specification<Product> materialSpec;
            if (materials.size() == 1) {
                materialSpec = ProductSpecs.matchMaterial(materials.get(0));
            } else {
                materialSpec = ProductSpecs.matchMaterials(materials);
            }
            combinedSpec = combinedSpec.and(materialSpec);
        }
        // Apply weight range filter if weightMin or weightMax is present
        if ((productCriteriaDTO.getWeightMin() != null && productCriteriaDTO.getWeightMin().isPresent())
                || (productCriteriaDTO.getWeightMax() != null && productCriteriaDTO.getWeightMax().isPresent())) {
            Double min = productCriteriaDTO.getWeightMin().orElse(Double.MIN_VALUE);
            Double max = productCriteriaDTO.getWeightMax().orElse(Double.MAX_VALUE);
            Specification<Product> weightRangeSpec = ProductSpecs.matchWeightRange(min, max);
            combinedSpec = combinedSpec.and(weightRangeSpec);
        } else if (productCriteriaDTO.getWeight() != null && productCriteriaDTO.getWeight().isPresent()) {
            Specification<Product> weightSpec = ProductSpecs.matchWeight(productCriteriaDTO.getWeight().get());
            combinedSpec = combinedSpec.and(weightSpec);
        }
        Specification<Product> distinctSpec = (root, query, criteriaBuilder) -> {
            query.distinct(true);
            return criteriaBuilder.conjunction();
        };
        combinedSpec = combinedSpec.and(distinctSpec);

        // Apply sorting if sort parameter is present
        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sortField = productCriteriaDTO.getSort().get();
            org.springframework.data.domain.Sort sort;
            switch (sortField) {
                case "gia-tang-dan":
                    sort = org.springframework.data.domain.Sort.by("price").ascending();
                    break;
                case "gia-giam-dan":
                    sort = org.springframework.data.domain.Sort.by("price").descending();
                    break;
                case "priceAsc":
                    sort = org.springframework.data.domain.Sort.by("price").ascending();
                    break;
                case "priceDesc":
                    sort = org.springframework.data.domain.Sort.by("price").descending();
                    break;
                case "nameAsc":
                    sort = org.springframework.data.domain.Sort.by("name").ascending();
                    break;
                case "nameDesc":
                    sort = org.springframework.data.domain.Sort.by("name").descending();
                    break;
                default:
                    sort = org.springframework.data.domain.Sort.unsorted();
            }
            Pageable sortedPageable = org.springframework.data.domain.PageRequest.of(page.getPageNumber(), page.getPageSize(), sort);
            return productRepository.findAll(combinedSpec, sortedPageable);
        }

        return productRepository.findAll(combinedSpec, page);
    }

    public List<Long> getAllFactories() {
        return factoryRepository.findAll()
                .stream()
                .map(factory -> factory.getId())
                .distinct()
                .collect(Collectors.toList());
    }

    public List<Long> getAllTargets() {
        return targetRepository.findAll()
                .stream()
                .map(target -> target.getId())
                .distinct()
                .collect(Collectors.toList());
    }

    public List<Factory> getAllFactoryObjects() {
        return factoryRepository.findAll();
    }

    public List<Target> getAllTargetObjects() {
        return targetRepository.findAll();
    }

    public List<Type> getAllTypeObjects() {
        return typeRepository.findAll();
    }

    public List<String> getAllMaterials() {
        return productRepository.findDistinctMaterials();
    }

    public List<Product> fetchProducts() {
        return this.productRepository.findAllByStatus(true);
    }

    public Product createProduct(Product pr) {
        return this.productRepository.save(pr);
    }

    public Product getProductByIdAndStatus(long id, boolean status) {
        return this.productRepository.findByIdAndStatus(id, status);
    }

    public List<Product> getProductByStatus(boolean status) {
        return productRepository.findAllByStatus(status);
    }

    public Product handleSaveProduct(Product product) {
        return this.productRepository.save(product);
    }

    public Page<Product> fetchProducts(Pageable page) {
        return this.productRepository.findAll(page);
    }

    public Product getByIdAndStatus(Long id, boolean status) {
        return this.productRepository.findByIdAndStatus(id, status);
    }

    public Category getCategoryByName(String name) {
        return this.categoryRepository.findByNameWithType(name);
    }

    public List<CartDetail> getCartDetailsByProduct(Product product) {
        return this.cartDetailRepository.findByProduct(product);
    }

    public Optional<Product> getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session, long quantity) {
        Optional<User> userOptional = this.userService.getUserByEmail(email);
        User user = userOptional.orElse(null);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);
                cart = this.cartRepository.save(otherCart);
            }
            Optional<Product> productOptional = this.productRepository.findById(productId);
            if (productOptional.isPresent()) {
                Product realProduct = productOptional.get();
                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, realProduct);
                if (oldDetail == null) {
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    cd.setPrice(realProduct.getPrice());
                    cd.setQuantity(quantity);
                    this.cartDetailRepository.save(cd);
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + quantity);
                    this.cartDetailRepository.save(oldDetail);
                }
            }
        }
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();
            Cart currentCart = cartDetail.getCart();
            this.cartDetailRepository.deleteById(cartDetailId);
            if (currentCart.getSum() > 1) {
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            } else {
                this.cartRepository.deleteById(currentCart.getId());
                session.setAttribute("sum", 0);
            }
        }
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

    public void handlePlaceOrder(User user, HttpSession session, String receiverName, String receiverAddress,
                                 String receiverPhone, String Note, String voucherCode, double finalTotal) {
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();
            if (cartDetails != null && !cartDetails.isEmpty()) {
                Order order = new Order();
                order.setUser(user);
                order.setReceiverName(receiverName);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverPhone(receiverPhone);
                order.setNote(Note);
                order.setOrderDate(LocalDateTime.now());
                order.setStatus("PENDING");

                // Gán tổng tiền từ finalTotal
                order.setTotalPrice(finalTotal);

                // Xử lý voucher nếu có
                if (voucherCode != null && !voucherCode.isEmpty()) {
                    Optional<Voucher> voucherOptional = voucherRepository.findByCodeIgnoreCase(voucherCode);
                    if (voucherOptional.isPresent()) {
                        Voucher voucher = voucherOptional.get();
                        order.setVoucher(voucher);
                    } else {
                        System.out.println("Voucher " + voucherCode + " not found!");
                    }
                }

                // Lưu order
                order = this.orderRepository.save(order);

                // Tạo OrderDetail từ CartDetail
                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(BigDecimal.valueOf(cd.getPrice()));
                    orderDetail.setQuantity((int) cd.getQuantity());
                    this.orderDetailRepository.save(orderDetail);

                    Product product = cd.getProduct();
                    product.setQuantity(product.getQuantity() - cd.getQuantity());
                    product.setSold(product.getSold() + cd.getQuantity());
                    this.productRepository.save(product);
                }

                // Xóa CartDetail và Cart
                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                }
                this.cartRepository.deleteById(cart.getId());
                session.setAttribute("sum", 0);
            }
        }
    }

    public List<Product> findAll(Specification<Product> spec) {
        throw new UnsupportedOperationException("Unimplemented method 'findAll'");
    }

    public List<Product> getProductByNameOrCategory(String keyword, boolean status) {
        return productRepository.findByNameOrCategoryNameAndStatus(keyword, status);
    }

    public Page<Product> searchProducts(String keyword, Pageable pageable, ProductCriteriaDTO productCriteriaDTO) {
        Specification<Product> combinedSpec = Specification.where(ProductSpecs.matchStatus(true));
        if (keyword != null && !keyword.isEmpty()) {
            Specification<Product> keywordSpec = ProductSpecs.matchNameOrCategory(keyword);
            combinedSpec = combinedSpec.and(keywordSpec);
        }
        if (productCriteriaDTO.getTarget() != null && productCriteriaDTO.getTarget().isPresent()) {
            List<Long> targetIds = productCriteriaDTO.getTarget().get().stream()
                    .flatMap(s -> java.util.Arrays.stream(s.split(",")))
                    .map(Long::parseLong)
                    .toList();
            Specification<Product> targetSpec = ProductSpecs.matchListTarget(targetIds);
            combinedSpec = combinedSpec.and(targetSpec);
        }
        if (productCriteriaDTO.getFactory() != null && productCriteriaDTO.getFactory().isPresent()) {
            List<Long> factoryIds = productCriteriaDTO.getFactory().get().stream()
                    .flatMap(s -> java.util.Arrays.stream(s.split(",")))
                    .map(Long::parseLong)
                    .toList();
            Specification<Product> factorySpec = ProductSpecs.matchListFactory(factoryIds);
            combinedSpec = combinedSpec.and(factorySpec);
        }
        if (productCriteriaDTO.getPrice() != null && productCriteriaDTO.getPrice().isPresent()) {
            Specification<Product> priceSpec = this.buildPriceSpecification(productCriteriaDTO.getPrice().get());
            combinedSpec = combinedSpec.and(priceSpec);
        }
        if (productCriteriaDTO.getMaterial() != null && productCriteriaDTO.getMaterial().isPresent()) {
            List<String> materials = productCriteriaDTO.getMaterial().get();
            Specification<Product> materialSpec;
            if (materials.size() == 1) {
                materialSpec = ProductSpecs.matchMaterial(materials.get(0));
            } else {
                materialSpec = ProductSpecs.matchMaterials(materials);
            }
            combinedSpec = combinedSpec.and(materialSpec);
        }
        if (productCriteriaDTO.getWeight() != null && productCriteriaDTO.getWeight().isPresent()) {
            Specification<Product> weightSpec = ProductSpecs.matchWeight(productCriteriaDTO.getWeight().get());
            combinedSpec = combinedSpec.and(weightSpec);
        }
        Specification<Product> distinctSpec = (root, query, criteriaBuilder) -> {
            query.distinct(true);
            return criteriaBuilder.conjunction();
        };
        combinedSpec = combinedSpec.and(distinctSpec);
        return productRepository.findAll(combinedSpec, pageable);
    }

    public List<Factory> getFactoriesByType(Long typeId) {
        return productRepository.findDistinctFactoriesByTypeIdAndStatus(typeId, true);
    }

    public List<Target> getTargetsByType(Long typeId) {
        return productRepository.findDistinctTargetsByTypeIdAndStatus(typeId, true);
    }

    public Specification<Product> buildPriceSpecification(List<String> price) {
        Specification<Product> combinedSpec = Specification.where(null);
        for (String p : price) {
            double min = 0;
            double max = 0;
            switch (p) {
                case "duoi-10-trieu":
                    min = 1;
                    max = 10000000;
                    break;
                case "10-15-trieu":
                    min = 10000000;
                    max = 15000000;
                    break;
                case "15-20-trieu":
                    min = 15000000;
                    max = 20000000;
                    break;
                case "tren-20-trieu":
                    min = 20000000;
                    max = 200000000;
                    break;
            }
            if (min != 0 && max != 0) {
                Specification<Product> rangeSpec = ProductSpecs.matchMultiplePrice(min, max);
                combinedSpec = combinedSpec.or(rangeSpec);
            }
        }
        return combinedSpec;
    }
}