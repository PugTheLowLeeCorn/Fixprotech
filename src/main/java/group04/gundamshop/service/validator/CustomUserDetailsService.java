package group04.gundamshop.service.validator;

import java.util.Collections;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.security.core.userdetails.User;
import group04.gundamshop.service.UserService;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UserService userService;

    public CustomUserDetailsService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // ✅ Lấy User từ Optional, nếu không có thì ném lỗi
        group04.gundamshop.domain.User user = this.userService.getUserByEmail(username)
                .orElseThrow(() -> new UsernameNotFoundException("User Name Not Found"));

        return new User(
                user.getEmail(),
                user.getPassword(),
                user.isStatus(), // Tài khoản có hoạt động không?
                true, // accountNonExpired
                true, // credentialsNonExpired
                user.isStatus(), // accountNonLocked
                Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + user.getRole().getName()))
        );
    }
}
