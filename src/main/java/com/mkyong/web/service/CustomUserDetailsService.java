package com.mkyong.web.service;


import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService {

    public static final String USER = "ROLE_USER";
    public static final String DOCTOR = "ROLE_DOCTOR";


//    @Autowired
//    private UserDAO userDAO;


    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {


//        try {
        if ("Anton".equals(login)) {
            List<SimpleGrantedAuthority> authorities = new LinkedList<>();
            authorities.add(new SimpleGrantedAuthority(USER));
            return new org.springframework.security.core.userdetails.User("Anton", "111", authorities);
        } else if ("Dasha".equals(login)) {
            LinkedList<SimpleGrantedAuthority> authorities = new LinkedList<>();
            authorities.add(new SimpleGrantedAuthority(DOCTOR));
            return new org.springframework.security.core.userdetails.User("Dasha", "111", authorities);
        }

//        } catch (Exception e) {
//            e.printStackTrace();
        throw new UsernameNotFoundException("User [" + login + "] not found");
//        }
    }


}