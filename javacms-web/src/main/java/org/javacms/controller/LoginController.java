package org.javacms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.javacms.beans.User;
import org.javacms.core.security.userdetails.CustomUserDetailsService;
import org.javacms.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
    /*@Autowired
    private LoginService loginService;*/
    
    /*@Autowired
    private CustomUserDetailsService customUserDetailsService;
    
    @Autowired
    private AuthenticationManager authenticationManager;*/

    @RequestMapping(value ="/auth/login", method=RequestMethod.POST)
    public void login(User user, Model model, HttpServletRequest request) {
    	
    	/**commented the below code, since the login function will be done by Spring Security UsernamePasswordAuthenticationFilter
    	 *and we just need to config the loginProcessingUrl in Spring Security configuration to point the controller and the UsernamePasswordAuthenticationFilter
    	 *will help us to do the authentication functionality
    	 */
    	//login with spring security authentication supporting, so that the username and password could be accept by spring security
        /*UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword());
        
        try {
        	Authentication authentication = authenticationManager.authenticate(authRequest);
            SecurityContextHolder.getContext().setAuthentication(authentication);
            HttpSession session = request.getSession();
            //it must to set the SPRING_SECURITY_CONTEXT in session, otherwise it will throw the "HttpSession returned null object for SPRING_SECURITY_CONTEXT" and could not login successful after the authentication was done, 这个非常重要，否则验证后将无法登陆
            session.setAttribute("SPRING_SECURITY_CONTEXT", SecurityContextHolder.getContext());
            return "redirect:/admin/index";
        } catch (AuthenticationException ae) {
        	return "redirect:/admin";
        }*/
        
    }
}
