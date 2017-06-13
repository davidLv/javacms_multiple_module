package org.javacms.core.security.handler;

import org.javacms.core.security.userdetails.CustomUserDetails;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component("customLoginSuccessHandler")
public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		
		//User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		
		session.setAttribute("userId", userDetails.getUser().getUserId());
		session.setAttribute("username", userDetails.getUser().getUsername());
		/*session.setAttribute("lastLoginIp", userDetails.getUser().getLastLoginIp());
		session.setAttribute("lastLoginTime", userDetails.getUser().getLastLoginTime());*/
		//commented the below code out, since it will cause to redirect to the / and the defaultSuccessUrl in config could not load the session data,
		//so we should to implment our redirect here
		//super.onAuthenticationSuccess(request, response, authentication);
		if (response.isCommitted()) {
			return;
		}
		
		this.redirectStrategy.sendRedirect(request, response, "/admin/index");
		//response.sendRedirect("/admin/index");
	}

}
