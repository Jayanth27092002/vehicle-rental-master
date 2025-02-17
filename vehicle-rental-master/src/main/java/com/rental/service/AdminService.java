package com.rental.service;
 
import com.rental.entity.User;
import com.rental.repository.UserRepository;
import com.rental.utils.PasswordUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
 
import java.util.Optional;
 
@Service
public class AdminService {
 
    @Autowired
    private UserRepository userRepository;
    PasswordUtil pass = new PasswordUtil();
    // Authenticate an admin
    public Optional<User> loginAdmin(String email, String password) {
        if (!StringUtils.hasText(email) || !StringUtils.hasText(password)) {
            throw new IllegalArgumentException("Email and password are required");
        }
        return userRepository.findByEmailAndRole(email, "ADMIN")
                .filter(admin -> pass.verifyPassword(password, admin.getPassword(),7));
    }
}