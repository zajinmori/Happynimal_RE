package com.test.pet.security;

import com.test.pet.mapper.AdminMapper;
import com.test.pet.mapper.UserMapper;
import com.test.pet.model.AdminDTO;
import com.test.pet.model.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Service;



import java.util.ArrayList;


@Service
public class MemberAuth implements UserDetailsService {

    // DB에서 정보를 가져오기 위해 주입
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        System.out.println("로그인 시도: " + username); //디버깅


        //권한(ROLE)을 담을 리스트 만들기
        ArrayList<GrantedAuthority> authorities = new ArrayList<>();

        //관리자 테이블에서 찾기
        AdminDTO admin = adminMapper.findByAdminId(username);

        if(admin != null && admin.getStatus() == 0){
            //SimpleGrantedAuthority = Spring Security가 권한을 알게 만들어줌)
            authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));

            return new CustomUserDetails(
                    admin.getId(),
                    admin.getPassword(),
                    admin.getNickname(),
                    authorities
            );
        }


        //일반사용자 테이블에서 찾기
        UserDTO user = userMapper.findByUserId(username);

        if(user != null && user.getStatus() == 1){
            authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
            return new CustomUserDetails(
                    user.getId(),
                    user.getPassword(),
                    user.getNickname(),
                    authorities
            );
        }

       throw new UsernameNotFoundException("사용자를 찾을 수 없습니다: " + username);
    }
}
