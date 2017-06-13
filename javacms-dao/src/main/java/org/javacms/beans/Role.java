package org.javacms.beans;

import java.io.Serializable;
import java.util.List;

public class Role implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -707663801900937912L;

	private Integer id;
	
	private Integer siteId;
	
	private String roleName;
	
	private Integer priority;
	
	private char isSuper;
	
	private String roleType;
	
	private List<RolePermission> permission;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSiteId() {
		return siteId;
	}

	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public char getIsSuper() {
		return isSuper;
	}

	public void setIsSuper(char isSuper) {
		this.isSuper = isSuper;
	}

	public String getRoleType() {
		return roleType;
	}

	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}

	public List<RolePermission> getPermission() {
		return permission;
	}

	public void setPermission(List<RolePermission> permission) {
		this.permission = permission;
	}
	
	
}
