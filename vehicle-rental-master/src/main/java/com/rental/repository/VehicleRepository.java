package com.rental.repository;



import com.rental.entity.Vehicle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.rental.entity.Vehicle;

@SuppressWarnings("unused")
@Repository
public interface VehicleRepository extends JpaRepository<Vehicle, String> {
	 List<Vehicle> findByLocationIdAndVehicleStatus(String locationId, String vehicleStatus);
}
