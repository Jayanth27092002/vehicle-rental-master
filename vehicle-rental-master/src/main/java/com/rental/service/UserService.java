package com.rental.service;
 
 
import com.rental.entity.User;
import com.rental.repository.UserRepository;
import com.rental.utils.PasswordUtil;
 
import jakarta.annotation.PostConstruct;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
 
import java.sql.Timestamp;
import java.util.Optional;
import java.util.UUID;
 
@Service
public class UserService {

 
    @Autowired
    private UserRepository userRepository;
    
    

 
    // Register a new user
   
    @Autowired
    NotificationService emailService;
    PasswordUtil pass = new PasswordUtil();
    // Register a new user
    public User registerUser(User user) {
        if (!isValidUser(user)) {
            throw new IllegalArgumentException("Invalid user data");
        }
 
        // Check if email is already registered
        if (userRepository.findByEmail(user.getEmail()).isPresent()) {
            throw new IllegalArgumentException("Email already registered");
        }
 
        // Generate UUID for the user ID
        user.setId(UUID.randomUUID().toString());
        // Hash the password before saving
        user.setPassword(pass.hashPassword(user.getPassword(),7));
 
        // Set default role to "USER"
        user.setRole("USER");
 
        // Set creation timestamp
        user.setCreatedAt(new Timestamp(System.currentTimeMillis()));
        emailService.sendRegistrationEmail(user.getEmail(), user.getId(), user.getName(), pass.decryptPassword(user.getPassword(),7));
        return userRepository.save(user);
    }
 
 
    // Authenticate a user
    public Optional<User> loginUser(String email, String password) {
        if (!StringUtils.hasText(email) || !StringUtils.hasText(password)) {
            throw new IllegalArgumentException("Email and password are required");
        }
        return userRepository.findByEmail(email)
                .filter(user -> pass.verifyPassword(password, user.getPassword(),7));
    }
 
    // Validate user input
    private boolean isValidUser(User user) {
        return StringUtils.hasText(user.getName()) &&
                StringUtils.hasText(user.getEmail()) &&
                StringUtils.hasText(user.getPassword()) &&
                StringUtils.hasText(user.getPhoneNumber()) &&
                StringUtils.hasText(user.getUserLicense()) &&
                StringUtils.hasText(user.getUserAadhar());
    }
 
    public void saveUser(User user) {
        userRepository.save(user); // Updates if user has an ID, otherwise creates a new record
    }
    
    public User updateUser(User user) {
        // Validate user data
        if (user.getName() == null || user.getEmail() == null) {
            throw new IllegalArgumentException("Name and email are required.");
        }
        return userRepository.save(user); // Save updated user
    }
    
    public User findByRole(String role) {
        return userRepository.findByRole(role).orElse(null); // Find admin by role
    }
    
    public Optional<User> getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    // Update password with encryption
    public void updatePassword(String email, String newPassword) {
        Optional<User> userOptional = userRepository.findByEmail(email);
        userOptional.ifPresent(user -> {
            user.setPassword(pass.hashPassword(newPassword, 7)); // Encrypt new password
            userRepository.save(user);
        });
    }
 
    @PostConstruct//Start this when u need to enter one entry and comment it back.
    public void initAdminUser() {
        // Check if the admin user already exists
        if (userRepository.findByEmail("admin@example.com").isEmpty()) {
            User admin = new User();
            admin.setId(UUID.randomUUID().toString());
            admin.setName("Admin User");
            admin.setEmail("admin@example.com");
            admin.setPassword(pass.hashPassword("admin123",7)); // Hash the password
            admin.setPhoneNumber("1234567890");
            admin.setUserLicense("ADMIN_LICENSE");
            admin.setUserAadhar("123456789012");
            admin.setCreatedAt(new Timestamp(System.currentTimeMillis()));
            admin.setRole("ADMIN");
            admin.setBalance(100000);

            userRepository.save(admin);
            System.out.println("Admin user created successfully!");
        }
    }
 
}