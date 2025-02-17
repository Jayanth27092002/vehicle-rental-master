////package com.rental.entity;
////import jakarta.persistence.*;
////import java.util.List;
////
////@Entity
////@Table(name = "role")
////public class Role {
////    @Id
////    private String id;
////
////    public String getId() {
////		return id;
////	}
////
////	public void setId(String id) {
////		this.id = id;
////	}
////
////	public String getRoleId() {
////		return roleId;
////	}
////
////	public void setRoleId(String roleId) {
////		this.roleId = roleId;
////	}
////
////	public String getRole() {
////		return role;
////	}
//
//	public void setRole(String role) {
//		this.role = role;
//	}
//
//	public List<User> getUsers() {
//		return users;
//	}
//
//	public void setUsers(List<User> users) {
//		this.users = users;
//	}
//
//	private String roleId;
//    private String role;
//
//    @OneToMany(mappedBy = "role", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//    private List<User> users;
//
//    // Getters and Setters
//}