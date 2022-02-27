package by.bsuir.web.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;


@Configuration
@EnableWebSecurity
public class WebSystemSecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .inMemoryAuthentication()// enable in memory based authentication with a user named
//                .passwordEncoder(passwordEncoder())// "user" and "admin"
                .withUser("user")
                .password("{noop}user")
                .roles("USER").and()
                .withUser("WORKER")
                .password("{noop}worker")
                .roles("WORKER")
                .and()
                .withUser("admin")
                .password("{noop}admin")
                .roles("ADMIN");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers(HttpMethod.GET, "/").permitAll()
                .antMatchers(HttpMethod.GET, "/services").hasAnyRole("ADMIN", "WORKER")
                .antMatchers(HttpMethod.GET, "/services/add").hasRole("ADMIN").and()
                .csrf().disable()
                .httpBasic()
                .and()
                .formLogin();
    }
}
