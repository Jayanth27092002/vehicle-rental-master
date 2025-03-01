package com.rental.service;
//
//import com.rental.entity.Location;
//import com.rental.repository.LocationRepository;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//import java.util.Optional;
//
//@Service
//public class LocationService {
//
//    private final LocationRepository locationRepository;
//
//    public LocationService(LocationRepository locationRepository) {
//        this.locationRepository = locationRepository;
//    }
//
//    public List<Location> getAllLocations() {
//        return locationRepository.findAll();
//    }
//
//    public Optional<Location> getLocationById(String id) {
//        return locationRepository.findById(id);
//    }
//
//    public List<Location> getLocationsByUserId(String userId) {
//        return locationRepository.findByUserId(userId);
//    }
//
//    public Location addLocation(Location location) {
//        return locationRepository.save(location);
//    }
//
//    public Location updateLocation(String id, Location updatedLocation) {
//        return locationRepository.findById(id).map(location -> {
//            location.setId(updatedLocation.getId());
//            location.setLocationName(updatedLocation.getLocationName());
//     
//            return locationRepository.save(location);
//        }).orElseThrow(() -> new RuntimeException("Location not found"));
//    }
//
//    public void deleteLocation(String id) {
//        locationRepository.deleteById(id);
//    }
//}



import com.rental.entity.Location;
import com.rental.repository.LocationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LocationService {

    @Autowired
    private LocationRepository locationRepository;

    public List<Location> getAllLocations() {
        return locationRepository.findAll();
    }

    public Optional<Location> getLocationById(String id) {
        return locationRepository.findById(id);
    }

    public void saveLocation(Location location) {
        locationRepository.save(location);
    }

    public void deleteLocationById(String id) {
        locationRepository.deleteById(id);
    }
}
