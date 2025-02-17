package com.rental.repository;
//
//import com.rental.entity.Location;
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.stereotype.Repository;
//
//import java.util.List;
//
//@Repository
//public interface LocationRepository extends JpaRepository<Location, String> {
//    List<Location> findByUserId(String userId);
//}


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.rental.entity.Location;

@Repository
public interface LocationRepository extends JpaRepository<Location, String> {
	
}
