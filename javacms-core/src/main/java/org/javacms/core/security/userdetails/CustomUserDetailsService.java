package org.javacms.core.security.userdetails;

import org.javacms.beans.User;
import org.javacms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

@Component
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private UserService userService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userService.getUserByUsername(username);
		
		if (user == null) {
			throw new UsernameNotFoundException("Invalid username" + username);
		}
		
		/*String userName = user.getUsername();
		String password = user.getPassword();
		boolean enabled = (user.getActivation() == '1');
		boolean isAccountNonExpired = true;
		boolean isCredentialsNonExpired = true;
		boolean isAccountNonLocked = true;*/
		
		return new CustomUserDetails(user);
	}

}
