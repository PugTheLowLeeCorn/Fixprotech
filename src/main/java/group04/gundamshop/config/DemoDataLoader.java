package group04.gundamshop.config;

import group04.gundamshop.domain.*;
import group04.gundamshop.repository.*;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Component
public class DemoDataLoader implements CommandLineRunner {
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private OrderDetailRepository orderDetailRepository;
    @Autowired
    private ProductRepository productRepository;

    @Override
    public void run(String... args) throws Exception {
        // Tạo user giả nếu chưa có
        User user = userRepository.findByEmail("demo@gundam.com").orElse(null);
        if (user == null) {
            user = new User();
            user.setEmail("demo@gundam.com");
            user.setFullName("Demo User");
            user.setPassword("123456"); // Nếu có mã hóa thì cần mã hóa lại
            user.setPhone("0123456789");
            user.setAddress("Hà Nội");
            userRepository.save(user);
        }

        // Lấy 1 sản phẩm bất kỳ, nếu chưa có thì tạo mới
        List<Product> products = productRepository.findAll();
        Product product;
        if (products.isEmpty()) {
            product = new Product();
            product.setName("Gundam RX-78-2");
            product.setPrice(1000000);
            product.setQuantity(100);
            productRepository.save(product);
        } else {
            product = products.get(0);
        }

        // Tạo 12 đơn hàng hoàn thành cho 12 tháng
        for (int i = 1; i <= 12; i++) {
            Order order = new Order();
            order.setUser(user);
            order.setReceiverName("Demo User");
            order.setReceiverAddress("Hà Nội");
            order.setReceiverPhone("0123456789");
            order.setOrderDate(LocalDateTime.of(2024, i, 10, 10, 0));
            order.setCompleteDate(LocalDateTime.of(2024, i, 12, 15, 0));
            order.setStatus("COMPLETE");
            order.setTotalPrice(1000000 + i * 100000);
            order.setPaymentMethod("CASH");
            orderRepository.save(order);

            OrderDetail detail = new OrderDetail();
            detail.setOrder(order);
            detail.setProduct(product);
            detail.setQuantity(1);
            detail.setPrice(BigDecimal.valueOf(product.getPrice()));
            orderDetailRepository.save(detail);
        }
    }
} 