package org.javacms.beans;

import java.io.Serializable;

public class RolePermission implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3346324395592300941L;

	private Integer roleId;
	
	private String uri;

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}
	
}
