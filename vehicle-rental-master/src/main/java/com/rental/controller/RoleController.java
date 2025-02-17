//package com.rental.controller;
//
//import com.rental.entity.Role;
//import com.rental.service.RoleService;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
//@RestController
//@RequestMapping("/api/roles")
//public class RoleController {
//
//    private final RoleService roleService;
//
//    public RoleController(RoleService roleService) {
//        this.roleService = roleService;
//    }
//
//    @GetMapping
//    public List<Role> getAllRoles() {
//        return roleService.getAllRoles();
//    }
//
//    @PostMapping
//    public Role addRole(@RequestBody Role role) {
//        return roleService.addRole(role);
//    }
//}


//import com.rental.entity.Role;
//import com.rental.service.RoleService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//import java.util.Optional;
//
//@Controller
//@RequestMapping("/role")
//public class RoleController {
//
//    @Autowired
//    private RoleService roleService;
//
//    // Display all roles
//    @GetMapping("/list")
//    public String listRoles(Model model) {
//        List<Role> roles = roleService.getAllRoles();
//        model.addAttribute("roles", roles);
//        return "role-list";
//    }
//
//    // Show form for creating a new role
//    @GetMapping("/create")
//    public String createRoleForm(Model model) {
//        model.addAttribute("role", new Role());
//        return "role-form";
//    }
//
//    // Save or update a role
//    @PostMapping("/save")
//    public String saveRole(@ModelAttribute("role") Role role) {
//        roleService.saveRole(role);
//        return "redirect:/role/list";
//    }
//
//    // Edit role
//    @GetMapping("/edit/{id}")
//    public String editRole(@PathVariable("id") String id, Model model) {
//        Optional<Role> role = roleService.getRoleById(id);
//        if (role.isPresent()) {
//            model.addAttribute("role", role.get());
//            return "role-form";
//        } else {
//            return "error";  // Add a user-friendly error page
//        }
//    }
//
//    // Delete role
//    @GetMapping("/delete/{id}")
//    public String deleteRole(@PathVariable("id") String id) {
//        roleService.deleteRoleById(id);
//        return "redirect:/role/list";
//    }
//}
