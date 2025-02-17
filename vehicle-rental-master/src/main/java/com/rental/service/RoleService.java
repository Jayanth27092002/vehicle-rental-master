//
//// 
////import com.rental.entity.Role;
////import com.rental.repository.RoleRepository;
////import org.springframework.stereotype.Service;
//// 
////import java.util.List;
////import java.util.Optional;
//// 
////@Service
////public class RoleService {
//// 
////    private final RoleRepository roleRepository;
//// 
////    public RoleService(RoleRepository roleRepository) {
////        this.roleRepository = roleRepository;
////    }
//// 
////    // Get all roles
////    public List<Role> getAllRoles() {
////        return roleRepository.findAll();
////    }
//// 
////    // Get role by ID
////    public Optional<Role> getRoleById(String id) {
////        return roleRepository.findById(id);
////    }
//// 
////    // Add a new role
////    public Role addRole(Role role) {
////        return roleRepository.save(role);
////    }
//// 
////    // Update existing role
////    public Role updateRole(String id, Role updatedRole) {
////        return roleRepository.findById(id).map(role -> {
////            role.setRole(updatedRole.getRole()); // Update role name
////            return roleRepository.save(role);
////        }).orElseThrow(() -> new RuntimeException("Role not found"));
////    }
//// 
////    // Delete a role
////    public void deleteRole(String id) {
////        roleRepository.deleteById(id);
////    }
////}
//
//package com.rental.service;
//import com.rental.entity.Role;
//import com.rental.repository.RoleRepository;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//import java.util.Optional;
//
//@Service
//public class RoleService {
//
//    @Autowired
//    private RoleRepository roleRepository;
//
//    public List<Role> getAllRoles() {
//        return roleRepository.findAll();
//    }
//
//    public Optional<Role> getRoleById(String id) {
//        return roleRepository.findById(id);
//    }
//
//    public void saveRole(Role role) {
//        roleRepository.save(role);
//    }
//
//    public void deleteRoleById(String id) {
//        roleRepository.deleteById(id);
//    }
//}
