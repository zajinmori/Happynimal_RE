package com.test.pet.model.security;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class CustomUserDetails extends User {

    private String nickname;

    public CustomUserDetails(String username, String password, String nickname, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
        this.nickname = nickname;

    }

    public String getNickname() {
        return nickname;
    }
}

