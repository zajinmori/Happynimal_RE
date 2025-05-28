package com.test.pet.service;

import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Service;


@Service("memberAuthService")
public class MemberAuthService implements UserDetailsService {

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println("로그인 시도: " + username); //디버깅
        if ("admin".equals(username)) {
            return User.withUsername("admin")
                    .password("1234")
                    .roles("USER")
                    .build();
        } else {
            throw new UsernameNotFoundException("사용자 없음: " + username);
        }
    }
}
