package com.booking.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.transaction.annotation.Transactional;

import com.booking.authentication.MyUserDetailsService;

@Configuration
@EnableWebSecurity
@Transactional
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

 
   @Autowired
   private MyUserDetailsService myUserDetailsService;

   @Autowired
   public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
 
       // Các User trong bộ nhớ (MEMORY).

//       auth.inMemoryAuthentication().withUser("user1").password("12345").roles("USER");
//       auth.inMemoryAuthentication().withUser("admin1").password("12345").roles("USER, ADMIN");
 
       // Các User trong Database
       auth.userDetailsService(myUserDetailsService);

   }

   @Override
   protected void configure(HttpSecurity http) throws Exception {

       http.csrf().disable();

 
       // Các trang không yêu cầu login
       http.authorizeRequests().antMatchers("/", "/welcome", "/loginRegis", "/logout").permitAll();
 
       // Trang /userInfo yêu cầu phải login với vai trò USER hoặc ADMIN.
       // Nếu chưa login, nó sẽ redirect tới trang /login.
       http.authorizeRequests().antMatchers("/userInfo").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')");
 
       // Trang chỉ dành cho ADMIN
       http.authorizeRequests().antMatchers("/admin/*").access("hasRole('ROLE_ADMIN')");
       http.authorizeRequests().antMatchers("/employee/*").access("hasAnyRole('ROLE_ADMIN', 'ROLE_EMPLOYEE')");
 
       // Khi người dùng đã login, với vai trò XX.
       // Nhưng truy cập vào trang yêu cầu vai trò YY,
       // Ngoại lệ AccessDeniedException sẽ ném ra.
       http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
 
       // Cấu hình cho Login Form.
       http.authorizeRequests().and().formLogin()//
    
               // Submit URL của trang login
               .loginProcessingUrl("/j_spring_security_check") // Submit URL
               .loginPage("/loginRegis")//
               .defaultSuccessUrl("/trang-chu")//
               .failureUrl("/login?error=true")//
               .usernameParameter("username")//
               .passwordParameter("password")
               
               // Cấu hình cho Logout Page.
               .and().logout().logoutUrl("/logout").logoutSuccessUrl("/loginRegis");

   }
}
