package com.rxprism.dto;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Role implements Serializable{
	private int roleId;
	private String userRole;
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

}
