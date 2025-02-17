package com.rental.repository;
import com.rental.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
@SuppressWarnings("unused")
@Repository
public interface UserRepository extends JpaRepository<User, String> {
	Optional<User> findByEmail(String email); // Existing method
    Optional<User> findByEmailAndRole(String email, String role);
    Optional<User> findByRole(String role);
    
}
