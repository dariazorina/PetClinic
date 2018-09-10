package com.mkyong.web.service;

import org.springframework.security.core.GrantedAuthority;


import com.mkyong.web.dao.ClientDAO;
import com.mkyong.web.dao.DoctorDAO;
import com.mkyong.web.dao.SystemUserDAO;
import com.mkyong.web.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService {

    public static final String CLIENT = "ROLE_CLIENT";
    public static final String DOCTOR = "ROLE_DOCTOR";
    public static final String ADMIN = "ROLE_ADMIN";


//    @Autowired
//    private ClientDAO clientDAO;
//    @Autowired
//    private DoctorDAO doctorDAO;

    @Autowired
    private SystemUserDAO systemUserDAO;
//


    @Transactional
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        SystemUser systemUser = systemUserDAO.findByLogin(login);


        if (systemUser != null) {
            Collection<GrantedAuthority> authorities = new LinkedList<>();
//            List<SimpleGrantedAuthority> authorities = new LinkedList<>();
            if (systemUser instanceof Client) {
                authorities.add(new SimpleGrantedAuthority(CLIENT));
            }
            if (systemUser instanceof Doctor) {
                authorities.add(new SimpleGrantedAuthority(DOCTOR));
            }
            if (systemUser instanceof Admin) {
                authorities.add(new SimpleGrantedAuthority(ADMIN));
            }

            return new CurrentUser(systemUser.getLogin(), systemUser.getPassword(), authorities, systemUser.getId());
        }

        throw new UsernameNotFoundException("User [" + login + "] not found");
    }


}