//package com.rental.service;
//
//
//import com.rental.entity.Vehicle;
//import java.util.List;
//
//public interface VehicleService {
//    List<Vehicle> getAllVehicles();
//    Vehicle getVehicleById(String id);
//    Vehicle addVehicle(Vehicle vehicle);
//    void deleteVehicle(String id);
//}

package com.rental.service;
import com.rental.entity.Vehicle;
import com.rental.repository.VehicleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class VehicleService {

    @Autowired
    private VehicleRepository vehicleRepository;
    
    public List<Vehicle> getVehiclesByLocationAndStatus(String locationId, String vehicleStatus) {
        return vehicleRepository.findByLocationIdAndVehicleStatus(locationId, vehicleStatus);
    }

    public List<Vehicle> getAllVehicles() {
        return vehicleRepository.findAll();
    }

    public Optional<Vehicle> getVehicleById(String id) {
        return vehicleRepository.findById(id);
    }

    public void saveVehicle(Vehicle vehicle) {
        vehicleRepository.save(vehicle);
    }

    public void deleteVehicleById(String id) {
        vehicleRepository.deleteById(id);
    }
    
    
}
