package org.javacms.core.security.config;

import org.javacms.core.security.filter.CustomUsernamePasswordAuthenticationFilter;
import org.javacms.core.security.handler.CustomLoginFailHandler;
import org.javacms.core.security.handler.CustomLoginSuccessHandler;
import org.javacms.core.security.handler.CustomLogoutSuccessHandler;
import org.javacms.core.security.userdetails.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.access.AccessDeniedHandler;

@Configuration
@EnableWebSecurity
//@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private CustomUserDetailsService customUserDetailsService;
	
	@Autowired
	private CustomLoginSuccessHandler customLoginSuccessHandler;
	
	@Autowired
	private CustomLogoutSuccessHandler customLogoutSuccessHandler;
	
	private AuthenticationManager authenticationManager;
	
	@Autowired
	private CustomLoginFailHandler customLoginFailHandler;

	@Autowired
	private AccessDeniedHandler accessDenyHandler;
	
	@Override
	@Bean
	public AuthenticationManager authenticationManagerBean() throws Exception {
		//this.authenticationManager = super.authenticationManager();
		this.authenticationManager = super.authenticationManagerBean();
		return this.authenticationManager;
	}
	
	@Autowired
    private CustomUsernamePasswordAuthenticationFilter customUsernamePasswordAuthenticationFilter;
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customUserDetailsService).passwordEncoder(new Md5PasswordEncoder());
		//this.authenticationManager = auth.build();
		//auth.eraseCredentials(false);
	}
	
	@Override
	//@Autowired
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		//config to using the md5 encoder for password encoder to the authentication manager
		auth.userDetailsService(customUserDetailsService).passwordEncoder(new Md5PasswordEncoder());
		//this.authenticationManager = auth.build();
	}
	
	/*@Bean
	@Override
	public AuthenticationManager authenticationManager() throws Exception {
		// TODO Auto-generated method stub
		return this.authenticationManager;
	}*/
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests()
		.antMatchers("/res/**", "/admin", "/thirdparty/**", "/auth/login").permitAll()
		.antMatchers("/admin/**").hasAuthority("admin:index")
		//.antMatchers("/admin/**").hasRole("ADMIN")
		.anyRequest().authenticated()
		.and()
		.addFilter(customUsernamePasswordAuthenticationFilter)
		//.formLogin().loginPage("/admin/login").successHandler(customLoginSuccessHandler).permitAll()
		//the customLoginSuccessHandler could not be involved if the loginProcessingUrl is not be provided
		.formLogin().loginPage("/admin").loginProcessingUrl("/auth/login").successHandler(customLoginSuccessHandler).failureHandler(customLoginFailHandler).permitAll()
		.and()
		.logout().logoutUrl("/admin/logout").logoutSuccessHandler(customLogoutSuccessHandler).logoutSuccessUrl("/admin").invalidateHttpSession(true)
		.and()
		.csrf().disable()
		//void the Load denied by X-Frame-Options:does not permit framing. and frame does not display SAMEORIGIN
		.headers().frameOptions().sameOrigin()
		.and()
		.exceptionHandling().accessDeniedHandler(accessDenyHandler);
		//.and()
		//.addFilter(customUsernamePasswordAuthenticationFilter);
		//.addFilterBefore(customUsernamePasswordAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);
	}

	

	@Override
	@Bean
	protected UserDetailsService userDetailsService() {
		// TODO Auto-generated method stub
		return customUserDetailsService;
	}
	
	
	
	@Configuration
    @Order(1)
	public static class SoapWebSecurityConfig extends WebSecurityConfigurerAdapter {
        @Override
        protected void configure(HttpSecurity http) throws Exception {
            http.antMatcher("/ws/**")
                    .authorizeRequests()
                    .anyRequest().hasAuthority("soap")
                    .and()
                    .httpBasic()
            .and()
            .csrf().disable();
        }
    }

}
