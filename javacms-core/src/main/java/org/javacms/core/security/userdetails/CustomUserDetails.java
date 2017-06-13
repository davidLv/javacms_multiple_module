package org.javacms.core.security.userdetails;

import org.javacms.beans.RolePermission;
import org.javacms.beans.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class CustomUserDetails extends User implements UserDetails {
	
	private User user;
	
	public CustomUserDetails(User user) {
		this.user = user;
		this.setUsername(user.getUsername());
	}
	
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.user.getUsername();
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return this.user.getPassword();
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
		List<RolePermission> privileges =  user.getRole().getPermission();
		for (RolePermission privilege : privileges) {
			if (privilege == null) {
				continue;
			}
			authorities.add(new SimpleGrantedAuthority(privilege.getUri()));
		}
		return authorities;
	}

	@Override
	public boolean isAccountNonExpired() {
		// todo auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
